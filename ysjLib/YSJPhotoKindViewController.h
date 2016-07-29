//
//  YSJPhotoKindViewController.h
//  ysjLib
//
//  Created by ysj on 16/7/26.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "YSJViewController.h"
typedef void (^PicsSelectdOption)(NSArray *assetArr);

@interface YSJPhotoKindViewController : YSJViewController

- (instancetype)initWithOption:(PicsSelectdOption)option;

@end
