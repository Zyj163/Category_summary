//
//  NSObject+LogWithIvar.m
//  Voicedin
//
//  Created by zhangyj on 15-11-2.
//  Copyright (c) 2015年 xitong. All rights reserved.
//

#import "NSObject+LogWithIvar.h"
#import <objc/runtime.h>

@implementation NSObject (LogWithIvar)

- (void)logWithIvar {
    
    unsigned int outCount = 0;
    
    Ivar *ivarList = class_copyIvarList([self class], &outCount);
    
    for (unsigned int i = 0; i < outCount; i ++) {
        Ivar ivar = ivarList[i];
        
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
//        id value = objc_getAssociatedObject(self, (__bridge const void *)(name));
        
        ZJLog(@"%@ = %@", [name substringFromIndex:1], [self valueForKeyPath:name]);
        
    }
    
}

- (BOOL)objsIvarSameToObj:(NSObject *)otherObj {
    if (!otherObj) return NO;
    unsigned int outCount = 0;
    Ivar *ivarList = class_copyIvarList([self class], &outCount);
    int success = 0;
    for (unsigned int i = 0; i < outCount; i ++) {
        Ivar ivar = ivarList[i];
        
        NSString *name = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        id value = [otherObj valueForKeyPath:name];
        if (value) {
            [self setValue:value forKeyPath:name];
            success ++;
        }
    }
    return success;
}

@end
