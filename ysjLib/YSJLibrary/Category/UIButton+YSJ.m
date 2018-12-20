//
//  UIButton+YSJ.m
//  ysjLib
//
//  Created by ysj on 2018/4/19.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import "UIButton+YSJ.h"
#import "UIImage+YSJ.h"
#import <objc/runtime.h>

static const char topNameKey;
static const char leftNameKey;
static const char bottomNameKey;
static const char rightNameKey;

@implementation UIButton (YSJ)

/**
 *  设定各个状态下的UIButton背景色
 */
- (void)setBackgroundColor:(UIColor *)color forState:(UIControlState)state {
    [self setBackgroundImage:[UIImage imageWithColor:color] forState:state];
}

/**
 *  修改按钮判定范围，四周判定区域为edge
 **/
- (void)setEnlargeEdge:(CGFloat)edge {
    [self setEnlargeEdgeWithTop:edge left:edge bottom:edge right:edge];
}

/**
 *  修改按钮判定范围
 **/
- (void)setEnlargeEdgeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right {
    objc_setAssociatedObject(self, &topNameKey, [NSNumber numberWithFloat:top], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &leftNameKey, [NSNumber numberWithFloat:left], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &bottomNameKey, [NSNumber numberWithFloat:bottom], OBJC_ASSOCIATION_COPY_NONATOMIC);
    objc_setAssociatedObject(self, &rightNameKey, [NSNumber numberWithFloat:right], OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (CGRect)enlargeRect {
    NSNumber *topEdge = objc_getAssociatedObject(self, &topNameKey);
    NSNumber *leftEdge = objc_getAssociatedObject(self, &leftNameKey);
    NSNumber *bottomEdge = objc_getAssociatedObject(self, &bottomNameKey);
    NSNumber *rightEdge = objc_getAssociatedObject(self, &rightNameKey);
    
    CGFloat topExtra = topEdge ? [topEdge floatValue] : 0;
    CGFloat leftExtra = leftEdge ? [leftEdge floatValue] : 0;
    CGFloat bottomExtra = bottomEdge ? [bottomEdge floatValue] : 0;
    CGFloat rightExtra = rightEdge ? [rightEdge floatValue] : 0;
    
    CGFloat x = self.bounds.origin.x - leftExtra;
    CGFloat y = self.bounds.origin.y - topExtra;
    CGFloat width = self.bounds.size.width + leftExtra + rightExtra;
    CGFloat height = self.bounds.size.height + topExtra + bottomExtra;
    
    return CGRectMake(x, y, width, height);
}

- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event {
    CGRect rect = [self enlargeRect];
    if (CGRectEqualToRect(rect, self.bounds)) {
        return [super pointInside:point withEvent:event];
    }
    return CGRectContainsPoint(rect, point);
}

@end
