//
//  NSString+Extension.h
//  瀑布流
//
//  Created by zhangyongjun on 15/8/8.
//  Copyright (c) 2015年 张永俊. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface NSString (Extension)
/**
 *  将汉字转换为拼音，空格分开
 *
 *  @return 转换结果
 */
- (NSString *)transformToPinyin;
/**
 *  将汉字转换为拼音，不带空格
 *
 *  @return 转换结果
 */
- (NSString *)transformToPinyinWithoutSpace;
/**
 *  转换成能看懂的字符串
 *
 *  @return 转换结果
 */
- (NSString *)replaceUnicode;

#pragma mark - 加密
@property (readonly) NSString *md5String;
@property (readonly) NSString *sha1String;
@property (readonly) NSString *sha256String;
@property (readonly) NSString *sha512String;

- (NSString *)hmacSHA1StringWithKey:(NSString *)key;
- (NSString *)hmacSHA256StringWithKey:(NSString *)key;
- (NSString *)hmacSHA512StringWithKey:(NSString *)key;

@end
