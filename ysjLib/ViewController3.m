//
//  ViewController3.m
//  ysjLib
//
//  Created by ysj on 16/7/18.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "ViewController3.h"
#import "YSJScrollRoundView.h"
#import "UIBarButtonItem+YSJ.h"
#import "ScreenDirectionViewController.h"

@interface ViewController3 ()
@property (nonatomic, strong) UISegmentedControl *segmentColor;
@property (nonatomic, strong) UISegmentedControl *segmentHide;
@property (nonatomic, strong) UISegmentedControl *segmentAnimation;
@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    NSArray *arr = @[@"0首页-3景点门票.jpg",@"0首页-2旅游攻略.jpg",@"0首页-1杭州风貌.jpg",@"0首页-4杭州住宿.jpg"];
    [self setBackBtnText:@"不转了"];
    
    YSJScrollRoundView *scrllRound = [YSJScrollRoundView viewWithRect:CGRectMake(0, 200, 320, 200) imgsStrArr:arr autoRun:YES timeInterval:2.0 imgSelectedHandle:^(NSUInteger index) {
        NSLog(@"index:%lu",(unsigned long)index);
    }];
    [self.view addSubview:scrllRound];
    
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"转屏" color:[UIColor blackColor] textSize:16 bounds: CGRectMake(0, 0, 50, 40) alignment:UIControlContentHorizontalAlignmentLeft target:self action:@selector(rightBarItemClicked)];
    
    [self initTitleBtnView];
    [self initSegmentView];
}

- (void)rightBarItemClicked{
    [self.navigationController pushViewController:[[ScreenDirectionViewController alloc]init] animated:YES];
}

- (void)initTitleBtnView{
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    CGFloat distance = 7.0f;
    titleBtn.frame = CGRectMake(distance, distance, HeightNavBar-distance*2, HeightNavBar-distance*2);
    [titleBtn setImage:[UIImage imageNamed:@"0首页-3景点门票.jpg"] forState:UIControlStateNormal];
    [titleBtn setImage:[UIImage imageNamed:@"0首页-2旅游攻略.jpg"] forState:UIControlStateSelected];
    [titleBtn setImage:[UIImage imageNamed:@"0首页-1杭州风貌.jpg"] forState:UIControlStateHighlighted];
    
    [self navigationItemTitleViewWithButton:titleBtn option:^(UIButton *btn) {
        NSLog(@"selected");
    }];
}
- (void)initSegmentView{
    CGFloat width = 50;
    UISegmentedControl *segmentColor = [[UISegmentedControl alloc]initWithItems:@[@"White",@"Black"]];
    segmentColor.frame = CGRectMake((self.view.frame.size.width-width*2)/2, 20, width*2, 40);
    [self.view addSubview:segmentColor];
    [segmentColor addTarget:self action:@selector(segmentColorSelected:) forControlEvents:UIControlEventValueChanged];
    self.segmentColor = segmentColor;
    
    UISegmentedControl *segmentHide = [[UISegmentedControl alloc]initWithItems:@[@"Show",@"Hide"]];
    segmentHide.frame = CGRectMake((self.view.frame.size.width-width*2)/2, 80, width*2, 40);
    [self.view addSubview:segmentHide];
    [segmentHide addTarget:self action:@selector(segmentHideSelected:) forControlEvents:UIControlEventValueChanged];
    self.segmentHide = segmentHide;
    
    UISegmentedControl *segmentAnimation = [[UISegmentedControl alloc]initWithItems:@[@"None",@"Fade",@"Slide"]];
    segmentAnimation.frame = CGRectMake((self.view.frame.size.width-width*3)/2, 140, width*3, 40);
    [self.view addSubview:segmentAnimation];
    [segmentAnimation addTarget:self action:@selector(segmentAnimationSelected:) forControlEvents:UIControlEventValueChanged];
    self.segmentAnimation = segmentAnimation;
    
    segmentColor.selectedSegmentIndex = 0;
    segmentHide.selectedSegmentIndex = 0;
    segmentAnimation.selectedSegmentIndex = 0;
    
    [self segmentColorSelected:_segmentColor];
    [self segmentColorSelected:_segmentHide];
    [self segmentAnimationSelected:_segmentAnimation];
}

- (void)segmentColorSelected:(UISegmentedControl *)segmentColor{
    [self setStatusBarStyle:segmentColor.selectedSegmentIndex==0?UIStatusBarStyleLightContent:UIStatusBarStyleDefault];
}

- (void)segmentHideSelected:(UISegmentedControl *)segmentHide{
    [self setStatusBarHidden:segmentHide.selectedSegmentIndex==0?NO:YES];
}

- (void)segmentAnimationSelected:(UISegmentedControl *)segmentAnimation{
    if (segmentAnimation.selectedSegmentIndex == 0) {
        [self setStatusBarHideAnimation:UIStatusBarAnimationNone];
    }else if (segmentAnimation.selectedSegmentIndex == 1){
        [self setStatusBarHideAnimation:UIStatusBarAnimationFade];
    }else{
        [self setStatusBarHideAnimation:UIStatusBarAnimationSlide];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
