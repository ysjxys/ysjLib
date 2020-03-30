//
//  UIResponder+YSJ.m
//  ysjLib
//
//  Created by ysj on 2019/4/29.
//  Copyright © 2019 Harry. All rights reserved.
//

#import "UIResponder+YSJ.h"

static __weak id currentFirstResponder;

@implementation UIResponder (YSJ)

+ (id)currentFirstResponder {
    currentFirstResponder = nil;
    // 通过将target设置为nil，让系统自动遍历响应链
    // 从而响应链当前第一响应者响应我们自定义的方法
    [[UIApplication sharedApplication] sendAction:@selector(findFirstResponder:) to:nil from:nil forEvent:nil];
    return currentFirstResponder;
}
- (void)findFirstResponder:(id)sender {
    // 第一响应者会响应这个方法，并且将静态变量wty_currentFirstResponder设置为自己
    currentFirstResponder = self;
}

@end
