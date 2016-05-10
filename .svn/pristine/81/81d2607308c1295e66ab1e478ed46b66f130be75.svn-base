//
//  NewBuyWatchCollectionCell.m
//  IWatchTeam
//
//  Created by 丶苹果 on 16/5/7.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "NewBuyWatchCollectionCell.h"

#import <UIImageView+WebCache.h>

@implementation NewBuyWatchCollectionCell


//UIImageView *mainImageVIew
//UILabel *descriptionView;
//UIImageView *iconImageView
//UILabel *iconNameView;
//UIImageView *eyeImageView;
//UILabel *sayLabelView;

-(void)setModel:(NewBuyWatchModel *)model
{
    _model = model;
    
    [_mainImageVIew sd_setImageWithURL:[NSURL URLWithString:model.attachImage] placeholderImage:[UIImage imageNamed:@""]];
    [_iconImageView sd_setImageWithURL:[NSURL URLWithString:model.authorImage] placeholderImage:[UIImage imageNamed:@""]];
    
    _mainImageVIew.layer.cornerRadius = 8;
    _mainImageVIew.layer.masksToBounds = YES;
    
    _iconImageView.layer.cornerRadius = 15;
    _iconImageView.layer.masksToBounds = YES;
    
    _descriptionView.text = model.subject;
    _iconNameView.text = model.author;
    _sayLabelView.text = model.views;
    
    
    
}

@end














