//
//  IWatchTeamMineViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/4/30.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamMineViewController.h"
#import "UIScrollView+ScalableCover.h"
#import "IWatchMineTableViewCell.h"

#import "IWatchTeamLoginViewController.h"
#import "IWatchSystemSettingViewController.h"
#import "IWatchTeamSuccessViewController.h"
#import "LoginUserModel.h"
#import "IWatchTeamResigistViewController.h"
#import "IWacthAlertFactory.h"


#import "IWatchTeamMyMessageViewController.h"
#import "IWatchTeamNoticeViewController.h"
#import "IWatchTeamTZViewController.h"
#import "IWatchTeamMyCollectionViewController.h"
//
static NSString *MineCellId = @"MineCellId";
@interface IWatchTeamMineViewController ()
@end

@implementation IWatchTeamMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor lightGrayColor];
    _IWatchSerachVC.searchBar.hidden = YES;
    //创建数据源
    [self createMineDataSource];
    //创建表格列表
    [self createMineTableView];
}
//
- (UITableView *)createMineTableView{
    if (!_MineTableView) {
        
        _MineTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEITHT - 49) style:UITableViewStylePlain];
        _MineTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _MineTableView.delegate = self;
        _MineTableView.dataSource = self;
        //注册复用标识
        [_MineTableView registerClass:[IWatchMineTableViewCell class] forCellReuseIdentifier:MineCellId];
        //头部视图
        _MineTableView.tableHeaderView = [[UITableViewHeaderFooterView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 200)];
        //
