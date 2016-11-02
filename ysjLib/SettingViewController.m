//
//  SettingViewController.m
//  JiawenClock
//
//  Created by ysj on 16/9/14.
//  Copyright © 2016年 yushengjie. All rights reserved.
//

#import "SettingViewController.h"
#import "YSJCell.h"

@interface SettingViewController ()
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray<YSJCellGroupModel *> *dataArr;
@property (nonatomic, copy) NSArray<UITableViewRowAction *> *rowActionArr;
@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initData];
    YSJTableView *ysjTV = [YSJTableView viewWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-StatusBarHeight-NavigationBarHeight-TabBarHeight) TableViewStyle:UITableViewStyleGrouped cellIdentifier:@"SettingViewControllerCell" rowActionArr:_rowActionArr dataArr:_dataArr];
    [self.view addSubview:ysjTV];
}

- (void)initData{
    UITableViewRowAction *editRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"编辑" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        NSLog(@"editRowAction selected");
    }];
    editRowAction.backgroundColor = RGBA(0, 124, 223, 1);
    
    UITableViewRowAction *deleteRowAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDefault title:@"删除" handler:^(UITableViewRowAction * _Nonnull action, NSIndexPath * _Nonnull indexPath) {
        NSLog(@"deleteRowAction selected");
    }];
    deleteRowAction.backgroundColor = [UIColor redColor];
    
    _rowActionArr = @[deleteRowAction, editRowAction];
    
    
    YSJCellGroupModel *group0 = [[YSJCellGroupModel alloc]init];
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 10)];
    headView.backgroundColor = [UIColor grayColor];
    UIView *footView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 200, 100)];
    footView.backgroundColor = [UIColor lightGrayColor];
    group0.header = @"group0 header";
    group0.footer = @"group0 footer";
    group0.headView = headView;
    group0.footerView = footView;
    group0.headViewHeight = 20;
    group0.footViewHeight = 50;
    
    YSJCellHeadingModel *headingModel00 = [YSJCellHeadingModel modelWithHeadingModelType:HeadingModelNull];
    YSJCellCenterModel *centerModel00 = [YSJCellCenterModel modelWithCenterModelType:CenterModelNull];
    UILabel *centerModel00TopView = [[UILabel alloc]init];
    centerModel00TopView.text = @"title";
    UILabel *centerModel00MiddleView = [[UILabel alloc]init];
    centerModel00MiddleView.text = @"middle";
    UILabel *centerModel00BottomView = [[UILabel alloc]init];
    centerModel00BottomView.text = @"bottom";
    centerModel00.topView = centerModel00TopView;
    centerModel00.middleView = centerModel00MiddleView;
    centerModel00.bottomView = centerModel00BottomView;
    YSJCellTrailingModel *trailModel00 = [YSJCellTrailingModel modelWithTrailingModelType:TrailingModelNull];
    YSJCellModel *cellModel00 = [YSJCellModel modelWithHeadingModel:headingModel00 centerModel:centerModel00 tailingModel:trailModel00 selectedHandle:^(YSJCellModel *cellModel, NSIndexPath *indexPath) {
        NSLog(@"00");
    }];
    cellModel00.cellHeight = 30;
    
    YSJCellHeadingModel *headingModel01 = [YSJCellHeadingModel modelWithHeadingModelType:HeadingModelImage];
    headingModel01.headImg = [UIImage imageNamed:@"rest.jpg"];
    YSJCellCenterModel *centerModel01 = [YSJCellCenterModel modelWithCenterModelType:CenterModel1];
    UILabel *centerModel01TopView = [[UILabel alloc]init];
    centerModel01TopView.text = @"title";
    UILabel *centerModel01MiddleView = [[UILabel alloc]init];
    centerModel01MiddleView.text = @"middle";
    UILabel *centerModel01BottomView = [[UILabel alloc]init];
    centerModel01BottomView.text = @"bottom";
    centerModel01.topView = centerModel01TopView;
    centerModel01.middleView = centerModel01MiddleView;
    centerModel01.bottomView = centerModel01BottomView;
    YSJCellTrailingModel *trailModel01 = [YSJCellTrailingModel modelWithTrailingModelType:TrailingModelImage];
    trailModel01.trailImg = [UIImage imageNamed:@"rest.jpg"];
    YSJCellModel *cellModel01 = [YSJCellModel modelWithHeadingModel:headingModel01 centerModel:centerModel01 tailingModel:trailModel01 selectedHandle:^(YSJCellModel *cellModel, NSIndexPath *indexPath) {
        NSLog(@"01");
    }];
    cellModel01.cellHeight = 40;
    
    group0.modelArr = @[cellModel00,cellModel01];
    
    
    
    YSJCellGroupModel *group1 = [[YSJCellGroupModel alloc]init];
    group1.header = @"group1 header";
    group1.footer = @"group1 footer";
    group1.headViewHeight = 40;
    group1.footViewHeight = 40;
    
    YSJCellHeadingModel *headingModel10 = [YSJCellHeadingModel modelWithHeadingModelType:HeadingModelView];
    YSJCellCenterModel *centerModel10 = [YSJCellCenterModel modelWithCenterModelType:CenterModel2];
    UILabel *centerModel10TopView = [[UILabel alloc]init];
    centerModel10TopView.text = @"title";
    UILabel *centerModel10MiddleView = [[UILabel alloc]init];
    centerModel10MiddleView.text = @"middle";
    UILabel *centerModel10BottomView = [[UILabel alloc]init];
    centerModel10BottomView.text = @"bottom";
    centerModel10.topView = centerModel10TopView;
    centerModel10.middleView = centerModel10MiddleView;
    centerModel10.bottomView = centerModel10BottomView;
    YSJCellTrailingModel *trailModel10 = [YSJCellTrailingModel modelWithTrailingModelType:TrailingModelSwitch];
    trailModel10.switchChangedHandle = ^(YSJCellModel *cellModel, BOOL isOn){
        YSJLog(@"%d",isOn);
        YSJLog(@"%@",cellModel);
    };
    YSJCellModel *cellModel10 = [YSJCellModel modelWithHeadingModel:headingModel10 centerModel:centerModel10 tailingModel:trailModel10 selectedHandle:^(YSJCellModel *cellModel, NSIndexPath *indexPath){
        NSLog(@"10");
    }];
    cellModel10.cellHeight = 50;
    
    YSJCellHeadingModel *headingModel11 = [YSJCellHeadingModel modelWithHeadingModelType:HeadingModelNull];
    YSJCellCenterModel *centerModel11 = [YSJCellCenterModel modelWithCenterModelType:CenterModel3];
    UILabel *centerModel11TopView = [[UILabel alloc]init];
    centerModel11TopView.text = @"title";
    UILabel *centerModel11MiddleView = [[UILabel alloc]init];
    centerModel11MiddleView.text = @"middle";
    UILabel *centerModel11BottomView = [[UILabel alloc]init];
    centerModel11BottomView.text = @"bottom";
    centerModel11.topView = centerModel11TopView;
    centerModel11.middleView = centerModel11MiddleView;
    centerModel11.bottomView = centerModel11BottomView;
    YSJCellTrailingModel *trailModel11 = [YSJCellTrailingModel modelWithTrailingModelType:TrailingModelArrow];
    YSJCellModel *cellModel11 = [YSJCellModel modelWithHeadingModel:headingModel11 centerModel:centerModel11 tailingModel:trailModel11 selectedHandle:^(YSJCellModel *cellModel, NSIndexPath *indexPath){
        NSLog(@"11");
    }];
    cellModel11.cellHeight = 60;
    
    group1.modelArr = @[cellModel10,cellModel11];
    
    
    
    YSJCellGroupModel *group2 = [[YSJCellGroupModel alloc]init];
    group2.header = @"group2 header";
    group2.footer = @"group2 footer";
    
    YSJCellHeadingModel *headingModel20 = [YSJCellHeadingModel modelWithHeadingModelType:HeadingModelView];
    YSJCellCenterModel *centerModel20 = [YSJCellCenterModel modelWithCenterModelType:CenterModel3];
    UILabel *centerModel20TopView = [[UILabel alloc]init];
    centerModel20TopView.text = @"title";
    UILabel *centerModel20MiddleView = [[UILabel alloc]init];
    centerModel20MiddleView.text = @"middle";
    UILabel *centerModel20BottomView = [[UILabel alloc]init];
    centerModel20BottomView.text = @"bottom";
    centerModel20.topView = centerModel20TopView;
    centerModel20.middleView = centerModel20MiddleView;
    centerModel20.bottomView = centerModel20BottomView;
    YSJCellTrailingModel *trailModel20 = [YSJCellTrailingModel modelWithTrailingModelType:TrailingModelView];
    YSJCellModel *cellModel20 = [YSJCellModel modelWithHeadingModel:headingModel20 centerModel:centerModel20 tailingModel:trailModel20 selectedHandle:^(YSJCellModel *cellModel, NSIndexPath *indexPath){
        NSLog(@"20");
    }];
    cellModel20.cellHeight = 70;
    
    YSJCellHeadingModel *headingModel21 = [YSJCellHeadingModel modelWithHeadingModelType:HeadingModelNull];
    YSJCellCenterModel *centerModel21 = [YSJCellCenterModel modelWithCenterModelType:CenterModel2];
    UILabel *centerModel21TopView = [[UILabel alloc]init];
    centerModel21TopView.text = @"title";
    UILabel *centerModel21MiddleView = [[UILabel alloc]init];
    centerModel21MiddleView.text = @"middle";
    UILabel *centerModel21BottomView = [[UILabel alloc]init];
    centerModel21BottomView.text = @"bottom";
    centerModel21.topView = centerModel21TopView;
    centerModel21.middleView = centerModel21MiddleView;
    centerModel21.bottomView = centerModel21BottomView;
    YSJCellTrailingModel *trailModel21 = [YSJCellTrailingModel modelWithTrailingModelType:TrailingModelArrow];
    YSJCellModel *cellModel21 = [YSJCellModel modelWithHeadingModel:headingModel21 centerModel:centerModel21 tailingModel:trailModel21 selectedHandle:^(YSJCellModel *cellModel, NSIndexPath *indexPath){
        NSLog(@"21");
    }];
    cellModel21.cellHeight = 80;
    
    group2.modelArr = @[cellModel20,cellModel21];
    
    
    _dataArr = [NSMutableArray array];
    [_dataArr addObject:group0];
    [_dataArr addObject:group1];
    [_dataArr addObject:group2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
