//
//  YSJViewController.m
//  DOTA2Helper
//
//  Created by ysj on 16/6/6.
//  Copyright © 2016年 yushengjie. All rights reserved.
//

#import "YSJViewController.h"
#import "MBProgressHUD.h"
#import "YSJNavigationController.h"
#import "UIImage+YSJ.h"

@interface YSJViewController ()
@property (nonatomic, copy) ClickedOption titleBtnClickOption;
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property (nonatomic, assign) BOOL isStatusBarHidden;
@property (nonatomic, assign) UIStatusBarAnimation statusBarAnimation;

@property (nonatomic, strong) UINavigationController *selfNavigationController;
@end

@implementation YSJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    _selfNavigationController = self.navigationController;
//    YSJNavigationController *nav = (YSJNavigationController *)self.navigationController;
//    
//    //设置标题颜色与字体
//    [nav setNavigationTitleColor:[UIColor whiteColor] font:[UIFont systemFontOfSize:17.0f]];
//    
//    //设置背景颜色
//    [nav setBackGroundImage:[UIImage imageWithColor:RGBA(38, 46, 56, 1)]];
//    
//    //设置返回键 颜色
//    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    
//    //设置返回键文字内容
//    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
//    backItem.title = @"";
//    self.navigationItem.backBarButtonItem = backItem;
//    
//    //设置statusbar style
//    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

/**
 *  设置标题内容按钮
 */
- (void)navigationItemTitleViewWithButton:(UIButton *)btn option:(ClickedOption)option{
    [btn addTarget:self action:@selector(titleBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = btn;
    _titleBtnClickOption = option;
}

- (void)titleBtnClicked:(UIButton *)btn{
    _titleBtnClickOption(btn);
}

/**
 *  改变statusBarStyle
 */
- (void)setStatusBarStyle:(UIStatusBarStyle)statusBarStyle{
    
    if ([_selfNavigationController isKindOfClass:[YSJNavigationController class]]) {
        YSJNavigationController *nav = (YSJNavigationController *)_selfNavigationController;
        nav.statusBarStyle = statusBarStyle;
        [nav setNeedsStatusBarAppearanceUpdate];
    }
    
    _statusBarStyle = statusBarStyle;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarStyle)preferredStatusBarStyle{
    return _statusBarStyle;
}

/**
 *  改变状态栏是否隐藏
 */
- (void)setStatusBarHidden:(BOOL)shouldHidden{
    self.isStatusBarHidden = shouldHidden;
    [UIView animateWithDuration:0.3 animations:^{
        [self setNeedsStatusBarAppearanceUpdate];
    }];
}

- (BOOL)prefersStatusBarHidden{
    return _isStatusBarHidden;
}

/**
 *  设置状态栏隐藏动画
 */
- (void)setStatusBarHideAnimation:(UIStatusBarAnimation)statusBarAnimation{
    self.statusBarAnimation = statusBarAnimation;
    [self setNeedsStatusBarAppearanceUpdate];
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation{
    return _statusBarAnimation;
}

/**
 *  任意控制器的提示title
 */
+ (void)showHudWithTarget:(id)target title:(NSString *)title{
    MBProgressHUD *HUD = [[MBProgressHUD alloc]initWithView:[(UIViewController *)target view]];
    HUD.labelText = title;
    HUD.customView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"X"]];
    HUD.mode = MBProgressHUDModeCustomView;
    [[(UIViewController *)target view] addSubview:HUD];
    [HUD showAnimated:YES whileExecutingBlock:^{
        sleep(1.5f);
    } completionBlock:^{
        [HUD removeFromSuperview];
    }];
}

/**
 *  提示title
 */
- (void)showHudWithTitle:(NSString *)title{
    [YSJViewController showHudWithTarget:self title:title];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
