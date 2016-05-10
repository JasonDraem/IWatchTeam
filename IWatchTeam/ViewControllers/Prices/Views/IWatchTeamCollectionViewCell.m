//
//  IWatchTeamCollectionViewCell.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/5.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamCollectionViewCell.h"
#import "IWatchTeamPricesModel.h"
#import <UIImageView+WebCache.h>
@interface IWatchTeamCollectionViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *picView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *accountLabel;

@end
@implementation IWatchTeamCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setModel:(IWatchTeamPricesModel *)model{
    
    _model=model;
    [self.picView sd_setImageWithURL:[NSURL URLWithString:_model.thumb] placeholderImage:nil];
    self.nameLabel.text=_model.cname;
    self.accountLabel.text=[NSString stringWithFormat:@"%@只手表",_model.biaonum];
    // NSLog(@"%@",_model.thumb);
}
@end
