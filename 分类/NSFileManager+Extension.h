//
//  NSFileManager+Extension.h
//  Walker
//
//  Created by zhangyongjun on 16/1/24.
//  Copyright © 2016年 xitong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Extension)

/**
 *  获取一个路径下的所有文件大小
 *
 *  @param completion  完成后
 *  @return NSInteger 返回计算大小
 */
+ (NSInteger)getPath:(NSString *)path sizeWithCompletion:(void(^)())completion;
/**
 *  清除一个路径下的所有文件
 *
 *  @param completion  完成后
 */
+ (void)clearPath:(NSString *)path withCompletion:(void(^)())completion;
/**
 *  获取一个路径下的所有文件大小
 *
 *  @return NSInteger 返回计算大小
 */
+ (NSInteger)getPathSize:(NSString *)path;
/**
 *  清除一个路径下的所有文件
 *
 */
+ (void)clearPath:(NSString *)path;
/**
 *  按照文件类型（以fileType结尾）获取一个路径下的所有文件大小
 *
 *  @param completion  计算完成后
 *  @param fileType    文件类型
 *  @return NSInteger 返回计算大小
 */
+ (NSInteger)getPath:(NSString *)path sizeWithCompletion:(void(^)())completion forFileType:(NSString *)fileType;
/**
 *  按照文件类型（以fileType结尾）清除一个路径下的所有文件
 *
 *  @param completion  计算完成后
 *  @param fileType    文件类型
 */
+ (void)clearPath:(NSString *)path withCompletion:(void(^)())completion forFileType:(NSString *)fileType;
/**
 *  搜索一个路径下以fileType结尾的文件
 *
 *  @param path  给定路径
 *  @param fileType  文件类型
 *  @return NSArray 返回数组
 */
+ (NSArray *)searchPath:(NSString *)path forFileType:(NSString *)fileType;
/**
 *  转换json文件为字典对象
 */
+ (NSDictionary *)dicFromJson:(NSString *)jsonFile;
/**
 *  转换json文件为数组对象
 */
+ (NSArray *)arrFromJson:(NSString *)jsonFile;
/**
 *  转换json文件为字典/数组对象
 */
+ (id)arrOrDicFromJson:(NSString *)jsonFile;
/**
 *  解压文件到指定路径
 *
 *  @param filePath          压缩文件路径
 *  @param unzipFile         解压文件路径
 *  @param completionHandler 操作完成
 */
+ (void)dealWithNewZip:(NSString *)filePath unzipFile:(NSString *)unzipFile completionHandler:(void(^)(BOOL success))completionHandler;
/**
 *  创建路径如果路径不存在
 *
 *  @param path 目标路径
 */
+ (void)createIfNotExist:(NSString *)path;
@end
