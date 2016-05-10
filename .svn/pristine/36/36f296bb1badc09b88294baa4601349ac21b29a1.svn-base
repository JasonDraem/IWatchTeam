//
//  Homepageone.m
//  IWatchTeam
//
//  Created by DSB on 16/5/7.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "Homepageone.h"
#import "IWatchHelper.pch"
#import "NewsTableViewCell.h"
#import "IWatchTeamGetDataFactory.h"
#import "URLHeader.h"
#import "NewsAndModel.h"
#import  <MJRefresh/MJRefresh.h>

@interface Homepageone ()<UITableViewDataSource,UITableViewDelegate>
{
    int _page;
}

@property (nonatomic,strong)UITableView *tableview;

@property (nonatomic,strong)NSMutableArray *dataArray;


@end

@implementation Homepageone

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //self.view.backgroundColor=[UIColor blueColor];
    //NSLog(@"22222222222222222222222");
    //self.view.backgroundColor=[UIColor blackColor];
    _page=1;
    [self creatertableview];
    [self addRefresh];
    
}
-(void)addRefresh{
    
    self.tableview.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMoreData)];
}

-(void)getMoreData{
    _page++;
    [self getdata:_page];
}

-(NSMutableArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    return _dataArray;
}
-(void)creatertableview{
    //NSLog(@"******************");
    self.tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 44,UISCREEN_WIDTH, UISCREEN_HEIGHT-44)];
    self.tableview.delegate=self;
    self.tableview.dataSource=self;
    // self.tableview.estimatedRowHeight=400;
    
    [self.view addSubview:self.tableview];
    
    //注册cell；
    UINib * nib=[UINib nibWithNibName:@"NewsTableViewCell" bundle:nil];
    [self.tableview registerNib:nib forCellReuseIdentifier:@"NewsTableViewCell"];
    self.tableview.rowHeight=300;
    [self getdata:_page];
}
-(void)getdata:(int)page
{
    
    //NSLog(@"1111111111111111111");
    IWatchTeamGetDataFactory *del =[IWatchTeamGetDataFactory AFShareManager];
    NSString * url =[NSString stringWithFormat:IWATCH_FIRST_NEWS,_page];
    [del GET:url param:nil success:^(NSData *data) {
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSArray *array=[[NSArray alloc]init];
        array=dic[@"data"];
        
        self.dataArray=[NewsAndModel arrayOfModelsFromDictionaries:array];
        //NSLog(@"%@",_dataArray);
        [self.tableview reloadData];
        [self.tableview.mj_footer endRefreshing];
        
        
    } failure:^(NSError *error) {
        
    }];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    1.cell标识符
    static NSString *identifier = @"NewsTableViewCell";
    //    2.从cell队列中取出cell
    NewsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //    3.创建cell
    cell.model=_dataArray[indexPath.row];
    return cell;
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
