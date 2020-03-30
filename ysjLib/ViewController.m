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
#import "UIImage+YSJ.h"
#import "UIBarButtonItem+YSJ.h"
#import "YSJWebService.h"
#import "FMDBHelper.h"
#import "UIView+YSJ.h"
#import "ChildViewController.h"
#import "YSJPhotoKindViewController.h"
#import "YSJNavigationController.h"
#import <Photos/Photos.h>
#import "YSJCommonTools.h"
#import "YSJLabel.h"
#import "TestView.h"
#import "ChildInterface.h"
#import "UIColor+YSJ.h"
#import "UIViewController+YSJ.h"
#import "NSDictionary+YSJ.h"
#import "NSData+YSJ.h"
#import "Common.h"
#import "UIButton+YSJ.h"
#import "YSJTextField.h"

@interface ViewController ()<UIAlertViewDelegate, TestViewDelegate, UITextFieldDelegate>
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
    YSJLog(@"%@",[NSString stringWithDocumentDir]);
    [self initNav];
    
    //5.5inch 736*414   4.7inch 667*375     4inch 568*320   3.5inch 480*320
    NSLog(@"%f,%f",self.view.frame.size.height,self.view.frame.size.width);
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 20)];
    label.backgroundColor = [UIColor redColor];
    label.font = [UIFont systemFontOfSize:15 weight:UIFontWeightBlack];
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
    
    UIImage *img = [UIImage imageNamed:@"sh6524_1709"];
    img = [img circleImage];
    UIImageView *imgView = [[UIImageView alloc]initWithImage:img];
    imgView.backgroundColor = [UIColor fromHex:@"FF1493"];
    imgView.frame = CGRectMake(60, 120, 200, 200);
    [self.view addSubview:imgView];
    
    YSJTextField *ysjTF = [[YSJTextField alloc] initWithFrame:CGRectMake(270, 120, 80, 30)];
    ysjTF.backgroundColor = [UIColor lightGrayColor];
    ysjTF.delegate = self;
//    ysjTF.text = @"222333";
    [self.view addSubview:ysjTF];
    
    UILabel *textLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 350, 200, 100)];
    textLabel.numberOfLines = 0;
    [self.view addSubview: textLabel];
    textLabel.font = [UIFont systemFontOfSize:17];
    NSString *content = @"我就是试试到底这个动态调整边框有用没有啊，没有想搞一个大新闻，你们不要听风就是雨，将来新闻报道出了偏差你们是要负责任的，识得唔识得呀。2";
    textLabel.text = content;
    
    NSLog(@"%lf",textLabel.height);
    [textLabel sizeToFit];//字体大小不变  改变frame
    NSLog(@"%lf",textLabel.height);
    
    NSLog(@"%@",textLabel.font);
    textLabel.adjustsFontSizeToFitWidth = YES;//frame不变，改变字体大小
    NSLog(@"%@",textLabel.font);
    
//    YSJLabel *ysjLabel = [[YSJLabel alloc]initWithFrame:CGRectMake(265, 350, 50, 100)];
    YSJLabel *ysjLabel = [[YSJLabel alloc]initWithFrame:CGRectMake(60, 350, 200, 50)];
    ysjLabel.backgroundColor = [UIColor lightGrayColor];
    ysjLabel.numberOfLines = 0;
    ysjLabel.verticalAlignment = VerticalAlignmentTop;
    ysjLabel.text = @"xxxxxxxx";
    ysjLabel.text = content;
    [self.view addSubview:ysjLabel];
    
    
    CGSize size = [content sizeWithFont:ysjLabel.font maxSize:CGSizeMake(200, 1000)];
    ysjLabel.size = size;
    NSLog(@"%lf     %lf", size.height, size.width);
    
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
    
    UIView *grendChildView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 140, 120)];
//    grendChildView.backgroundColor = [UIColor fromHex:@"9397a1"];
    grendChildView.tag = 2;
    [childView addSubview:grendChildView];
    
    UIView *view = [self.view viewWithTag:2];
    NSLog(@"%@",view);
    
