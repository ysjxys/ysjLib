//
//  YSJCommonTools.h
//  ysjLib
//
//  Created by ysj on 16/6/28.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YSJCommonTools : NSObject

- (void)setExampleDic:(NSDictionary *)exampleDic;
- (NSDictionary *)exampleDic;


+ (YSJCommonTools *)shareTools;
@end
