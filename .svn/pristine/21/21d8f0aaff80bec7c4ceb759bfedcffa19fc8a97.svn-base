//
//  IWatchTeamPersonSettingViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/1.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamPersonSettingViewController.h"
//
#import "IWatchTeamSuccessDetailTableViewController.h"

@interface IWatchTeamPersonSettingViewController ()
//
@property (nonatomic, strong) UILabel *detailLabel;

@end

@implementation IWatchTeamPersonSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.view.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:.7];
    self.navigationController.navigationBarHidden = NO;
    //
    [self setAttributesMethod];
}
//
- (void)setAttributesMethod{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"headerImageView" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    _headerImageView.image = image;
    //添加手势 修改头像
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    
    tapGesture.numberOfTapsRequired = 1;
    
    [_headerImageView addGestureRecognizer:tapGesture];
    _loginLabel.text = @"点击进入详情";
}
//
//- (UILabel *)createLoginLabel{
//    
////    if (!_loginLabel) {
////        _loginLabel = [[UILabel alloc] init];
////        //_loginLabel.backgroundColor = BACKGROUND_COLOR;
////        _loginLabel.text = @"点击头像登录";
////        _loginLabel.font = [UIFont systemFontOfSize:15];
////        _loginLabel.textAlignment = NSTextAlignmentCenter;
////        _loginLabel.textColor = [UIColor whiteColor];
////        [_MineTableView.tableHeaderView addSubview:_loginLabel];
////        //
////        [_loginLabel mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.centerX.equalTo(_headerImageView);
////            make.top.equalTo(_headerImageView.mas_bottom).with.offset(5);
////            make.size.mas_equalTo(CGSizeMake(UISCREEN_WIDTH/3, 30));
////        }];
////    }
//    return _loginLabel;
//}

//
#pragma mark - GestureRecognizer Method -
- (void)tapAction:(UITapGestureRecognizer *)tapGesture{
    IWatchTeamSuccessDetailTableViewController *seccessVC =[[IWatchTeamSuccessDetailTableViewController alloc] init];
    //
    self.tabBarController.tabBar.hidden = YES;
    //
    [self.navigationController pushViewController:seccessVC animated:YES];
}
//
- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}

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
