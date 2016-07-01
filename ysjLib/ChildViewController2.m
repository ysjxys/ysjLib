//
//  ChildViewController2.m
//  ysjLib
//
//  Created by ysj on 16/7/1.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "ChildViewController2.h"

@interface ChildViewController2 ()

@end

@implementation ChildViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor purpleColor];
    
    UIButton *btn =[UIButton buttonWithType:UIButtonTypeContactAdd];
    [btn addTarget:self action:@selector(btnClicked) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(0, 0, 20, 20);
    [self.view addSubview:btn];
}

- (void)willMoveToParentViewController:(UIViewController *)parent{
    NSLog(@"willMove     ChildVC2");
}

- (void)didMoveToParentViewController:(UIViewController *)parent{
    NSLog(@"didMove     ChildVC2");
}

- (void)btnClicked{
    NSLog(@"xxxxxx");
    [self removeFromParentViewController];
    [self.view removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
