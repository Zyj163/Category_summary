//
//  NSObject+LogWithIvar.h
//  Voicedin
//
//  Created by zhangyj on 15-11-2.
//  Copyright (c) 2015年 xitong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (LogWithIvar)

/**
 *  打印对象内部属性的值
 */
- (void)logWithIvar;
/**
 *  用otherobj覆盖与该对象属性名称相同的属性的值
 *
 *  @param otherObj 其他对象
 *
 *  @return 是否实现覆盖（没有相同属性名，返回NO；otherobj中属性值为空，返回NO）
 */
- (BOOL)objsIvarSameToObj:(NSObject *)otherObj;
@end
