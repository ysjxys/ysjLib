//
//  YSJViewController.h
//  ysjLib
//
//  Created by ysj on 16/6/6.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^ClickedOption)(UIButton *btn);
@interface YSJViewController : UIViewController

/**
 *  任意控制器的提示title
 */
+ (void)showHudWithTarget:(id)target title:(NSString *)title;
/**
 *  提示title
 */
- (void)showHudWithTitle:(NSString *)title;

/**
 *  设置标题内容按钮
 */
- (void)navigationItemTitleViewWithButton:(UIButton *)btn option:(ClickedOption)option;

/**
 *  设置下一ViewController返回按钮文本
 */
- (void)setBackBtnText:(NSString *)text;

/**
 *  改变statusBarStyle
 */
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle;

/**
 *  改变状态栏是否隐藏
 */
- (void)setStatusBarHidden:(BOOL)shouldHidden;

/**
 *  设置状态栏隐藏动画
 */
- (void)setStatusBarHideAnimation:(UIStatusBarAnimation)statusBarAnimation;

@end
