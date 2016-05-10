//
//  CollectionViewCell.h
//  IWatchTeam
//
//  Created by DSB on 16/5/4.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>


@class IWatchDailyModel;
@interface CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *tuimage;
@property (weak, nonatomic) IBOutlet UILabel *wenlable;
@property (nonatomic,strong)IWatchDailyModel *model;

@end
