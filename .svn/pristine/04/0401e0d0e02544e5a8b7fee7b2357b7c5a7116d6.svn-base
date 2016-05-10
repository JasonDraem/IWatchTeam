//
//  IWatchTeamCollectonWatchViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/7.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamCollectonWatchViewController.h"

#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <MJRefresh/MJRefresh.h>

#import "URLHeader.h"
#import "IWatchTeamWatchModel.h"
#import "IWatchTeamWatchCollectionViewCell.h"

#import "IWacthAlertFactory.h"
//

static NSString *cellId = @"collectionWatchID";
@interface IWatchTeamCollectonWatchViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>
{
    MBProgressHUD *_hud;
}
//
@property (nonatomic, strong) UICollectionView *watchCollectionView;
//
@property (nonatomic, strong) NSMutableArray *watchDataSource;

@end

@implementation IWatchTeamCollectonWatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightTextColor];
    //
    [self watchDataSource];
    //
    [self watchCollectionView];
}
//
- (UICollectionView *)watchCollectionView{
    WeakSelf(weakSelf)
    if (!_watchCollectionView) {
        
        _watchCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, VIEW_HEITHT - 64) collectionViewLayout:[self createLayout]];
        //
        _watchCollectionView.delegate = self;
        _watchCollectionView.dataSource = self;
        _watchCollectionView.backgroundColor = [UIColor lightTextColor];
        UINib *collectionNib = [UINib nibWithNibName:@"IWatchTeamWatchCollectionViewCell" bundle:nil];
        //
        //[_watchCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:cellId];
        [_watchCollectionView registerNib:collectionNib forCellWithReuseIdentifier:cellId];
        
        [self.view addSubview:_watchCollectionView];
        //
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf getData:NO];
        }];
        _watchCollectionView.mj_header = header;
        //
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf getData:YES];
        }];
        _watchCollectionView.mj_footer = footer;
        [_watchCollectionView.mj_header beginRefreshing];
    }
    return _watchCollectionView;
}
- (UICollectionViewFlowLayout *)createLayout{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    layout.itemSize = CGSizeMake(VIEW_WIDTH/3 + 50, VIEW_HEITHT/3);
    layout.minimumInteritemSpacing = 10;
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    
    return layout;
}
//
- (NSMutableArray *)watchDataSource{
    if (!_watchDataSource) {
        _watchDataSource = [[NSMutableArray alloc] init];
    }
    return _watchDataSource;
}
//
#pragma mark - -
- (void)getData:(BOOL)isLoading{
    _hud = [MBProgressHUD showHUDAddedTo:_watchCollectionView animated:YES];
    if (0 != _watchDataSource.count) {
        _hud.labelText = @"加载中......";
        
    }else{
        _hud.labelText = @"加载成功......";
        //
    }
    //
    NSInteger currentPage = 1;
    if (isLoading) {
        if (0 == _watchDataSource.count % 10) {
            currentPage = _watchDataSource.count /10;
        }else{
            [_watchCollectionView.mj_footer endRefreshing];
            [_hud hide:YES afterDelay:1.0];
            return;
        }
    }
    NSUserDefaults *messDefaults = [NSUserDefaults standardUserDefaults];
    NSString *uidStr = [messDefaults objectForKey:@"uid"];
    //
    NSMutableString *urlStr = [[NSMutableString alloc] init];
    //
    [urlStr appendFormat:@"%@%@", IWATCH_DOMAINNAME, IWATCH_TRIPPRO];
    [urlStr appendFormat:@"%@", IWATCH_COLLECTION_WATCH];
    [urlStr appendFormat:@"%@", uidStr];
    [urlStr appendFormat:@"&p=%ld", currentPage];
    //
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        if (!error) {
            if (!isLoading) {
                [_watchDataSource removeAllObjects];
                [_watchCollectionView reloadData];
            }
            NSArray *dataArr = dict[@"data"];
            for (NSDictionary *zeroDic in dataArr) {
                IWatchTeamWatchModel *model = [[IWatchTeamWatchModel alloc] init];
                model.watch_ID = zeroDic[@"id"];
                model.watch_Wid = zeroDic[@"wid"];
                model.watch_Wpic = zeroDic[@"wprice"];
                model.watch_Wname = zeroDic[@"wname"];
                model.watch_Wpic = zeroDic[@"wpic"];
                model.watch_Wuid = zeroDic[@"wuid"];
                [_watchDataSource addObject:model];
            }
            [_watchCollectionView reloadData];
            isLoading?[_watchCollectionView.mj_footer endRefreshing]:[_watchCollectionView.mj_header endRefreshing];
            [_hud hide:YES afterDelay:1.0];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        isLoading?[_watchCollectionView.mj_footer endRefreshing]:[_watchCollectionView.mj_header endRefreshing];
        [_hud hide:YES afterDelay:1.0];
    }];
    
}
#pragma mark - -
//
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _watchDataSource.count;
}
//
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    IWatchTeamWatchCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellId forIndexPath:indexPath];
    //
    IWatchTeamWatchModel *model = _watchDataSource[indexPath.row];
    [cell updateWithModel:model];
    
    return cell;
}
//
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [IWacthAlertFactory autmicDismisAlertWithTitle:nil withMessage:@"抱歉，您暂时无法操作，工程师们正在努力维修中..." withTime:2.0 onView:self];
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
