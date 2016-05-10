//
//  IWatchTeamNoticeViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamNoticeViewController.h"

#import <MJRefresh/MJRefresh.h>
#import <MBProgressHUD/MBProgressHUD.h>

#import "IWatchTeamGetDataFactory.h"
#import "URLHeader.h"
#import "IWatchTeamTXModel.h"


static NSString *cellID = @"TXCellId";

@interface IWatchTeamNoticeViewController ()<UITableViewDataSource, UITableViewDelegate>
//
@property (nonatomic, copy) NSString *tx_fid;
@property (nonatomic, strong) UITableView *txTabelView;
@property (nonatomic, strong) NSMutableArray *txDataSource;

@end

@implementation IWatchTeamNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.view.backgroundColor = [UIColor lightTextColor];
    self.navigationController.navigationBarHidden = YES;
     _itemTitleLable.text = @"提 醒";
    //
    [self txDataSource];
    //
    [self txTabelView];
}
//
//
- (NSMutableArray *)txDataSource{
    if (!_txDataSource) {
        _txDataSource = [[NSMutableArray alloc] init];
    }
    return _txDataSource;
}
//
- (UITableView *)txTabelView{
    if (!_txTabelView) {
        _txTabelView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, VIEW_WIDTH, VIEW_HEITHT - 64) style:UITableViewStylePlain];
        //
        _txTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _txTabelView.dataSource = self;
        _txTabelView.delegate = self;
        //
        [_txTabelView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        //
        [self.view addSubview:_txTabelView];
        //
        WeakSelf(weakSelf)
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf getTXData:NO];
        }];
        _txTabelView.mj_header = header;
        //
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf getTXData:YES];
        }];
        //
        _txTabelView.mj_footer = footer;
        [_txTabelView.mj_header beginRefreshing];
    }
    return _txTabelView;
}
//
- (void)getTXData:(BOOL)isLoadingMore{
    //json.php?t=32&fid=1265983&p=1
    WeakSelf(weakSelf)
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    //
    NSInteger currentPage = 1;
    if (isLoadingMore) {
        if (0 == _txDataSource.count % 10) {
            currentPage = _txDataSource.count / 10;
        }else{
            [_txTabelView.mj_footer endRefreshing];
            return;
        }
    }
    //
    NSUserDefaults *messDefaults = [NSUserDefaults standardUserDefaults];
    self.tx_fid = [messDefaults objectForKey:@"uid"];
    NSMutableString *urlStr = [[NSMutableString alloc] init];
    [urlStr appendFormat:@"%@%@", IWATCH_DOMAINNAME, IWATCH_TRIPPRO];
    [urlStr appendFormat:@"%@", IWATCH_TX];
    [urlStr appendFormat:@"%@", self.tx_fid];
    //&p=1
    [urlStr appendFormat:@"&p=%ld", currentPage];
    //NSLog(@"8888888888888888----->%@", urlStr);
    [[IWatchTeamGetDataFactory AFShareManager] JSGetTXData:urlStr backResult:^(IWatchTeamTXModel *model, NSError *error) {
        if (!error) {
            //
            if (!isLoadingMore) {
                [_txDataSource removeAllObjects];
                [_txTabelView reloadData];
            }
            //
            if (0 == [model.TX_Success integerValue]) {
                hud.labelText = @"没有未读提醒";
                [hud hide:YES afterDelay:1.0];
                //
                isLoadingMore?[_txTabelView.mj_footer endRefreshing]:[_txTabelView.mj_header endRefreshing];
                return ;
            }else{
                hud.labelText = @"加载中...";
                [_txDataSource addObject:model];
                [_txTabelView reloadData];
                //
                [hud hide:YES afterDelay:1.0];
            }
            //
        }else{
            isLoadingMore?[_txTabelView.mj_footer endRefreshing]:[_txTabelView.mj_header endRefreshing];
        }
        
    }];
}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _txDataSource.count;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
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
