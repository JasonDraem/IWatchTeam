//
//  IWatchTeamBaseOperationViewController.h
//  IWatchTeam
//
//  Created by JasonXu on 16/5/7.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

@interface IWatchTeamBaseOperationViewController : UIViewController
//
{
    UIView *_navigationView;
    UIButton *_backButton;
    UILabel *_itemTitleLable;
}
//
@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) UIButton *backButton;
@property (nonatomic, strong) UILabel *itemTitleLable;

@end