//        [_MineTableView addScalableCoverWithImage:[[UIImage imageNamed:@"personal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        NSString *path = [[NSBundle mainBundle] pathForResource:@"personal" ofType:@"jpg"];
        [_MineTableView addScalableCoverWithImage:path];
        //
        [self.view addSubview:_MineTableView];
    }
    //
    [self setImageView];
    //
    return _MineTableView;
}
//
- (UIImageView *)setImageView{
    
    if (!_headerImageView) {
        //_headerImageView =[[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
        _headerImageView =[[UIImageView alloc] init];

        //_headerImageView.center = _MineTableView.tableHeaderView.center;
        //_headerImageView.backgroundColor = [UIColor redColor];
        _headerImageView.layer.cornerRadius = 35;
        _headerImageView.alpha = 1.0;
        //
        _headerImageView.clipsToBounds = YES;
        _headerImageView.userInteractionEnabled = YES;
        //添加手势 修改头像
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
        
        tapGesture.numberOfTapsRequired = 1;
        
        [_headerImageView addGestureRecognizer:tapGesture];
        
        [_MineTableView.tableHeaderView addSubview:_headerImageView];
        //
        [_headerImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_MineTableView.tableHeaderView);
            make.size.mas_equalTo(CGSizeMake(70, 70));
        }];
        //
        [self createLoginLabel];
    }
    return _headerImageView;
}
//
- (UILabel *)createLoginLabel{
    
    if (!_loginLabel) {
        _loginLabel = [[UILabel alloc] init];
        
        //_loginLabel.backgroundColor = BACKGROUND_COLOR;
        
        _loginLabel.font = [UIFont systemFontOfSize:13];
        _loginLabel.textAlignment = NSTextAlignmentCenter;
        _loginLabel.textColor = [UIColor whiteColor];
        [_MineTableView.tableHeaderView addSubview:_loginLabel];
        //
        [_loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_headerImageView);
            make.top.equalTo(_headerImageView.mas_bottom).with.offset(5);
            make.size.mas_equalTo(CGSizeMake(UISCREEN_WIDTH/3, 30));
        }];
    }
    //
    //[self setHeaderImageViews];
    return _loginLabel;
}
//
//
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
    //
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if (![defaults objectForKey:@"username"]){
        NSString *path = [[NSBundle mainBundle] pathForResource:@"noLogin@2x" ofType:@"png"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _headerImageView.image = image;
        _loginLabel.text = @"点击头像登录";
    }else{
        NSString *path = [[NSBundle mainBundle] pathForResource:@"headerImageView" ofType:@"jpg"];
        UIImage *image = [UIImage imageWithContentsOfFile:path];
        _headerImageView.image = image;
        _loginLabel.text = @"点击头像查看详情";
    }
}
//
- (NSMutableArray *)createMineDataSource{
    if (!_MineDataSource) {
        _MineDataSource = [[NSMutableArray alloc] init];
        NSArray *sectionOne =[[NSArray alloc] initWithObjects:@"我的私信", @"提醒", @"我的帖子", @"我的收藏", nil];
        NSArray *sectionTwo = [[NSArray alloc] initWithObjects:@"分享好友",  @"系统设置", nil];
        [_MineDataSource addObject:sectionOne];
        [_MineDataSource addObject:sectionTwo];
        //
        _MineImageSource = [[NSMutableArray alloc] init];
        NSArray *sectionImageOne = @[@"Mymessage", @"notice", @"mypage", @"mycollection"];
        NSArray *sectionImageTwo = @[@"shareTo", @"setting"];
        //
        [_MineImageSource addObject:sectionImageOne];
        [_MineImageSource addObject:sectionImageTwo];
    }
    return _MineDataSource;
}
//
#pragma mark - Delegate Method -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _MineDataSource.count;
}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_MineDataSource[section] count];
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //
    IWatchMineTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MineCellId forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    //cell.textLabel.text = _MineDataSource[indexPath.section][indexPath.row];
    //
    cell.contentLabel.text = _MineDataSource[indexPath.section][indexPath.row];
    cell.iconImageView.image = [[UIImage imageNamed:_MineImageSource[indexPath.section][indexPath.row]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    cell.goImageView.image = [[UIImage imageNamed:@"go"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    if (1==indexPath.section&&0 == indexPath.row) {
//        cell.userInteractionEnabled = NO;
//    }
    
    return cell;
}
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (1 == indexPath.section){
        if (0 == indexPath.row) {
            [IWacthAlertFactory autmicDismisAlertWithTitle:nil withMessage:@"抱歉，此操作暂时无响应，工程师们努力维修中" withTime:2.0 onView:self];
        }else if (1 == indexPath.row){
            IWatchSystemSettingViewController *systemSVC = [[IWatchSystemSettingViewController alloc] init];
            
            self.tabBarController.tabBar.hidden = YES;
            [self.navigationController pushViewController:systemSVC animated:YES];
        }
    }else{
        //
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        if (![defaults objectForKey:@"username"]){
            
            IWatchTeamLoginViewController *loginVC = [[IWatchTeamLoginViewController alloc] init];
            [self presentViewController:loginVC animated:YES completion:^{
                
            }];
        }else if (0 == indexPath.section) {
            if (0 == indexPath.row) {
                
                //
                IWatchTeamMyMessageViewController *messageVC = [[IWatchTeamMyMessageViewController alloc] init];
                
                [self.navigationController pushViewController:messageVC animated:YES];
                //
            }else if (1 == indexPath.row){
                
                IWatchTeamNoticeViewController *NVC = [[IWatchTeamNoticeViewController alloc] init];
                
                [self.navigationController pushViewController:NVC animated:YES];
                //
            }else if (2 == indexPath.row){
                IWatchTeamTZViewController *TVC = [[IWatchTeamTZViewController alloc] init];
                [self.navigationController pushViewController:TVC animated:YES];
                //
            }else if (3 == indexPath.row){
                IWatchTeamMyCollectionViewController *CVC = [[IWatchTeamMyCollectionViewController alloc] init];
                [self.navigationController pushViewController:CVC animated:YES];
            }
            self.tabBarController.tabBar.hidden = YES;
        }

    }
    
    
//    if (indexPath.section == 1 && indexPath.row == 1) {
//        
//        IWatchSystemSettingViewController *systemSVC = [[IWatchSystemSettingViewController alloc] init];
//        
//        [self.navigationController pushViewController:systemSVC animated:YES];
//    }
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 15;
}
#pragma mark - GestureRecognizer Method -
- (void)tapAction:(UITapGestureRecognizer *)tapGesture{
    //NSLog(@"触发点击手势");
//    IWatchTeamPersonSettingViewController *personalSetting = [[IWatchTeamPersonSettingViewController alloc] init];
//    //
//    self.tabBarController.tabBar.hidden = YES;
//    //
//    [self.navigationController pushViewController:personalSetting animated:YES];
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([userDefaults objectForKey:@"username"]) {
        //如果是登陆过了 则直接进入登陆成功显示信息的页面
        //
        //IWatchTeamSuccessDetailTableViewController *successVC = [[IWatchTeamSuccessDetailTableViewController alloc] init];
        IWatchTeamSuccessViewController *successVC = [[IWatchTeamSuccessViewController alloc] init];
        //self.tabBarController.hidesBottomBarWhenPushed = YES;
        self.tabBarController.tabBar.hidden = YES;
        
        NSString *url = [userDefaults objectForKey:@"uid"];
        successVC.uidURL = url;
        //NSLog(@"登陆过了....%@", successVC.uidURL);
        
        [self.navigationController pushViewController:successVC animated:YES];
    }else{
        //否则登陆界面
        IWatchTeamLoginViewController *loginVC = [[IWatchTeamLoginViewController alloc] init];
        //
        //self.tabBarController.tabBar.hidden = YES;
        //[self.navigationController pushViewController:loginVC animated:YES];
        [self presentViewController:loginVC animated:YES completion:^{
        }];

    }
}
//
//
//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
