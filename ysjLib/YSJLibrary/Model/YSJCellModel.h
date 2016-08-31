//
//  YSJCellModel.h
//  JiawenClock
//
//  Created by ysj on 16/8/23.
//  Copyright © 2016年 yushengjie. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^SelectedHandle)();

@interface YSJCellModel : NSObject


@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) SelectedHandle selectedHandle;

@end
