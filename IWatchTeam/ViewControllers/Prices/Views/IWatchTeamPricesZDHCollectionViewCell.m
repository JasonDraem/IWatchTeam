//
//  IWatchTeamPricesZDHCollectionViewCell.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamPricesZDHCollectionViewCell.h"
#import <UIImageView+WebCache.h>
#import "IWatchTeamPricesModel.h"
@interface IWatchTeamPricesZDHCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *picesView;

@end
@implementation IWatchTeamPricesZDHCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)setModel:(IWatchTeamPricesModel *)model{

    _model=model;
    [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:_model.thumb] placeholderImage:nil];
    self.picesView.text=_model.title;
    

}
@end
