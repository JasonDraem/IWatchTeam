//
//  IWatchTeamSendTableViewCell.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamSendTableViewCell.h"
#import "IWatchTeamSendMessageModel.h"

@implementation IWatchTeamSendTableViewCell
//
- (void)updateWithModel:(IWatchTeamSendMessageModel *)sendModel{
    //
    self.seeButton.userInteractionEnabled = NO;
    self.messageButton.userInteractionEnabled = NO;
    //
    self.sendTitleLabel.text = sendModel.send_Subject;
    self.userNameLabel.text = sendModel.send_Author;
    [self.seeButton setImage:[[UIImage imageNamed:@"see-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.seeLabel.text = sendModel.send_View;
    
    //
    [self.messageButton setImage:[[UIImage imageNamed:@"messages-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    self.messageLabel.text = sendModel.send_Replines;
    //
    
    //
    NSString *path = [[NSBundle mainBundle] pathForResource:@"headerImageView" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    self.userImageView.image = image;
    self.userImageView.layer.cornerRadius = 11;
    self.userImageView.layer.masksToBounds = YES;
}
//
- (void)changeImage{
    
}
//
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
