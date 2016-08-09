//
//  TableViewCellModel.h
//  ysjLib
//
//  Created by ysj on 16/8/8.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void  (^Option)();

@interface TableViewCellModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) Option option;
@end
