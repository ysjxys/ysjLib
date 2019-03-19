//
//  DomoTableView.m
//  ysjLib
//
//  Created by ysj on 2019/3/18.
//  Copyright © 2019 Harry. All rights reserved.
//

#import "DamoTableView.h"
#import "ReactiveObjC.h"
#import "Masonry.h"
#import "DamoModel.h"

@interface DamoTableView() <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIView *bgGrayView;
@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *cancelBtn;

@end

@implementation DamoTableView

- (instancetype)initWithDataList:(NSMutableArray<DamoModel *> *)dataList {
    if (self = [super init]) {
        self.dataList = dataList;
        [self initViews];
        [self initConstraint];
    }
    return self;
}

- (void)showDamoTableView {
    
}

- (void)hideDamoTableView {
    
}

- (void)initViews {
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height)];
    self.bgView.backgroundColor = [UIColor clearColor];
    
    self.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height);
    [self addSubview:_bgView];
    
    self.bgGrayView = [[UIView alloc] initWithFrame:self.bgView.bounds];
    self.bgGrayView.backgroundColor = [UIColor blackColor];
    self.bgGrayView.alpha = 0.3;
    [self.bgView addSubview:self.bgGrayView];
    
    self.contentView = [[UIView alloc] init];
    self.contentView.backgroundColor = [UIColor whiteColor];
    self.contentView.clipsToBounds = YES;
    self.contentView.layer.cornerRadius = 8;
    [self.bgView addSubview:self.contentView];
    
    self.titleLabel = [[UILabel alloc] init];
    self.titleLabel.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBold];
    self.titleLabel.text = @"我是标题";
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.titleLabel];
    
    self.cancelBtn = [[UIButton alloc] init];
    [self.cancelBtn setTitle:@"取 消" forState:UIControlStateNormal];
    [self.cancelBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    self.cancelBtn.titleLabel.font = [UIFont systemFontOfSize:13];
    self.cancelBtn.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.cancelBtn];
    [[self.cancelBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        if (_cancelBlock) {
            _cancelBlock();
        }else {
            [self removeFromSuperview];
        }
    }];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:self.tableView];
    
    [self.tableView reloadData];
}

- (void)initConstraint {
    [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.mas_equalTo(300);
        make.height.mas_equalTo(400);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.height.mas_equalTo(50);
    }];
    
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.width.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.height.mas_equalTo(50);
    }];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom);
        make.width.equalTo(self.contentView);
        make.centerX.equalTo(self.contentView);
        make.bottom.equalTo(self.cancelBtn.mas_top);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataList.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:@"cell"];
    }
    DamoModel *model = [self.dataList objectAtIndex:indexPath.row];
    cell.textLabel.text = model.title;
    cell.detailTextLabel.text = model.detail;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (self.selectBlock) {
        DamoModel *model = self.dataList[indexPath.row];
        self.selectBlock(indexPath.row, model);
    }
}

@end
