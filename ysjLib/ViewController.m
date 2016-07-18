//
//  ViewController.m
//  ysjLib
//
//  Created by ysj on 15/12/4.
//  Copyright © 2015年 Harry. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+YSJ.h"
#import "NSString+YSJ.h"
#import "YSJAlertView.h"
#import "UIImage+YSJ.h"
#import "UIBarButtonItem+YSJ.h"
#import "YSJWebService.h"
#import "FMDBHelper.h"
#import "UIView+YSJ.h"
#import "ChildViewController.h"

@interface ViewController ()<UIAlertViewDelegate>
@property (nonatomic, strong) YSJAlertView *ysjAlert;
//@property (nonatomic, strong) ChildViewController *childVC;
@property (nonatomic, strong) UIView *childView;
@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //y轴从0开始  5s与6sp页面显示不同？
    if (self.navigationController.navigationBarHidden == YES || !self.navigationController){
        [self.view setBounds:CGRectMake(0, -20, self.view.bounds.size.width, self.view.bounds.size.height)];
    }else{
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initNav];
    
    //5.5inch 736*414   4.7inch 667*375     4inch 568*320   3.5inch 480*320
    NSLog(@"%f,%f",self.view.frame.size.height,self.view.frame.size.width);
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
//    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 528, 320, 20)];
//    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 627, 320, 20)];
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(0, 696, 320, 20)];
    label2.backgroundColor = [UIColor redColor];
    [self.view addSubview:label2];
    
    NSDate *date = [@"1990-06-28" stringToDateWithFormatterStr:@"yyyy-MM-dd"];
    NSDate *date2 = [@"1990-06-29" stringToDateWithFormatterStr:@"yyyy-MM-dd"];
    NSLog(@"%f",[date compareTimeToAnotherDate:date2]);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(120, 50, 80, 30);
    [btn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    UIImage *img = [UIImage imageNamed:@"0首页.jpg"];
    img = [img circleImage];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:img];
    imgView.backgroundColor = [UIColor lightGrayColor];
    imgView.frame = CGRectMake(60, 120, 200, 200);
    [self.view addSubview:imgView];
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 350, 200, 100)];
    textLabel.backgroundColor = [UIColor lightGrayColor];
    textLabel.numberOfLines = 0;
    [self.view addSubview: textLabel];
    textLabel.font = [UIFont systemFontOfSize:17];
    NSString *content = @"我就是试试到底这个动态调整边框有用没有啊，没有想搞一个大新闻，你们不要听风就是雨，将来新闻报道出了偏差你们是要负责任的，识得唔识得呀。";
    textLabel.text = content;
    
    NSLog(@"%lf",textLabel.height);
    [textLabel sizeToFit];//字体大小不变  改变frame
    NSLog(@"%lf",textLabel.height);
    
    NSLog(@"%@",textLabel.font);
    textLabel.adjustsFontSizeToFitWidth = YES;//frame不变，改变字体大小
    NSLog(@"%@",textLabel.font);
    
//    [self testWebService];
//    [self testDownloadWebService];
//    [self testFMDB];
//    [self testArrSort];
//    [self testDicSort];
    self.myBlock = ^(int num, NSString *name){
        NSLog(@"%d  %@",num,name);
    };
    
    self.myBlock(1,@"haha");
    
//    1465226463
    NSLog(@"%@",[NSDate dateWithTimeIntervalSince1970:[@"1465226463" doubleValue]]);
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeContactAdd];
    btn2.frame = CGRectMake(200, 50, 80, 30);
    [btn2 addTarget:self action:@selector(btn2Clicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
    
    
    UIView *childView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 140, 120)];
    childView.clipsToBounds = YES;
    childView.backgroundColor = [UIColor purpleColor];
    _childView = childView;
    [self.view addSubview:childView];
    
//    WeakSelf(self);
//    [weakself testFMDB];
}

