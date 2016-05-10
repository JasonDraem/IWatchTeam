//
//  NewsTableViewCell.m
//  IWatchTeam
//
//  Created by DSB on 16/5/8.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "NewsTableViewCell.h"
#import "NewsAndModel.h"
#import <UIImageView+WebCache.h>

@implementation NewsTableViewCell


-(void)setModel:(NewsAndModel *)model{
    _model=model;
    [_iconImage sd_setImageWithURL:[NSURL URLWithString:_model.thumb]placeholderImage:nil];
    self.titleLable.text=_model.title;
    self.textLable.text=_model.text;
    
}








- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
