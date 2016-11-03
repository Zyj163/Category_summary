//
//  NSFileManager+Extension.m
//  Walker
//
//  Created by zhangyongjun on 16/1/24.
//  Copyright © 2016年 xitong. All rights reserved.
//

#import "NSFileManager+Extension.h"
#import "ZipArchive.h"

@implementation NSFileManager (Extension)

+ (NSInteger)getPath:(NSString *)path sizeWithCompletion:(void(^)())completion {
    return [self getPath:path sizeWithCompletion:completion forFileType:nil];
}

+ (void)clearPath:(NSString *)path withCompletion:(void(^)())completion {
    [self clearPath:path withCompletion:completion forFileType:nil];
}

+ (void)clearPath:(NSString *)path {
    [self clearPath:path withCompletion:nil];
}

+ (NSInteger)getPathSize:(NSString *)path {
    return [self getPath:path sizeWithCompletion:nil];
}

+ (NSArray *)searchPath:(NSString *)path forFileType:(NSString *)fileType {
    NSMutableArray *resultArr = [NSMutableArray array];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    
    NSArray *subPaths = [fileMgr subpathsAtPath:path];//获取所有子路径内容
    for (NSString *subPath in subPaths) {
        NSString *fullPath = [path stringByAppendingPathComponent:subPath];
        BOOL directory = NO;
        if ([fileMgr fileExistsAtPath:fullPath isDirectory:&directory]) {
            if (directory == NO) {
                
                if (fileType.length > 0) {
                    if (![fullPath hasSuffix:fileType]) {
                        continue;
                    }
                }
                
                [resultArr addObject:fullPath];
            }
            else {
                NSArray *arr = [self searchPath:path forFileType:fileType];
                [resultArr addObjectsFromArray:arr];
            }
        }
    }
    return resultArr;
}

+ (NSInteger)getPath:(NSString *)path sizeWithCompletion:(void(^)())completion forFileType:(NSString *)fileType {
    if (path.length == 0) {
        return 0;
    }
    __block NSInteger totalSize = 0;
    __block NSMutableArray *cachesArr = [NSMutableArray array];
    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSFileManager *fileMgr = [NSFileManager defaultManager];
        BOOL isDirectory = NO;
        if ([fileMgr fileExistsAtPath:path isDirectory:&isDirectory]) {//判断路径是否存在
            if (isDirectory) {//判断是否是文件 no代表是文件
                //path下的直接内容
                //NSArray *contents = [fileMgr contentsOfDirectoryAtPath:path error:nil];
                NSArray *arr = [self searchPath:path forFileType:fileType];
                [cachesArr addObjectsFromArray:arr];
                
                [cachesArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                    totalSize += [[fileMgr attributesOfItemAtPath:obj error:nil][NSFileSize]integerValue];
                }];
                
            }else {
                
                if (fileType.length > 0) {
                    if (![path hasSuffix:fileType]) {
                        return ;
                    }
                }
                
                totalSize += [[fileMgr attributesOfItemAtPath:path error:nil][NSFileSize]integerValue];
            }
        }
        if (completion) {
            dispatch_async(dispatch_get_main_queue(), ^{
                completion();
            });
        }
    });
    return totalSize;
}


+ (void)clearPath:(NSString *)path withCompletion:(void(^)())completion forFileType:(NSString *)fileType {
    if (path.length == 0) {
        return;
    }
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if (!fileType || fileType.length == 0) {
        [fileMgr removeItemAtPath:path error:nil];
        if (completion) {
            completion();
        }
        return;
    }
    __block NSMutableArray *removeArr = [NSMutableArray array];
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        BOOL isDirectory = NO;
        if ([fileMgr fileExistsAtPath:path isDirectory:&isDirectory]) {//判断路径是否存在
            if (isDirectory) {//判断是否是文件 no代表是文件
                //path下的直接内容
                NSArray *arr = nil;
                arr = [self searchPath:path forFileType:fileType];
                [removeArr addObjectsFromArray:arr];
                
            }else {
                
                if (![path hasSuffix:fileType]) {
                    return;
                }
                
                [removeArr addObject:path];
            }
        }
        __block NSError *removeError;
        [removeArr enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            [fileMgr removeItemAtPath:obj error:&removeError];
            if (removeError) {
                NSLog(@"移除失败：%@",removeError);
            }
            if (stop && completion) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completion();
                });
            }
        }];
    });
    
}

+ (NSArray *)arrFromJson:(NSString *)jsonFile {
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if (![fileMgr fileExistsAtPath:jsonFile]) return nil;
    NSData *configData = [NSData dataWithContentsOfFile:jsonFile];
    NSError *error;
    NSArray *arr = [NSJSONSerialization JSONObjectWithData:configData options:NSJSONReadingMutableLeaves error:&error];
    if (error) {
        NSLog(@"arrFromJson---%@",error);
    }
    return arr;
}

+ (NSDictionary *)dicFromJson:(NSString *)jsonFile {
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if (![fileMgr fileExistsAtPath:jsonFile]) return nil;
    NSData *configData = [NSData dataWithContentsOfFile:jsonFile];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:configData options:NSJSONReadingMutableLeaves error:&error];
    if (error) {
        NSLog(@"dicFromJson---%@",error);
    }
    return dic;
}

+ (id)arrOrDicFromJson:(NSString *)jsonFile {
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if (![fileMgr fileExistsAtPath:jsonFile]) return nil;
    NSData *configData = [NSData dataWithContentsOfFile:jsonFile];
    NSError *error;
    id result = [NSJSONSerialization JSONObjectWithData:configData options:NSJSONReadingMutableLeaves error:&error];
    if (error) {
        NSLog(@"arrOrDicFromJson---%@",error);
    }
    return result;
}

+ (void)createIfNotExist:(NSString *)path {
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    if (![fileMgr fileExistsAtPath:path]) {
        [fileMgr createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

static NSLock *_lock;
+ (void)dealWithNewZip:(NSString *)filePath unzipFile:(NSString *)unzipFile completionHandler:(void(^)(BOOL success))completionHandler {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _lock = [[NSLock alloc]init];
    });
    [_lock lock];
    //解压
    ZipArchive *zipArchive = [[ZipArchive alloc] init];
    
    if ([zipArchive UnzipOpenFile:filePath]) {
        if ([zipArchive UnzipFileTo:unzipFile overWrite:YES]) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                //删除zip包
                [self clearPath:filePath];
                //删除垃圾文件
                [self clearPath:unzipFile withCompletion:^{
                    [_lock unlock];
                } forFileType:@"__MACOSX"];
            });
            if (completionHandler) {
                completionHandler(YES);
            }
        }else {
            if (completionHandler) {
                completionHandler(NO);
            }
            [_lock unlock];
        }
    }else {
        if (completionHandler) {
            completionHandler(NO);
        }
        [_lock unlock];
    }
}


@end