- (void)testDicSort{
    NSDictionary *dic = @{@"Name":@"Lilei",
                          @"Age":@"18",
                          @"Sex":@"male",
                          @"Country":@"China",
                          @"Level":@"A"};
    
    NSSet *matchKeySet = [dic keysOfEntriesWithOptions:NSEnumerationConcurrent passingTest:^BOOL(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if ([key containsString:@"e"]) {
            return YES;
        }
        return NO;
    }];
    
    NSArray *keyArr = matchKeySet.allObjects;
    NSArray *valueArr = [dic objectsForKeys:keyArr notFoundMarker:NSNull.null];
    NSDictionary *siftDic = [NSDictionary dictionaryWithObjects:valueArr forKeys:keyArr];
    NSLog(@"%@",siftDic);
}

- (void)testArrSort{
//    NSArray *array = @[@9, @5, @11, @3, @1];
    NSArray *array = @[@"bc", @"ac", @"aa", @"zs", @"pa"];
    NSArray *sortArr = [array sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"%@",sortArr);
    
    //indexesOfObjectsPassingTest   筛选  速度最快
    NSIndexSet *indexs = [array indexesOfObjectsPassingTest:^BOOL(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString *str = (NSString *)obj;
        if ([str containsString:@"a"]) {
            return YES;
        }
        return NO;
    }];
    NSArray *siftArr = [array objectsAtIndexes:indexs];
    NSLog(@"%@",siftArr);
    
    //filteredArrayUsingPredicate  筛选   速度最慢
    NSArray *siftArr2 = [array filteredArrayUsingPredicate:[NSPredicate predicateWithBlock:^BOOL(id  _Nonnull evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        NSString *str = (NSString *)evaluatedObject;
        if ([str containsString:@"a"]) {
            return YES;
        }
        return NO;
    }]];
    NSLog(@"%@",siftArr2);
    
    //传统依次检测筛选  速度较慢
}

- (void)testFMDB{
    //创建/获得数据库
    [FMDBHelper dataBaseWithName:@"testFMDB.sqlite"];
    //建表
//    NSDictionary *dic = @{@"id":@"integer PRIMARY KEY AUTOINCREMENT",
//                          @"name":@"text NOT NULL",
//                          @"age":@"integer",
//                          @"sex":@"integer"};
//    [FMDBHelper createTable:@"testTable" keyTypes:dic];
    
    //插入数据
//    NSDictionary *insertDic = @{@"name":@"NEX",@"age":@"19",@"sex":@"0"};
//    [FMDBHelper insertKeyValues:insertDic intoTable:@"testTable"];
//    NSDictionary *insertDic2 = @{@"name":@"ASan",@"age":@"16",@"sex":@"0"};
//    [FMDBHelper insertKeyValues:insertDic2 intoTable:@"testTable"];
    
    //更新
//    NSDictionary *updateDic = @{@"name":@"hehe"};
//    [FMDBHelper updateTable:@"testTable" setKeyValues:updateDic];
    
    //条件更新
//    NSDictionary *updateDic = @{@"name":@"hehe"};
//    NSDictionary *conditionDic = @{@"name":@"ha",@"age":@"121"};
//    [FMDBHelper updateTable:@"testTable" setKeyValues:updateDic whereCondition:conditionDic];
    
    //条件删除
//    NSDictionary *deleteDic = @{@"name":@"2hehe",@"age":@"10"};
//    [FMDBHelper deleteTable:@"testTable" whereCondition:deleteDic];
    
    //删除表内全部数据
//    [FMDBHelper deleteTable:@"testTable"];
    
    //删除表
//    [FMDBHelper dropTable:@"testTable"];
    
    //条件查询  ,@"sex":@"1"
//    NSDictionary *conditionDic = @{@"name":@"%P%"};
//    NSArray *resultArr = [FMDBHelper selectDataFromTable:@"testTable" condition:conditionDic selectConditionMode:SelectConditionNone];
//    NSLog(@"%@", resultArr);
    
    //全部查询
    NSArray *resultArr = [FMDBHelper selectDataFromTable:@"testTable"];
    NSLog(@"%@", resultArr);
}