//    WeakSelf(self);
//    [weakself testFMDB];
    
    TestView *testView = [[TestView alloc] init];
    testView.delegate = self;
    [testView doSomethingWithString1:@"呵呵" andString2:@"哈哈"];
    
    NSString *testNotf = @"testNotification";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNotification:) name:testNotf object:nil];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:testNotf object:nil userInfo:@{@"info1": @"我是info1"}];
    
    __weak __typeof(self)weakSelf = self;
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@2, @3, @6, @9, @8, @1, nil];
    for (int i = 0; i < array.count; i++) {
        for (int j = i; j < array.count; j++) {
            if (array[i] > array[j]) {
                NSNumber *temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
    NSLog(@"%@", array);
    
    ChildInterface *testInterface = [[ChildInterface alloc]init];
    NSLog(@"testInterface.name: %@, testInterface.age: %@, testInterface.address: %@", testInterface.name, testInterface.age, testInterface.address);
    
    UIFont *font = [UIFont systemFontOfSize:15];
    NSLog(@"font.pointSize: %f", font.pointSize);
    
    
    UIView *theView = [[UIView alloc] init];
    theView.frame = CGRectMake(50, 400, 300, 50);
    theView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:theView];
    [theView addTopLineWithThick:2 andColor:[UIColor yellowColor]];
    [theView addBottomLineWithThick:0.5 andColor:[UIColor lightGrayColor]];
    [theView addLeftLine];
    [theView addRightLine];
    
    self.title = @"fuck";
    
    UIButton *fuckBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, 520, 40, 40)];
    fuckBtn.backgroundColor = [UIColor lightGrayColor];
    fuckBtn.selected = YES;
    fuckBtn.enabled = NO;
    // selectNO enableNO   disable
    // selectNO enableYES   normal
    // selectYES enableYES   select
    // selectYES enableNO   normal
    
    [fuckBtn setTitle:@"fuckBtn" forState:UIControlStateNormal];
    [fuckBtn setTitleColor:[UIColor blackColor] forState:UIControlStateDisabled];
    [fuckBtn setTitleColor:[UIColor yellowColor] forState:UIControlStateSelected];
    [fuckBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [fuckBtn addTarget:self action:@selector(fuckBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [fuckBtn setEnlargeEdgeWithTop:0 left:50 bottom:0 right:200];
    [self.view addSubview:fuckBtn];
    
    NSDictionary *dic1 = @{@"one": @"1", @"two": @"2", @"three": @"3"};
    NSLog(@"%@", dic1.toData);
    NSLog(@"%@", dic1.toData.toDictionary);
    NSDictionary *dic2 = [NSDictionary fullCopyWithCopyedDictionary:dic1];
    NSLog(@"dic1:%@, dic2:%@", dic1, dic2);
    
    CSDirection dirDown = CSDirectionDown;
    CSDirection dirUp = CSDirectionUp;
    CSDirection dirLeft = CSDirectionLeft;
    CSDirection dirRight = CSDirectionRight;
    
    CSConnectionState con1 = CSConnectionStateConnected;
    CSConnectionState con2 = CSConnectionStateConnecting;
    CSConnectionState con3 = CSConnectionStateDisconnected;
    
    NSLog(@"dirDown:%lu dirUp:%lu dirLeft:%lu dirRight:%lu ", dirDown, dirUp|dirDown, dirLeft, dirRight);
    
    NSLog(@"con1:%lu con2:%lu con3:%lu ", con1, con2, con3);
    
    NSLog(@"%lf", [Common uiScale:100]);
}

//把“插入”和“删除”都解释成了“替换”。插入就是用文本替换空字符串，删除就是用空字符串替换文本。即 将要生成的文本长度 = 原始文本长度 - 选中文本长度 + 输入文本长度
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([string isEqualToString:@""] && range.length > 0) {
        // 删除字符肯定是安全的
        return YES;
    }
    
    if (textField.text.length - range.length + string.length > 3) {
        NSLog(@"超出最大长度");
        return NO;
    }
    return YES;
}

- (void)fuckBtnClick {
    NSLog(@"currentVC.title:%@", [UIViewController getCurrentVC].title);
}

- (void)testNotification:(NSDictionary *)userInfo {
    NSLog(@"userInfo: %@", userInfo);
}

- (void)testDelegate:(NSString *)str1 withStr2:(NSString *)str2 {
    NSLog(@"str1: %@ str2: %@", str1, str2);
}

- (void)testNet{
    NSDictionary * dic = @{@"from":@"杭州",
                           @"to":@"上海",
                           @"version":@"1.0",
                           @"date":@"2016-08-20"};
    
    [YSJWebService requestTarget:self withUrl:@"http://apis.baidu.com/qunar/qunar_train_service/s2ssearch" isPost:NO parameters:dic headerKey:@"apikey" header:@"0051c1d27cfac89f64bd56f8d7889c82" complete:^(id response) {
        NSLog(@"%@",response);
    } fail:nil];
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
    NSDictionary *dic = @{@"id":@"integer PRIMARY KEY AUTOINCREMENT",
                          @"name":@"text NOT NULL",
                          @"age":@"integer",
                          @"sex":@"integer"};
    [FMDBHelper createTable:@"testTable" withKeyTypeDic:dic];
    
    //插入数据
//    NSDictionary *insertDic = @{@"name":@"NEX",@"age":@"19",@"sex":@"0"};
//    [FMDBHelper insertKeyValues:insertDic intoTable:@"testTable"];
//    NSDictionary *insertDic2 = @{@"name":@"ASan",@"age":@"16",@"sex":@"0"};
//    [FMDBHelper insertKeyValues:insertDic2 intoTable:@"testTable"];
    
    //条件更新
//    NSDictionary *updateDic = @{@"age":@20,@"sex":@1};
//    NSArray *compareKeyArr = @[[FMDBHelper compareKey:CompareKeyEqual],[FMDBHelper compareKey:CompareKeyLike]];
//    NSArray *columnArr = @[@{@"age":@19},@{@"name":@"%E%"}];
//    [FMDBHelper updateTable:@"testTable" updateDic:updateDic andOrKey:AndKey compareKeyArr:compareKeyArr columnArr:columnArr];
    
    
    
    //条件删除
//    NSDictionary *deleteDic = @{@"name":@"2hehe",@"age":@"10"};
    NSArray *compareKeyArr = @[[FMDBHelper compareKey:CompareKeyEqual],[FMDBHelper compareKey:CompareKeyEqual]];
    NSArray *columnArr = @[@{@"age":@16},@{@"sex":@1}];
    [FMDBHelper deleteTable:@"testTable" andOrKey:AndKey compareKeyArr:compareKeyArr columnArr:columnArr];
    
    //删除表内全部数据
//    [FMDBHelper deleteTable:@"testTable"];
    
    //删除表
//    [FMDBHelper dropTable:@"testTable"];
    
    //条件查询  ,@"sex":@"1"
//    NSDictionary *conditionDic = @{@"name":@"%P%"};
//    NSArray *resultArr = [FMDBHelper selectDataFromTable:@"testTable" condition:conditionDic selectConditionMode:SelectConditionNone];
//    NSLog(@"%@", resultArr);
    
    //全部查询
//    NSArray *resultArr = [FMDBHelper selectDataFromTable:@"testTable"];
//    NSLog(@"%@", resultArr);
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
    
    UIBarButtonItem *btn1 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"periphery_icon_bank"] edgeInsets:UIEdgeInsetsZero higlightedImage:[UIImage imageNamed:@"periphery_icon_consultation"]   alignment:UIControlContentHorizontalAlignmentRight target:self action:@selector(barButtonItemClicked)];
    
    UIBarButtonItem *btn2 = [UIBarButtonItem itemWithImage:[UIImage imageNamed:@"periphery_icon_food"] edgeInsets:UIEdgeInsetsMake(0, -20, 0, 0) higlightedImage:[UIImage imageNamed:@"periphery_icon_hospital"] alignment:UIControlContentHorizontalAlignmentRight  target:self action:@selector(barButtonItemClicked)];
    
    self.navigationItem.rightBarButtonItems = @[btn1,btn2];
    
    
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTitle:@"photo" color:[UIColor greenColor] textSize:15.0f bounds:CGRectMake(0, 0, 50, 35) alignment:UIControlContentHorizontalAlignmentLeft target:self action:@selector(photoBtnClicked)];
}

- (void)photoBtnClicked{
    YSJPhotoKindViewController *photoVC = [[YSJPhotoKindViewController alloc]initWithShowType:showTypeDetail selectType:SelectTypeSingle picsSelectHandle:^(NSArray *assetArr) {
        for (PHAsset *asset in assetArr) {
            NSLog(@"%@",asset.creationDate);
        }
    }];
    YSJNavigationController *nav = [[YSJNavigationController alloc]initWithRootViewController:photoVC];
    nav.isAutorotate = NO;
    nav.interfaceOrientation = UIInterfaceOrientationMaskPortrait;
    [self.navigationController presentViewController:nav animated:YES completion:nil];
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
