//
//  CollectionViewCell.m
//  IWatchTeam
//
//  Created by DSB on 16/5/4.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "CollectionViewCell.h"
#import "IWatchDailyModel.h"
#import <UIImageView+WebCache.h>

@implementation CollectionViewCell

-(void)setModel:(IWatchDailyModel *)model{
    _model=model;
    [self.tuimage sd_setImageWithURL:[NSURL URLWithString:_model.thumb]];
    self.wenlable.text=_model.title;
}













- (void)awakeFromNib {
    // Initialization code
}

@end
