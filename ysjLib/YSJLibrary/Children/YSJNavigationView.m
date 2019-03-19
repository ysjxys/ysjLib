//
//  YSJNavigationView.m
//  ysjLib
//
//  Created by ysj on 2019/3/18.
//  Copyright © 2019 Harry. All rights reserved.
//

#import "YSJNavigationView.h"
#import "UIViewController+YSJ.h"
#import "UIColor+YSJ.h"

@implementation YSJNavigationView

- (instancetype)initWithTitle:(NSString *)title leftSelectBlock:(nullable void (^)(void))leftSelectBlock {
    if (self = [super init]) {
        [self initViews];
        self.titleLabel.text = title;
        self.leftBtnSelectBlock = leftSelectBlock;
    }
    return self;
}

- (void)addRightBtnWithTitle:(NSString *)title selectBlock:(void (^)(void))selectBlock {
    
    if (!self.rightBtn) {
        self.rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 50, self.leftBtn.frame.origin.y, 50, self.leftBtn.frame.size.height - 0.5)];
        [self.rightBtn setTitle:title forState:UIControlStateNormal];
        self.rightBtn.backgroundColor = [UIColor clearColor];
        [self.rightBtn addTarget:self action:@selector(rightBtnSelect) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rightBtn];
    }
    
    [self.rightBtn setImage:nil forState:UIControlStateNormal];
    [self.rightBtn setTitle:title forState:UIControlStateNormal];
    
    self.rightBtnSelectBlock = selectBlock;
}

- (void)addRightBtnWithImage:(UIImage *)image selectBlock:(void (^)(void))selectBlock {
    
    if (!self.rightBtn) {
        self.rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.frame.size.width - 50, self.leftBtn.frame.origin.y, 50, self.leftBtn.frame.size.height - 0.5)];
        [self.rightBtn setImage:image forState:UIControlStateNormal];
        
        self.rightBtn.backgroundColor = [UIColor clearColor];
        [self.rightBtn addTarget:self action:@selector(rightBtnSelect) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:self.rightBtn];
    }
    
    [self.rightBtn setTitle:@"" forState:UIControlStateNormal];
//    self.rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 10);
    [self.rightBtn setImage:image forState:UIControlStateNormal];
    
    self.rightBtnSelectBlock = selectBlock;
}

- (void)initViews {
    CGFloat screenWidth = [[UIScreen mainScreen] bounds].size.width;
    CGFloat screenHeight = [[UIScreen mainScreen] bounds].size.height;
    BOOL isX = (screenWidth == 414 && screenHeight == 896) || (screenWidth == 375 && screenHeight == 812);
    CGFloat height = isX ? 88 : 64;
    CGFloat y = isX ? 44 : 20;
    
    self.frame = CGRectMake(0, y, screenWidth, height);
    self.backgroundColor = [UIColor clearColor];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((screenWidth - 150) / 2, 0, 150, height)];
    self.titleLabel.backgroundColor = [UIColor clearColor];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    [self addSubview:self.titleLabel];
    
    self.leftBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 50, height)];
    [self.leftBtn setImage:[UIImage imageNamed:@"btn_Left"] forState:UIControlStateNormal];
    self.leftBtn.backgroundColor = [UIColor clearColor];
    [self.leftBtn addTarget:self action:@selector(leftBtnSelect) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.leftBtn];
    
    
    self.lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, height - 0.5, screenWidth, 0.5)];
    self.lineLabel.backgroundColor = [UIColor fromHex:@"dde1e7"];
    [self addSubview:self.lineLabel];
    
}

- (void)leftBtnSelect {
    if (self.leftBtnSelectBlock) {
        self.leftBtnSelectBlock();
    }else {
        [[UIViewController getCurrentVC].navigationController popViewControllerAnimated:YES];
    }
}
- (void)rightBtnSelect {
    if (self.rightBtnSelectBlock) {
        self.rightBtnSelectBlock();
    }
}


@end
