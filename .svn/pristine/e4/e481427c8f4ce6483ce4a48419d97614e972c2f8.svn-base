//
//  IWatchTeamWatchCollectionViewCell.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/10.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamWatchCollectionViewCell.h"

#import <SDWebImage/UIImageView+WebCache.h>

#import "IWatchTeamWatchModel.h"

@implementation IWatchTeamWatchCollectionViewCell
//
- (void)updateWithModel:(IWatchTeamWatchModel *)model{
    self.layer.shadowColor = [[UIColor lightGrayColor] CGColor];
    self.layer.shadowOffset = CGSizeMake(10, 5);
    self.layer.shadowOpacity = .8;
    
    self.watchImageView.layer.cornerRadius = 10;
    self.watchImageView.clipsToBounds = YES;
    
    NSURL *url = [NSURL URLWithString:model.watch_Wpic];
    [self.watchImageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"placehodler_128"]];
    self.watchTitleLabel.text = model.watch_Wname;
    self.watchPriceLabel.text = [NSString stringWithFormat:@"￥%@", model.watch_Wuid];
}




- (void)awakeFromNib {
    // Initialization code
}

@end
