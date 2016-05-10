//
//  IWatchTeamLinShouDianZDHTableViewCell.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/8.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamLinShouDianZDHTableViewCell.h"
#import "IWatchTeamPricesModel.h"
@interface IWatchTeamLinShouDianZDHTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *titleView;
@property (weak, nonatomic) IBOutlet UILabel *textView;

@end
@implementation IWatchTeamLinShouDianZDHTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(IWatchTeamPricesModel *)model{

    _model=model;
    _titleView.text=_model.title;
    _textView.text=_model.bddizhi;

}
@end
