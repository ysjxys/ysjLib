//
//  YSJPhotoCell.m
//  ysjLib
//
//  Created by ysj on 16/7/28.
//  Copyright © 2016年 Harry. All rights reserved.
//

#import "YSJPhotoCell.h"
#import "YSJPhotoConstant.h"
@interface YSJPhotoCell()
@property (nonatomic, strong) PHAsset *asset;
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, strong) UIImageView *photoImgView;
@property (nonatomic, strong) UIView *coverView;
@property (nonatomic, strong) UIImageView *arrowImgView;
@property (nonatomic, strong) NSMutableDictionary *dataDic;

@end

@implementation YSJPhotoCell

+ (instancetype)cellWithCollectionView:(UICollectionView *)collectionView indexPath:(NSIndexPath *)indexPath dataDic:(NSMutableDictionary *)dataDic{
    YSJPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:PhotoCollectionCellIdentifier forIndexPath:indexPath];
    [cell initView];
    cell.dataDic = dataDic;
    cell.asset = dataDic[DicKeyAsset];
    cell.isSelected = [dataDic[DicKeySelected] boolValue];
    return cell;
}

- (void)initView{
    self.backgroundColor = [UIColor purpleColor];
    if (!_photoImgView) {
        _photoImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _photoImgView.contentMode = UIViewContentModeScaleAspectFill;
        _photoImgView.clipsToBounds = YES;
        [self addSubview:_photoImgView];
    }
    if (!_coverView) {
        _coverView = [[UIView alloc]initWithFrame:_photoImgView.frame];
        _coverView.backgroundColor = [UIColor whiteColor];
        _coverView.alpha = 0.2;
        _coverView.hidden = YES;
        [self addSubview:_coverView];
    }
    if (!_arrowImgView) {
        CGFloat edge = 20.0f;
        _arrowImgView = [[UIImageView alloc]initWithFrame:CGRectMake(_photoImgView.frame.size.width-edge-5, _photoImgView.frame.size.height-edge-5, edge, edge)];
        _arrowImgView.image = [UIImage imageNamed:@"tick"];
        _arrowImgView.hidden = YES;
        [self addSubview:_arrowImgView];
    }
}

- (void)setAsset:(PHAsset *)asset{
    _asset = asset;
    [[PHImageManager defaultManager]requestImageForAsset:asset targetSize:CGSizeMake(self.frame.size.width*2, self.frame.size.width*2) contentMode:PHImageContentModeAspectFit options:nil resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
        _photoImgView.image = result;
    }];
}

- (void)setIsSelected:(BOOL)isSelected{
    _isSelected = isSelected;
    if (isSelected) {
        _coverView.hidden = NO;
        _arrowImgView.hidden = NO;
        [self.dataDic setObject:@1 forKey:DicKeySelected];
    }else{
        _coverView.hidden = YES;
        _arrowImgView.hidden = YES;
        [self.dataDic setObject:@0 forKey:DicKeySelected];
    }
}

- (void)changeSelected{
    [self setIsSelected:!self.isSelected];
}
@end
