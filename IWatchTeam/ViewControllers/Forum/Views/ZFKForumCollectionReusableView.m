//
//  ZFKForumCollectionReusableView.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ZFKForumCollectionReusableView.h"

@implementation ZFKForumCollectionReusableView
{
    UILabel *_titleLabel;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc]initWithFrame:self.bounds];
        _titleLabel.backgroundColor = [UIColor whiteColor];
        [self addSubview:_titleLabel];
    }
    return self;
}
//重写set方法
-(void)setTitle:(NSString *)title{
    _title = title;
    _titleLabel.text = _title;
}
@end
