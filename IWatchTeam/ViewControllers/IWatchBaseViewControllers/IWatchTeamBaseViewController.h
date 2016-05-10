//
//  IWatchTeamBaseViewController.h
//  IWatchTeam
//
//  Created by JasonXu on 16/4/30.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import <UIKit/UIView.h>

@interface IWatchTeamBaseViewController : UIViewController
{
    UIView *_navigationView;
    UILabel *_titleLabel;
    UISearchController *_IWatchSerachVC;
}

//@property (nonatomic, strong)UIView *navigationView;

//
//- (UIView *)navigationView;
@end
