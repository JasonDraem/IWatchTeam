//
//  ZFKForumTableViewCell.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ZFKForumTableViewCell.h"
#import "ZFKForumTableViewModel.h"
#import <UIImageView+WebCache.h>
@interface ZFKForumTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *IconImage;
@property (weak, nonatomic) IBOutlet UILabel *UserName;
@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *ClickLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;

@end
@implementation ZFKForumTableViewCell

-(void)setModel:(ZFKForumTableViewModel *)model{
    _model = model;
    self.titleLabel.text = _model.titleView;
    self.UserName.text = _model.NameView;
    self.TimeLabel.text = _model.Time;
    self.ClickLabel.text = _model.clickNum;
    self.commentLabel.text = _model.commentNum;
    
}


@end
