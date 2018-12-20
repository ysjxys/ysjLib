//
//  TestView.m
//  ysjLib
//
//  Created by ysj on 2018/3/14.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import "TestView.h"

@implementation TestView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
    }
    return self;
}

- (void)doSomethingWithString1:(NSString *)str1 andString2:(NSString *)str2 {
    if ([_delegate performSelector:@selector(testDelegate:withStr2:) withObject:nil]) {
        [_delegate testDelegate:str1 withStr2:str2];
    }
}

@end
