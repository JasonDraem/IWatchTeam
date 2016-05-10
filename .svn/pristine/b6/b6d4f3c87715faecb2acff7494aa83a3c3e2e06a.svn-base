//
//  IWatchTeamReserpodenViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamReserpodenViewController.h"


#import <MJRefresh/MJRefresh.h>
#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>

#import "URLHeader.h"
#import "IWatchTeamGetDataFactory.h"
#import "IWatchTeamSendMessageModel.h"
#import "IWacthAlertFactory.h"

#import "IWatchTeamSendTableViewCell.h"

static NSString *cellId = @"responderCellId";



@interface IWatchTeamReserpodenViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    MBProgressHUD *_hud;
}
//
@property (nonatomic, strong) UITableView *responderTableView;
@property (nonatomic, strong) NSMutableArray *responderDataSource;
//

@end

@implementation IWatchTeamReserpodenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightTextColor];
   //
    [self responderTableView];
    //
    [self responderDataSource];
}
////
- (UITableView *)responderTableView{
    WeakSelf(weakSelf)
    if (!_responderTableView) {
        //
        _responderTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, VIEW_HEITHT) style:UITableViewStylePlain];
        
        _responderTableView.delegate = self;
        _responderTableView.dataSource = self;
        //_responderTableView.backgroundColor = [UIColor redColor];
        _responderTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //
        //[_responderTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellId];
        UINib *sendNib = [UINib nibWithNibName:@"IWatchTeamSendTableViewCell" bundle:nil];
        [_responderTableView registerNib:sendNib forCellReuseIdentifier:cellId];
        //
        [self.view addSubview:_responderTableView];
        //
        //WeakSelf(weakSelf)
        MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf getDataWithPage:NO];
        }];
        _responderTableView.mj_header = header;
        //
        MJRefreshBackNormalFooter *footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
            [weakSelf getDataWithPage:YES];
        }];
        _responderTableView.mj_footer = footer;
        [_responderTableView.mj_header beginRefreshing];
        
    }
    return _responderTableView;
}
//
- (NSMutableArray *)responderDataSource{
    if (!_responderDataSource) {
        _responderDataSource = [[NSMutableArray alloc] init];
    }
    return _responderDataSource;
}
//
- (void)getDataWithPage:(BOOL)isLoading{
    
    _hud = [MBProgressHUD showHUDAddedTo:_responderTableView animated:YES];
    if (0 != _responderDataSource.count) {
        _hud.labelText = @"加载中......";
    }else{
        _hud.labelText = @"加载成功......";
    }

    //_hud.yOffset = VIEW_HEITHT/2  ;
    //
    NSInteger currentPage = 1;
    
    if (isLoading) {
        if (0 == _responderDataSource.count % 10) {
            currentPage = _responderDataSource.count / 10;
        }else{
            [_responderTableView.mj_footer endRefreshing];
            _hud.labelText = @"无最新数据";
            [_hud hide:YES afterDelay:1.0];
            return;
        }
    }
    //    //
    NSUserDefaults *messDefaults = [NSUserDefaults standardUserDefaults];
    NSString *uidStr = [messDefaults objectForKey:@"uid"];
    //
    NSMutableString *urlStr = [[NSMutableString alloc] init];
    //http://www.iwatch365.com/json/iphone/json.php?t=6&fid=1265983&p=1
    [urlStr appendFormat:@"%@%@", IWATCH_DOMAINNAME, IWATCH_TRIPPRO];
    [urlStr appendFormat:@"%@", IWATCH_RESPONDER];
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
                [_responderDataSource removeAllObjects];
                [_responderTableView reloadData];
            }
            //
            //model.send_Success = dict[@"success"];
            NSArray *dataArr = dict[@"data"];
            
            for (NSDictionary *zeroDic in dataArr) {
                
                IWatchTeamSendMessageModel *model = [[IWatchTeamSendMessageModel alloc] init];
                //
                model.send_Tid = zeroDic[@"tid"];
                model.send_Subject = zeroDic[@"subject"];
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
                [_responderDataSource addObject:model];
            }
            [_responderTableView reloadData];
            isLoading?[_responderTableView.mj_footer endRefreshing]:[_responderTableView.mj_header endRefreshing];
            [_hud hide:YES afterDelay:1.0];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        isLoading?[_responderTableView.mj_footer endRefreshing]:[_responderTableView.mj_header endRefreshing];
        [_hud hide:YES afterDelay:1.0];
    }];
    
}
//
#pragma mark - delegate -
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //NSLog(@"%ld", _responderDataSource.count);
    return _responderDataSource.count;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    IWatchTeamSendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    view.backgroundColor = [UIColor cyanColor];
    cell.selectedBackgroundView = view;
    
    IWatchTeamSendMessageModel *model = _responderDataSource[indexPath.row];
    //cell.textLabel.text = model.send_Subject;
    //
    [cell updateWithModel:model];
    
    return cell;
}
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
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
