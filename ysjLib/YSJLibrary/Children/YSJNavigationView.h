//
//  YSJNavigationView.h
//  ysjLib
//
//  Created by ysj on 2019/3/18.
//  Copyright © 2019 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface YSJNavigationView : UIView

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UILabel *lineLabel;

@property (nonatomic, copy) void (^leftBtnSelectBlock) (void);
@property (nonatomic, copy) void (^rightBtnSelectBlock) (void);


- (instancetype)initWithTitle:(NSString *)title leftSelectBlock:(nullable void (^)(void))leftSelectBlock;
- (void)addRightBtnWithTitle:(NSString *)title selectBlock:(void (^)(void))selectBlock;
- (void)addRightBtnWithImage:(UIImage *)image selectBlock:(void (^)(void))selectBlock;



@end

