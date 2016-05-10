//
//  IWatchTeamZDHTableViewCell.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/5.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamZDHTableViewCell.h"
#import "IWatchTeamPricesModel.h"
#import <UIImageView+WebCache.h>
@interface IWatchTeamZDHTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *descriptionView;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *accountView;

@end
@implementation IWatchTeamZDHTableViewCell

-(void)setModel:(IWatchTeamPricesModel *)model{

    _model=model;
    self.titleView.text=_model.title;
    self.descriptionView.text=_model.descrip;
    [self.iconImageView  sd_setImageWithURL:[NSURL URLWithString:_model.thumb] placeholderImage:nil];
    self.accountView.text=[NSString stringWithFormat:@"%@只",_model.num];


}

@end
