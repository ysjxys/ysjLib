//
//  TestNavigationViewController.m
//  ysjLib
//
//  Created by ysj on 2019/3/19.
//  Copyright © 2019 Harry. All rights reserved.
//

#import "TestNavigationViewController.h"
#import "YSJNavigationView.h"

@interface TestNavigationViewController ()

@end

@implementation TestNavigationViewController

//-(void)viewWillAppear:(BOOL)animated {
//    [super viewWillAppear:animated];
//    self.navigationController.navigationBar.hidden = YES;
//}
//
//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    self.navigationController.navigationBar.hidden = NO;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    YSJNavigationView *nav = [[YSJNavigationView alloc] initWithTitle:@"我是标题" leftSelectBlock:^{
        [self.navigationController popViewControllerAnimated:YES];
    }];
    [self.view addSubview:nav];
}


@end
