//
//  IWatchSettingDetailViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/2.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchSettingDetailViewController.h"

#import "IWatchTeamGetDataFactory.h"

#import "URLHeader.h"

static NSString *settingCellId = @"settingId";

@interface IWatchSettingDetailViewController ()

@end

@implementation IWatchSettingDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.navigationController.navigationBarHidden = NO;
    
    //self.navigationController.navigationItem.backBarButtonItem =
    
    //
    [self createSettingTabelView];
    //
    [self createDataSource];
}
//
#pragma mark -  -
- (UITableView *)createSettingTabelView{
    if (!_settingTableView) {
        
        _settingTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_HEIGHT) style:UITableViewStylePlain];
        _settingTableView.delegate = self;
        _settingTableView.dataSource = self;
        _settingTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //
        [_settingTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:settingCellId];
        
        [self.view addSubview:_settingTableView];
    }
    return _settingTableView;
}
//
- (NSMutableArray *)createDataSource{
    if (!_settingDataSource) {
        _settingDataSource = [[NSMutableArray alloc] init];
    }
    return _settingDataSource;
}
//
- (void)getLoginData{
    NSMutableString *loginURL = [[NSMutableString alloc] init];
    [loginURL appendFormat:@"%@%@", IWATCH_DOMAINNAME, IWATCH_TRIPPRO];
    //
    //
    [[IWatchTeamGetDataFactory AFShareManager] JSGetLoginData:loginURL parameters:nil resultHandle:^(id result, NSError *error) {
        
    }];
}
//
#pragma mark -  -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _settingDataSource.count;
}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_settingDataSource[section] count];
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:settingCellId];
    
    
    return cell;
}
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
