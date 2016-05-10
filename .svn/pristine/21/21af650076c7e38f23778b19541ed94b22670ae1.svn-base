//
//  ZFKForumViewController.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ZFKForumViewController.h"
#import "ZFKForumTableViewModel.h"
#import "MJRefresh.h"
#import "AFNetworking.h"
#import "IWatchTeamGetDataFactory.h"
#import "ZFKForumTableViewCell.h"
#import "URLHeader.h"
#import "ZFKForumWebViewController.h"
#define FORUM_URL @"http://www.iwatch365.com/json/iphone/json.php?t=7&fid=&p="


@interface ZFKForumViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    int _page;
    int _id;
    UITableView *_tableView;
    NSMutableArray * _dataArray;
}
@end

@implementation ZFKForumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBarHidden = NO;
    
    [self dataArray];
    [self createTableView];
    [self getData:_page];
    [self addRefresh];

    
}

-(void)createTableView{
    //    初始化
    _page = 1;
    _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    //    设置代理
    _tableView.dataSource = self;
    _tableView.delegate = self;
    UINib *nib = [UINib nibWithNibName:@"ZFKForumTableViewCell" bundle:nil];
    [_tableView registerNib:nib forCellReuseIdentifier:@"ZFKForumTableViewCell"];
    _tableView.rowHeight = 80;
    //    添加到视图
    [self.view addSubview:_tableView];
    
}
-(void)addRefresh{
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getNewData)];
    _tableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMoreData)];
}
- (void)getNewData {
    _page = 1;
    [self getData:_page];
    
}
- (void)getMoreData {
    _page++;
    [self getData:_page];
}
-(void)getData:(int)page{
    page = _page;
    IWatchTeamGetDataFactory *mgr = [IWatchTeamGetDataFactory AFShareManager];
    NSMutableString *urlStr = [[NSMutableString alloc] init];
    [urlStr appendFormat:@"%@%@", IWATCH_DOMAINNAME, IWATCH_TRIPPRO];
    [urlStr appendFormat:@"json.php?t=7"];
    [urlStr appendFormat:@"&fid=%@", self.ID];
    [urlStr appendFormat:@"&p=%d", page];
    
    [mgr GET:urlStr param:nil success:^(NSData *data) {
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSArray *array = dict[@"data"];
        for (NSDictionary *dic in array) {
            ZFKForumTableViewModel *model = [[ZFKForumTableViewModel alloc]initWithDictionary:dic error:nil];
            [_dataArray addObject:model];
        }
        //        NSLog(@"%@",_dataArray);
        [_tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}

-(NSMutableArray *)dataArray{
    
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    return _dataArray;
}
#pragma mark - Delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"ZFKForumTableViewCell";
    ZFKForumTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.model = _dataArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    ZFKForumTableViewModel *model = _dataArray[indexPath.row];
    ZFKForumWebViewController *WebVc = [[ZFKForumWebViewController alloc]init];
    WebVc.fid = model.WebID;
    [self.navigationController pushViewController:WebVc animated:YES];
}





@end
