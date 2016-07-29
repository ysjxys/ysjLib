//
//  YSJPhotoChooseViewController.m
//  ysjLib
//
//  Created by ysj on 16/7/28.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "YSJPhotoChooseViewController.h"
#import "UIBarButtonItem+YSJ.h"
#import "YSJPhotoCell.h"
#import "YSJPhotoConstant.h"

@interface YSJPhotoChooseViewController ()<UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong) PHAssetCollection *assetCollection;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, copy) PicsSelectdOption option;
@end

@implementation YSJPhotoChooseViewController

- (instancetype)initWithAssetCollection:(PHAssetCollection *)assetCollection option:(PicsSelectdOption)option{
    if (self = [super init]) {
        self.assetCollection = assetCollection;
        self.option = option;
        PHFetchResult *result = [PHAsset fetchAssetsInAssetCollection:assetCollection options:nil];
        for (int i = 0; i < result.count; i++) {
            [self.dataArr addObject:[@{DicKeyAsset:[result objectAtIndex:i],DicKeySelected:@0} mutableCopy]];
        }
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = self.assetCollection.localizedTitle;
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTitle:@"确定" color:self.view.tintColor textSize:RightBarItemTextSize bounds:CGRectMake(0, 0, 50, 35) target:self action:@selector(sureBarBtnClicked)];
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    UICollectionView *collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-StatusBarHeight-NavigationBarHeight) collectionViewLayout:layout];
    collectionView.contentInset = UIEdgeInsetsMake(0, 0, 20, 0);
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerClass:[YSJPhotoCell class] forCellWithReuseIdentifier:PhotoCollectionCellIdentifier];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    [self.view addSubview:collectionView];
    
    self.collectionView = collectionView;
}

- (void)sureBarBtnClicked{
    NSMutableArray *choosedArr = [NSMutableArray array];
    for (NSMutableDictionary *dic in self.dataArr) {
        if ([dic[DicKeySelected] boolValue]) {
            PHAsset *asset = dic[DicKeyAsset];
            [choosedArr addObject:asset];
        }
    }
    self.option(choosedArr);
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    YSJPhotoCell *cell = [YSJPhotoCell cellWithCollectionView:collectionView indexPath:indexPath dataDic:self.dataArr[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    YSJPhotoCell *cell = (YSJPhotoCell *)[collectionView cellForItemAtIndexPath:indexPath];
    [cell changeSelected];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    PHFetchResult *result = [PHAsset fetchAssetsInAssetCollection:self.assetCollection options:nil];
    return result.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(PhotoCollectionCellWidth, PhotoCollectionCellWidth);
}

//section top bottom left right edge
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(PhotoCollectionCellSectionEdge, PhotoCollectionCellSectionEdge, PhotoCollectionCellSectionEdge, PhotoCollectionCellSectionEdge);
}

//edge for line
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return PhotoCollectionCellSectionEdge;
}

//edge for cell
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return PhotoCollectionCellSectionEdge;
}

- (NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
