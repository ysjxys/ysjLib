//
//  NSArray+YSJ.h
//  ysjLib
//
//  Created by ysj on 2018/4/19.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (YSJ)

/**
 *  NSArray转为NSData
 */
- (NSData *)toData;

/**
 *  通过解档（NSKeyedUnarchiver）完全拷贝一份NSArray
 */
+ (NSArray *)fullCopyWithCopyedArray:(NSArray *)copyedArray;

//将json字符串转化为dictionary
+ (NSArray *) toArray:(NSString *)JSONString;

@end
