//
//  ViewController3.m
//  ysjLib
//
//  Created by ysj on 16/7/18.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "ViewController3.h"
#import "YSJScrollView.h"

@interface ViewController3 ()<UIScrollViewDelegate>
@property (nonatomic, strong) YSJScrollView *scroll;
@property (nonatomic, strong) UISegmentedControl *segmentColor;
@property (nonatomic, strong) UISegmentedControl *segmentHide;
@property (nonatomic, strong) UISegmentedControl *segmentAnimation;
@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *arr = @[@"0首页-3景点门票.jpg",@"0首页-2旅游攻略.jpg",@"0首页-1杭州风貌.jpg",@"0首页-4杭州住宿.jpg"];
//    NSArray *arr = @[@"0首页-3景点门票.jpg"];
    
    YSJScrollView *sjs = [YSJScrollView scrollViewWithRect:CGRectMake(0, 400, 320, 100) imgsStrArr:arr];
    [self.view addSubview:sjs];
    sjs.backgroundColor = [UIColor lightGrayColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    sjs.delegate = self;
    self.scroll = sjs;
    
    
    [self initTitleBtnView];
    [self initSegmentView];
}

- (void)initTitleBtnView{
    UIButton *titleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    CGFloat distance = 7.0f;
    titleBtn.frame = CGRectMake(distance, distance, NavigationBarHeight-distance*2, NavigationBarHeight-distance*2);
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
    segmentColor.frame = CGRectMake((self.view.frame.size.width-width*2)/2, 50, width*2, 40);
    [self.view addSubview:segmentColor];
    [segmentColor addTarget:self action:@selector(segmentColorSelected:) forControlEvents:UIControlEventValueChanged];
    self.segmentColor = segmentColor;
    
    UISegmentedControl *segmentHide = [[UISegmentedControl alloc]initWithItems:@[@"Show",@"Hide"]];
    segmentHide.frame = CGRectMake((self.view.frame.size.width-width*2)/2, 150, width*2, 40);
    [self.view addSubview:segmentHide];
    [segmentHide addTarget:self action:@selector(segmentHideSelected:) forControlEvents:UIControlEventValueChanged];
    self.segmentHide = segmentHide;
    
    UISegmentedControl *segmentAnimation = [[UISegmentedControl alloc]initWithItems:@[@"None",@"Fade",@"Slide"]];
    segmentAnimation.frame = CGRectMake((self.view.frame.size.width-width*3)/2, 250, width*3, 40);
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

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self.scroll scrollEnabled:NO];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self.scroll changePic];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
