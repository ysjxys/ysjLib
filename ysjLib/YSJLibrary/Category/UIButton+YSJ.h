//
//  UIButton+YSJ.h
//  ysjLib
//
//  Created by ysj on 2018/4/19.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (YSJ)

/**
 *  设定各个状态下的UIButton背景色
 */
- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state;

/**
 *  修改按钮判定范围，四周判定区域为edge
 **/
- (void)setEnlargeEdge:(CGFloat)edge;

/**
 *  修改按钮判定范围
 **/
- (void)setEnlargeEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right;

@end
