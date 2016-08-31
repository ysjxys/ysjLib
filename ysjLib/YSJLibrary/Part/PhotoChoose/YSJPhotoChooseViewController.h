//
//  YSJPhotoChooseViewController.h
//  ysjLib
//
//  Created by ysj on 16/7/28.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "YSJViewController.h"
#import <Photos/Photos.h>
#import "YSJPhotoKindViewController.h"



@interface YSJPhotoChooseViewController : YSJViewController

- (instancetype)initWithAssetCollection:(PHAssetCollection *)assetCollection showType:(ShowType)showType option:(PicsSelectdOption)option;

@end
