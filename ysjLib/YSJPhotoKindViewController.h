//
//  YSJPhotoKindViewController.h
//  ysjLib
//
//  Created by ysj on 16/7/26.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "YSJViewController.h"
typedef NS_ENUM(NSInteger, ShowType) {
    showTypeList = 1,
    showTypeDetail
};

typedef void (^PicsSelectdOption)(NSArray *assetArr);

@interface YSJPhotoKindViewController : YSJViewController

- (instancetype)initWithShowType:(ShowType)showType Option:(PicsSelectdOption)option;

@end