- (void)testWebService{
//http://phoneapi.gotohz.com/api/travel!listHotspotByParentCode.action?
//page=0&channelCode=ZTESEJUSUO&sortTypeLve=1&isPub=1&districtId=6
//    NSDictionary *params = @{@"page":@"0",
//                             @"channelCode":@"ZTESEJUSUO",
//                             @"sortTypeLve":@"1",
//                             @"isPub":@"1",
//                             @"districtId":@"6"};
    
    //http://192.168.10.174:8080/api/v1/weather!getSWAWeather.action?area=杭州
    NSDictionary *params = @{@"area":@"hangzhou"};
    [YSJWebService requestTarget:self withUrl:@"http://192.168.10.174:8080/api/v1/weather!getSWAWeather.action" isPost:YES parameters:params complete:^(id response) {
        NSLog(@"%@",response);
    } fail:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"%@",error);
    }];
}

- (void)testDownloadWebService{
    NSLog(@"%@",[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0]);
    NSString *urlStr = @"http://mw5.dwstatic.com/2/4/1529/134981-99-1436844583.mp4";
    NSURLSessionDownloadTask *task = [YSJWebService requestDownloadTarget:self withUrl:urlStr progress:^(NSProgress *downloadProgress) {
        NSLog(@"%f",1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount);
        // 回到主队列刷新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            // 设置进度条的百分比
//            self.progressView.progress = 1.0 * downloadProgress.completedUnitCount / downloadProgress.totalUnitCount;
        });
    } destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSString *pathStr = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0] stringByAppendingPathComponent:response.suggestedFilename];
        return [NSURL fileURLWithPath:pathStr];
    } complete:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        NSLog(@"%@",filePath);
        NSLog(@"------------      download complete!      ------------");
    }];
    [task resume];
}

- (void)initNav{
    self.navigationController.navigationBar.backgroundColor = [UIColor greenColor];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor purpleColor]] forBarMetrics:UIBarMetricsDefault];
    
    UIBarButtonItem *btn1 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"periphery_icon_bank"] edgeInsets:UIEdgeInsetsZero higlightedImage:[UIImage imageNamed:@"periphery_icon_consultation"] target:self action:@selector(barButtonItemClicked)];
    
    UIBarButtonItem *btn2 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"periphery_icon_food"] edgeInsets:UIEdgeInsetsMake(0, -20, 0, 0) higlightedImage:[UIImage imageNamed:@"periphery_icon_hospital"] target:self action:@selector(barButtonItemClicked)];
    
    self.navigationItem.rightBarButtonItems = @[btn1,btn2];
}

- (void)barButtonItemClicked{
    
}

- (UIBarButtonItem *)itemWithImage:(NSString *)image edgeInsets:(UIEdgeInsets)edgeInsets higlightedImage:(NSString *)higlightedImage target:(id)target action:(SEL)action
{
    // 1.创建按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    // 2.设置按钮背景图片
    UIImage *normal = [UIImage imageNamed:image];
    [btn setImage:normal forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:higlightedImage] forState:UIControlStateHighlighted];
    
    // 3.设置按钮的尺寸
    [btn setImageEdgeInsets:edgeInsets];
    btn.bounds = CGRectMake(0, 0, normal.size.width, normal.size.height);
    btn.backgroundColor = [UIColor darkGrayColor];
    // 4.监听按钮点击
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    // 5.返回创建好的item
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

- (void)btnClicked:(UIButton *)btn{
    [self.ysjAlert show];
}

- (void)btn2Clicked:(UIButton *)btn{
    for (UIView *view in self.childView.subviews) {
        NSLog(@"%ld",view.tag);
    }
    ChildViewController *childVC = [[ChildViewController alloc]init];
    childVC.view.tag = 1;
    [self addChildViewController:childVC];
    [self.childView addSubview:childVC.view];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    YSJAlertView *ysjAlert = (YSJAlertView *)alertView;
    ysjAlert.selectOption(buttonIndex);
}

- (YSJAlertView *)ysjAlert{
    if (!_ysjAlert) {
        _ysjAlert = [[YSJAlertView alloc]initWithTitle:@"title" message:@"message" delegate:self cancelButtonTitle:@"cancel" otherButtonTitles:@"btn", nil];
        _ysjAlert.selectOption = ^(NSInteger selectIndex){
            NSLog(@"%ld",(long)selectIndex);
        };
    }
    return _ysjAlert;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
