//
//  YSJScrollRoundView.m
//  ysjLib
//
//  Created by ysj on 16/7/22.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "YSJScrollRoundView.h"

@interface YSJScrollRoundView()<UIScrollViewDelegate>

@property (nonatomic, strong) NSArray *viewArr;
@property (nonatomic, strong) NSArray *imgsArr;
@property (nonatomic, assign) CGFloat frameWidth;

@property (nonatomic, strong) UIImageView *imgViewLeft;
@property (nonatomic, strong) UIImageView *imgViewCenter;
@property (nonatomic, strong) UIImageView *imgViewRight;

@property (nonatomic, strong) UIScrollView *scrollView;
@end

@implementation YSJScrollRoundView

+ (instancetype)viewWithRect:(CGRect)rect imgsStrArr:(NSArray *)imgsStrArr{
    NSMutableArray *tempArr = [NSMutableArray array];
    for (int i = 0; i < imgsStrArr.count; i++) {
        UIImage *image = [UIImage imageNamed:imgsStrArr[i]];
        [tempArr addObject:image];
    }
    return [self viewWithRect:rect imgsArr:tempArr];
}

+ (instancetype)viewWithRect:(CGRect)rect imgsArr:(NSArray *)imgsArr{
    YSJScrollRoundView *view = [[YSJScrollRoundView alloc]initWithFrame:rect];
    view.frameWidth = rect.size.width;
    
    UIScrollView *scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
    scroll.contentSize = CGSizeMake(view.frameWidth*3, 0);
    scroll.contentOffset = CGPointMake(view.frameWidth, 0);
    scroll.pagingEnabled = YES;
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.delegate = view;
    view.scrollView = scroll;
    [view addSubview:scroll];
    
    view.imgsArr = imgsArr;
    view.viewArr = [view viewArrInit:rect.size imgsArr:imgsArr];
    
    return view;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    [self scrollEnabled:NO];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self changePic];
}

- (NSMutableArray *)viewArrInit:(CGSize)size imgsArr:(NSArray *)imgsArr{
    if (imgsArr.count < 1) {
        return nil;
    }
    NSMutableArray *viewArr = [NSMutableArray array];
    
    UIImageView *imgViewLeft = [[UIImageView alloc]initWithImage:imgsArr[imgsArr.count-1]];
    imgViewLeft.frame = CGRectMake(0, 0, size.width, size.height);
    [viewArr addObject:imgViewLeft];
    [self.scrollView addSubview:imgViewLeft];
    self.imgViewLeft = imgViewLeft;
    
    UIImageView *imgViewCenter = [[UIImageView alloc]initWithImage:imgsArr[0]];
    imgViewCenter.frame = CGRectMake(size.width, 0, size.width, size.height);
    [viewArr addObject:imgViewCenter];
    [self.scrollView addSubview:imgViewCenter];
    self.imgViewCenter = imgViewCenter;
    
    UIImage *rightImg = imgsArr.count>1?imgsArr[1]:imgsArr[0];
    UIImageView *imgViewRight = [[UIImageView alloc]initWithImage:rightImg];
    imgViewRight.frame = CGRectMake(2*size.width, 0, size.width, size.height);
    [viewArr addObject:imgViewRight];
    [self.scrollView addSubview:imgViewRight];
    self.imgViewRight = imgViewRight;
    
    return viewArr;
}

- (void)changePic{
    if (self.scrollView.contentOffset.x == 0) {
        UIImage *showImg = self.imgViewLeft.image;
        NSUInteger showIndex = [self.imgsArr indexOfObject:showImg];
        self.imgViewCenter.image = showImg;
        if (showIndex+1 < self.imgsArr.count) {
            self.imgViewRight.image = self.imgsArr[showIndex+1];
        }else{
            self.imgViewRight.image = self.imgsArr[0];
        }
        self.scrollView.contentOffset = CGPointMake(self.frameWidth, 0);
        if (showIndex == 0) {
            self.imgViewLeft.image = self.imgsArr[self.imgsArr.count-1];
        }else{
            self.imgViewLeft.image = self.imgsArr[showIndex-1];
        }
    }
    if (self.scrollView.contentOffset.x == self.frameWidth*2) {
        UIImage *showImg = self.imgViewRight.image;
        NSUInteger showIndex = [self.imgsArr indexOfObject:showImg];
        self.imgViewCenter.image = showImg;
        if (showIndex == 0) {
            self.imgViewLeft.image = self.imgsArr[self.imgsArr.count-1];
        }else{
            self.imgViewLeft.image = self.imgsArr[showIndex-1];
        }
        self.scrollView.contentOffset = CGPointMake(self.frameWidth, 0);
        if (showIndex+1 < self.imgsArr.count) {
            self.imgViewRight.image = self.imgsArr[showIndex+1];
        }else{
            self.imgViewRight.image = self.imgsArr[0];
        }
    }
    self.scrollView.scrollEnabled = YES;
}

- (void)scrollEnabled:(BOOL)enable{
    self.scrollView.scrollEnabled = enable;
}
@end
