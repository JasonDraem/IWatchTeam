//
//  NewBuyWatchCollectionCell.h
//  IWatchTeam
//
//  Created by 丶苹果 on 16/5/7.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NewBuyWatchModel.h"

@interface NewBuyWatchCollectionCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *mainImageVIew;
@property (weak, nonatomic) IBOutlet UILabel *descriptionView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *iconNameView;

@property (weak, nonatomic) IBOutlet UIImageView *eyeImageView;

@property (weak, nonatomic) IBOutlet UILabel *sayLabelView;

@property (nonatomic,strong)NewBuyWatchModel * model;

@end
