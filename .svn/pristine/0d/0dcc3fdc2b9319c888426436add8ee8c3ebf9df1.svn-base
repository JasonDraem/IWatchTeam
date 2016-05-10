//
//  IWatchMineTableViewCell.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/1.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchMineTableViewCell.h"
#import <Masonry/Masonry.h>

@interface IWatchMineTableViewCell ()

//
@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) UILabel *lineLabel;

@end

//
@implementation IWatchMineTableViewCell
//
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //
        [self setBaseAttributes];
    }
    return self;
}
//
- (void)setBaseAttributes{
    
    _iconImageView = [[UIImageView alloc] init];
    //_iconImageView.backgroundColor = BACKGROUND_COLOR;
    //
    _contentLabel = [[UILabel alloc] init];
    _contentLabel.font = [UIFont systemFontOfSize:15];
    //_contentLabel.backgroundColor = BACKGROUND_COLOR;
    //
    _lineLabel = [[UILabel alloc] init];
    //_lineLabel.backgroundColor = [UIColor grayColor];
    //
    _goImageView = [[UIImageView alloc] init];
    //_goImageView.backgroundColor = BACKGROUND_COLOR;
    //
    [self.contentView addSubview:_iconImageView];
    [self.contentView addSubview:_contentLabel];
    [self.contentView addSubview:_lineLabel];
    [self.contentView addSubview:_goImageView];
}
//重写系统layoutSubviews方法
//布局  适配
- (void)layoutSubviews{
    //
    [_iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(8, 8, 8, CELL_CONTENTVIEW_SZIE.width - 30));
        //make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    //
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(8, 40, 8, CELL_CONTENTVIEW_SZIE.width - 280));
        //make.size.mas_equalTo(CGSizeMake(32, 32));
    }];
    //
    [_lineLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(39, 5, 4, 0));
    }];
    //
    [_goImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(8, CELL_CONTENTVIEW_SZIE.width - 30, 8, 0));
    }];
}
//
- (void)updateWithArray:(NSMutableArray *)array{
    
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
