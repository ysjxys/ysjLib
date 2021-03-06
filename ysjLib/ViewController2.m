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
#import "UIBarButtonItem+YSJ.h"
#import "TestNavigationViewController.h"
#import "YSJNavigationView.h"
#import "UIImage+YSJ.h"

@interface ViewController2 ()
@property (nonatomic, strong) ChildViewController *childVC;
@property (nonatomic, strong) ChildViewController2 *childVC2;
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CALayer *headerBg = [[CALayer alloc] init];
    headerBg.contents = (__bridge id)[UIImage imageNamed:@"home_bg_blue"].CGImage;
    headerBg.frame = CGRectMake(0, 0, ScreenWidth, 252);
    [self.view.layer addSublayer:headerBg];
    
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(150, 80, 20, 20);
    [self.view addSubview:btn];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(40, 200, 240, 240)];
    view.backgroundColor = [UIColor blackColor];
    view.clipsToBounds = YES;
    [self.view addSubview:view];
    
    UIButton *exchangeBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 500, 80, 40)];
    [exchangeBtn setTitle:@"exchangeBtn" forState:UIControlStateNormal];
    [exchangeBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [exchangeBtn setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:exchangeBtn];
    [exchangeBtn addTarget:self action:@selector(exchangeBtnSelect) forControlEvents:UIControlEventTouchUpInside];
    
    
    ChildViewController *childVC = [[ChildViewController alloc]init];
    self.childVC = childVC;
    ChildViewController2 *childVC2 = [[ChildViewController2 alloc]init];
    self.childVC2 = childVC2;
    
    [self addChildViewController:childVC];
    [self addChildViewController:childVC2];
    
    [view addSubview:childVC.view];
//    [view addSubview:childVC2.view];

    
    self.navigationController.navigationBar.hidden = YES;
    YSJNavigationView *nav = [[YSJNavigationView alloc] initWithTitle:@"我是标题" leftSelectBlock:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [nav addRightBtnWithTitle:@"push" selectBlock:^{
        TestNavigationViewController *testNavVC = [[TestNavigationViewController alloc] init];
        [self.navigationController pushViewController:testNavVC animated:YES];
    }];
    [nav addRightBtnWithImage:[UIImage imageNamed:@"tick"] selectBlock:^{
        TestNavigationViewController *testNavVC = [[TestNavigationViewController alloc] init];
        [self.navigationController pushViewController:testNavVC animated:YES];
    }];
    
    [self.view addSubview:nav];
}

- (void)willMoveToParentViewController:(UIViewController *)parent{
    NSLog(@"willMoveToParentViewController");
}

- (void)exchangeBtnSelect {
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSLog(@"documentPath:%@", documentPath);
    
    [self showAllFileWithPath:documentPath];
}

- (void)showAllFileWithPath:(NSString *)path {
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL isDir = NO;
    [fileManager fileExistsAtPath:path isDirectory:&isDir];
    
    if (isDir) {
        NSString *subPath = nil;
        NSArray *fileNameArr = [fileManager contentsOfDirectoryAtPath:path error:nil];
        for (NSString *str in fileNameArr) {
            subPath = [path stringByAppendingPathComponent:str];
            BOOL issubDir = NO;
            [fileManager fileExistsAtPath:subPath isDirectory:&issubDir];
            [self showAllFileWithPath:subPath];
        }
    }else{
        NSString *oriName = [path lastPathComponent];
        oriName = [oriName stringByReplacingOccurrencesOfString:@"\\" withString:@"_"];
        oriName = [oriName stringByReplacingOccurrencesOfString:@"／" withString:@"_"];
        oriName = [oriName stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
        oriName = [oriName stringByReplacingOccurrencesOfString:@" " withString:@"_"];
        oriName = [oriName stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
        oriName = [oriName stringByReplacingOccurrencesOfString:@"(" withString:@"_"];
        oriName = [oriName stringByReplacingOccurrencesOfString:@"" withString:@""];
        
        NSString *newPath = [[path stringByDeletingLastPathComponent] stringByAppendingPathComponent:oriName];
        [fileManager moveItemAtPath:path toPath:newPath error:nil];
    }
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
