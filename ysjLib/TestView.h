//
//  TestView.h
//  ysjLib
//
//  Created by ysj on 2018/3/14.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol TestViewDelegate <NSObject>

- (void)testDelegate:(NSString *)str1 withStr2:(NSString *)str2;

@end

@interface TestView : UIView

@property(nonatomic, weak) id<TestViewDelegate> delegate;

- (void)doSomethingWithString1:(NSString *)str1 andString2:(NSString *)str2;

@end
