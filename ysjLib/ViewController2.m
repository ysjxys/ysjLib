//
//  ViewController2.m
//  ysjLib
//
//  Created by ysj on 16/7/1.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "ViewController2.h"
#import "ChildViewController.h"
#import "ChildViewController2.h"

@interface ViewController2 ()
@property (nonatomic, strong) ChildViewController *childVC;
@property (nonatomic, strong) ChildViewController2 *childVC2;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(150, 80, 20, 20);
    [self.view addSubview:btn];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(40, 200, 240, 240)];
    view.backgroundColor = [UIColor blackColor];
    view.clipsToBounds = YES;
    [self.view addSubview:view];
    
    
    ChildViewController *childVC = [[ChildViewController alloc]init];
    self.childVC = childVC;
    ChildViewController2 *childVC2 = [[ChildViewController2 alloc]init];
    self.childVC2 = childVC2;
    
    [self addChildViewController:childVC];
    [self addChildViewController:childVC2];
    
    [view addSubview:childVC.view];
//    [view addSubview:childVC2.view];
}

- (void)willMoveToParentViewController:(UIViewController *)parent{
    NSLog(@"willMoveToParentViewController");
}

- (void)btnClicked{
//    该方法，执行完以后，fromViewController指代的视图控制器的View将从界面消失；
//    toViewController所指代的视图控制器的View将被载入到页面中
    [self transitionFromViewController:self.childVC toViewController:self.childVC2 duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        NSLog(@"over");
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
