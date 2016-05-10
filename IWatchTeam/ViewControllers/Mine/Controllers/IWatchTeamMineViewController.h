//
//  IWatchTeamMineViewController.h
//  IWatchTeam
//
//  Created by JasonXu on 16/4/30.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamBaseViewController.h"

@interface IWatchTeamMineViewController : IWatchTeamBaseViewController<UITableViewDataSource, UITableViewDelegate>
{
   
    UITableView * _MineTableView;
   
    UIImageView * _headerImageView;
    UILabel * _loginLabel;
}
//静态tableview
@property (nonatomic, strong) UITableView *MineTableView;
//头部拉伸可放大头视图
@property (nonatomic, strong) UIImageView *headerImageView;
//我的页面数据源
@property (nonatomic, strong) NSMutableArray *MineDataSource;
//cell里设置图片
@property (nonatomic, strong) NSMutableArray *MineImageSource;
//提示登录标签
@property (nonatomic, strong) UILabel *loginLabel;
@end
