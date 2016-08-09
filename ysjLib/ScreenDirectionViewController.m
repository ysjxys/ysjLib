//
//  ScreenDirectionViewController.m
//  ysjLib
//
//  Created by ysj on 16/8/8.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "ScreenDirectionViewController.h"
#import "YSJTabBarController.h"
#import "YSJNavigationController.h"
#import "YSJViewController.h"
#import "UIView+YSJ.h"
#import "TableViewCellModel.h"

@interface ScreenDirectionViewController()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *table;
@property (nonatomic, copy) NSArray<TableViewCellModel *> *dataArr;
@property (nonatomic, assign) BOOL isScreenLock;
@end

@implementation ScreenDirectionViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UITableView *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-StatusBarHeight-NavigationBarHeight-TabBarHeight) style:UITableViewStylePlain];
    table.tableFooterView = [[UIView alloc]init];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    self.table = table;
    _isScreenLock = NO;
    
    TableViewCellModel *model0 = [[TableViewCellModel alloc]init];
    model0.title = @"ScreenLock";
    model0.option = ^{
        _isScreenLock = !_isScreenLock;
        [self changeScreenLockState:_isScreenLock];
    };
    
    TableViewCellModel *model1 = [[TableViewCellModel alloc]init];
    model1.title = @"Portrait";
    model1.option = ^{
        [self changeInterfaceOrientation:UIInterfaceOrientationMaskPortrait];
    };
    
    TableViewCellModel *model2 = [[TableViewCellModel alloc]init];
    model2.title = @"LandscapeLeft";
    model2.option = ^{
        [self changeInterfaceOrientation:UIInterfaceOrientationMaskLandscapeLeft];
    };
    
    TableViewCellModel *model3 = [[TableViewCellModel alloc]init];
    model3.title = @"LandscapeRight";
    model3.option = ^{
        [self changeInterfaceOrientation:UIInterfaceOrientationMaskLandscapeRight];
    };
    
    TableViewCellModel *model4 = [[TableViewCellModel alloc]init];
    model4.title = @"PortraitUpsideDown";
    model4.option = ^{
        [self changeInterfaceOrientation:UIInterfaceOrientationMaskPortraitUpsideDown];
    };
    
    TableViewCellModel *model5 = [[TableViewCellModel alloc]init];
    model5.title = @"Landscape";
    model5.option = ^{
        [self changeInterfaceOrientation:UIInterfaceOrientationMaskLandscape];
    };
    
    TableViewCellModel *model6 = [[TableViewCellModel alloc]init];
    model6.title = @"All";
    model6.option = ^{
        [self changeInterfaceOrientation:UIInterfaceOrientationMaskAll];
    };
    
    TableViewCellModel *model7 = [[TableViewCellModel alloc]init];
    model7.title = @"AllButUpsideDown";
    model7.option = ^{
        [self changeInterfaceOrientation:UIInterfaceOrientationMaskAllButUpsideDown];
    };
    
    self.dataArr = @[model0,model1,model2,model3,model4,model5,model6,model7];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    TableViewCellModel *model = self.dataArr[indexPath.row];
    cell.textLabel.text = model.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TableViewCellModel *model = self.dataArr[indexPath.row];
    model.option();
}

- (NSArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSArray array];
    }
    return _dataArr;
}


@end
