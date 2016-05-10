//
//  ReportCollectionViewCell.h
//  IWatchTeam
//
//  Created by 丶苹果 on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>

@class reportModel;

@interface ReportCollectionViewCell : UICollectionViewCell

@property (nonatomic,copy) NSString * title;

@property (nonatomic,copy) NSString * iconImageName;

//@property (nonatomic,strong)reportModel * model;

- (void)updateWithModel:(reportModel *)model;

@end
