//
//  ViewController.h
//  ysjLib
//
//  Created by ysj on 15/12/4.
//  Copyright © 2015年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CSConnectionState) {
    CSConnectionStateDisconnected    = 1 << 0,
    CSConnectionStateConnecting      = 1 << 1,
    CSConnectionStateConnected       = 1 << 2,
};

typedef NS_OPTIONS(NSUInteger, CSDirection) {
    CSDirectionUp    = 1 << 0,
    CSDirectionDown  = 1 << 1,
    CSDirectionLeft  = 1 << 2,
    CSDirectionRight = 1 << 3,
};

@protocol TestDelegate <NSObject>

@end

typedef void (^testBlock)(int, NSString *);

@interface ViewController : UIViewController

@property (nonatomic, copy) testBlock myBlock;
@property (nonatomic, copy) void (^fuckBlock)(int, NSString *);

//@property (nonatomic, copy) void (^longPressHandle)(void);
//@property (nonatomic, copy) void (^cancelAnimationHandle)(void);
//@property (nonatomic, copy) void (^deleteHandle)(NSIndexPath *);

//+ (instancetype)cellWithCollectionView:(UICollectionView *)collection indexPath:(NSIndexPath *)indexPath model:(GameSpeedUpModel *)model isAnimation:(BOOL)isAnimation longPressHandle:(void (^)(void))longPressHandle cancelAnimationHandle:(void (^)(void))cancelAnimationHandle deleteHandle:(void (^)(NSIndexPath *))deleteHandle;

@end

