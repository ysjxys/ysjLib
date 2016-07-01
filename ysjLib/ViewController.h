//
//  ViewController.h
//  ysjLib
//
//  Created by ysj on 15/12/4.
//  Copyright © 2015年 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^testBlock)(int num, NSString *name);

@interface ViewController : UIViewController

@property (nonatomic, copy) testBlock myBlock;

@end

