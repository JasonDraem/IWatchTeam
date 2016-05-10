//
//  IWatchTeamCollectionTZViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/7.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamCollectionTZViewController.h"

#import <MJRefresh/MJRefresh.h>
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>

#import "URLHeader.h"
#import "IWatchTeamGetDataFactory.h"
#import "IWatchTeamSendMessageModel.h"

#import "IWacthAlertFactory.h"

#import "IWatchTeamSendTableViewCell.h"

static NSString *cellId = @"collectionCellId";


@interface IWatchTeamCollectionTZViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    MBProgressHUD *_hud;
}

//
@property (nonatomic, strong) UITableView *tzTableView;
@property (nonatomic, strong) NSMutableArray *tzDataSource;
//
@end

@implementation IWatchTeamCollectionTZViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightTextColor];
    //
    [self tzDataSource];
    //
    [self tzTableView];
}
//
- (UITableView *)tzTableView{
    WeakSelf(weakSelf)
    if (!_tzTableView) {
        //
        _tzTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEITHT) style:UITableViewStylePlain];
        
        _tzTableView.delegate = self;
        _tzTableView.dataSource = self;
        //_tzTableView.backgroundColor = [UIColor redColor];
        _tzTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //
        //[_tzTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
        UINib *sendNib = [UINib nibWithNibName:@"IWatchTeamSendTableViewCell" bundle:nil];
        [_tzTableView registerNib:sendNib forCellReuseIdentifier:cellId];
        //
        [self.view addSubview:_tzTableView];
        //
        //WeakSelf(weakSelf)
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf getDataWithPage:NO];
        }];
        _tzTableView.mj_header = header;
        //
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf getDataWithPage:YES];
        }];
        _tzTableView.mj_footer = footer;
        [_tzTableView.mj_header beginRefreshing];
        
    }
    return _tzTableView;
}
//
- (NSMutableArray *)tzDataSource{
    if (!_tzDataSource) {
        _tzDataSource = [[NSMutableArray alloc] init];
    }
    return _tzDataSource;
}
//
- (void)getDataWithPage:(BOOL)isLoading{
    _hud = [MBProgressHUD showHUDAddedTo:_tzTableView animated:YES];
    if (0 != _tzDataSource.count) {
        _hud.labelText = @"加载中......";
    }else{
        _hud.labelText = @"加载成功......";
    }
    
    //_hud.yOffset = VIEW_HEITHT/2  ;
    //
    NSInteger currentPage = 1;
    
    if (isLoading) {
        if (0 == _tzDataSource.count % 10) {
            currentPage = _tzDataSource.count / 10;
        }else{
            [_tzTableView.mj_footer endRefreshing];
            _hud.labelText = @"无需加载...";
            [_hud hide:YES afterDelay:1.0];
            return;
        }
    }
    //    //
    NSUserDefaults *messDefaults = [NSUserDefaults standardUserDefaults];
    NSString *uidStr = [messDefaults objectForKey:@"uid"];
    //
    NSMutableString *urlStr = [[NSMutableString alloc] init];
    //
    [urlStr appendFormat:@"%@%@", IWATCH_DOMAINNAME, IWATCH_TRIPPRO];
    [urlStr appendFormat:@"%@", IWATCH_COLLECTION_TZ];
    [urlStr appendFormat:@"%@", uidStr];
    [urlStr appendFormat:@"&p=%ld", currentPage];
    //NSLog(@"+++++++++>%@",urlStr);
    //
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlStr parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        //
        if (!error) {
            
            if (!isLoading) {
                [_tzDataSource removeAllObjects];
                [_tzTableView reloadData];
            }
            //
            //model.send_Success = dict[@"success"];
            NSArray *dataArr = dict[@"data"];
            
            for (NSDictionary *zeroDic in dataArr) {
                
                IWatchTeamSendMessageModel *model = [[IWatchTeamSendMessageModel alloc] init];
                //
                model.send_Tid = zeroDic[@"favid"];
                model.send_Subject = zeroDic[@"title"];
                model.send_Deteline = zeroDic[@"dateline"];
                model.send_Lastpost = zeroDic[@"lastpost"];
                model.send_LastPoster = zeroDic[@"lastposter"];
                model.send_View = zeroDic[@"views"];
                model.send_Replines = zeroDic[@"replies"];
                model.send_Author = zeroDic[@"author"];
                model.send_Authorid = zeroDic[@"authorid"];
                model.send_Displayorder = zeroDic[@"displayorder"];
                model.send_Attachment = zeroDic[@"attachment"];
                //
                [_tzDataSource addObject:model];
            }
            [_tzTableView reloadData];
            isLoading?[_tzTableView.mj_footer endRefreshing]:[_tzTableView.mj_header endRefreshing];
            [_hud hide:YES afterDelay:1.0];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        isLoading?[_tzTableView.mj_footer endRefreshing]:[_tzTableView.mj_header endRefreshing];
        [_hud hide:YES afterDelay:1.0];
    }];
    
}
//
#pragma mark - delegate -
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //NSLog(@"%ld", _tzDataSource.count);
    return _tzDataSource.count;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    IWatchTeamSendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    view.backgroundColor = [UIColor cyanColor];
    cell.selectedBackgroundView = view;
    
    IWatchTeamSendMessageModel *model = _tzDataSource[indexPath.row];
    
    [cell updateWithModel:model];
    
    return cell;
}
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [IWacthAlertFactory autmicDismisAlertWithTitle:nil withMessage:@"抱歉，您暂时无法操作，工程师们正在努力维修中..." withTime:2.0 onView:self];
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
