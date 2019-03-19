//
//  DomoTableView.h
//  ysjLib
//
//  Created by ysj on 2019/3/18.
//  Copyright © 2019 Harry. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DamoModel;

@interface DamoTableView : UIView

@property (nonatomic, strong) NSMutableArray *dataList;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) void (^cancelBlock) (void);
@property (nonatomic, copy) void (^selectBlock) (NSInteger index, DamoModel *damoModel);

- (instancetype)initWithDataList:(NSMutableArray <DamoModel *> *)dataList;

- (void)showDamoTableView;
- (void)hideDamoTableView;

@end

