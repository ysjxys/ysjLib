//
//  YSJCommonTools.m
//  ysjLib
//
//  Created by ysj on 16/6/28.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "YSJCommonTools.h"

@interface YSJCommonTools()
@property (nonatomic, copy) NSDictionary *tempDic;
@end

@implementation YSJCommonTools

+ (YSJCommonTools *)shareTools{
    static YSJCommonTools *commonTools = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        commonTools = [[self alloc] init];
    });
    return commonTools;
}

- (void)setExampleDic:(NSDictionary *)exampleDic{
    _tempDic = exampleDic;
}

- (NSDictionary *)exampleDic{
    return _tempDic;
}


@end
