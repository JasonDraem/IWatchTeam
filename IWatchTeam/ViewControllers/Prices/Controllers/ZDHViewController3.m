//
//  ZDHViewController3.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ZDHViewController3.h"
#import "IWatchTeamLinShouDianZDHTableViewCell.h"
#import "IWatchTeamPricesModel.h"
#import "IWatchTeamGetDataFactory.h"
@interface ZDHViewController3 ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSMutableArray * dataArray;
@property(nonatomic,strong)UITableView * tableView;
@end

@implementation ZDHViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createableView];
}
//懒加载
-(NSMutableArray *)dataArray{
    
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    return _dataArray;
    
}
-(void)createableView{
    
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height-30) style:UITableViewStylePlain];
    
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [self.view addSubview:self.tableView];
    
    UINib * nib=[UINib nibWithNibName:@"IWatchTeamLinShouDianZDHTableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"IWatchTeamLinShouDianZDHTableViewCell"];
    self.tableView.estimatedRowHeight=80;
    [self getdata];
    
}
-(void)getdata{
    IWatchTeamGetDataFactory  * dl=[IWatchTeamGetDataFactory AFShareManager];
    NSString * url=[NSString stringWithFormat:@"http://www.iwatch365.com/json/iphone/json_watch.php?t=35&fid=%@&p=1&uid=0&un=0",self.fid];
   // NSLog(@"%@",self.fid);
    [dl POST:url param:nil success:^(NSData *data) {
        NSDictionary * dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSArray * array=dic[@"data"];
        //        self.dataArray=[IWatchTeamPricesModel arrayOfModelsFromDictionaries:array];
        [self.dataArray removeAllObjects];
        self.dataArray = [IWatchTeamPricesModel arrayOfModelsFromDictionaries:array];
        //NSLog(@"%@",self.dataArray);
        [self.tableView reloadData];
    } failure:^(NSError *error) {
        
    }];
    
    
    
}
#pragma mark -tableView代理方法-
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //    1.cell标识符
    static NSString *identifier = @"IWatchTeamLinShouDianZDHTableViewCell";
    //    2.从cell队列中取出cell
    IWatchTeamLinShouDianZDHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //    3.创建cell
    //    if (!cell) {
    //        IWatchTeamZDHTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    //    }
    cell.model=self.dataArray[indexPath.row];
    // NSLog(@"%@",cell.model);
    return cell;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
