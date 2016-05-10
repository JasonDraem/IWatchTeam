//
//  ZFKForumCollectionViewCell.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/5.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ZFKForumCollectionViewCell.h"
#import "ZFKForumModel.h"
#import <UIImageView+WebCache.h>
@interface ZFKForumCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *IconImage;
@property (weak, nonatomic) IBOutlet UILabel *NameLabel;
@property (weak, nonatomic) IBOutlet UILabel *SubjectNumLabel;

@end

@implementation ZFKForumCollectionViewCell

-(void)setModel:(ZFKForumModel *)model{
    _model = model;
    self.NameLabel.text = _model.nameView;
    self.SubjectNumLabel.text = [NSString stringWithFormat:@"%@个主题",_model.subjectNum];
    [self.IconImage sd_setImageWithURL:[NSURL URLWithString:_model.IconImage] placeholderImage:[UIImage imageNamed:@"placehodler_64"]];
}

@end
