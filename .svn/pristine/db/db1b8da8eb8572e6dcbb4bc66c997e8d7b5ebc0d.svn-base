//
//  IWatchTeamTwoViewController.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/5.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamTwoViewController.h"
#import "IWatchTeamZDHTableViewCell.h"

#import "IWatchTeamGetDataFactory.h"
#import "IWatchTeamPricesModel.h"


@interface IWatchTeamTwoViewController ()<UIScrollViewDelegate>
//@property(nonatomic,strong)UISegmentedControl *seg;


@property(nonatomic,strong)UIScrollView * scrollView;

@property(nonatomic,strong)UISegmentedControl *segement;
@end

@implementation IWatchTeamTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor=[UIColor whiteColor];
    //self.navigationController.navigationBarHidden = YES;
   // NSLog(@"%@",self.fid);
    
    [self getSegmentedControl];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

//系列，全部表款，零售店，品牌介绍
#pragma mark - SegmentedControl
-(void)getSegmentedControl{
    
    _segement=[[UISegmentedControl alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30)];
    [_segement insertSegmentWithTitle:@"系列" atIndex:0 animated:YES];
    [_segement insertSegmentWithTitle:@"全部表款" atIndex:1 animated:YES];
    [_segement insertSegmentWithTitle:@"零售店" atIndex:2 animated:YES];
    [_segement insertSegmentWithTitle:@"品牌介绍" atIndex:3 animated:YES];
    [_segement addTarget:self action:@selector(doSth:) forControlEvents:UIControlEventValueChanged];
    _segement.selectedSegmentIndex=0;
    
    [self.view addSubview:_segement];
    
    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height- 30 - 64)];
    //self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:_scrollView];
    
    _scrollView.pagingEnabled = YES;
    _scrollView.delegate = self;
    _scrollView.showsHorizontalScrollIndicator = NO;
    //方向锁
    _scrollView.directionalLockEnabled = YES;
    //取消自动布局
    //self.automaticallyAdjustsScrollViewInsets = NO;
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 4, self.view.frame.size.height - 30);
    self.first =[[ZDHViewController1 alloc]init];
    self.two =[[ZDHViewController2 alloc]init];
    self.three=[[ZDHViewController3 alloc]init];
    self.four=[[ZDHViewController4 alloc]init];
    
    //指定该控制器为其子控制器
    [self addChildViewController:_first];
    [self addChildViewController:_two];
    [self addChildViewController:_three];
    [self addChildViewController:_four];
    self.first.fid=self.fid;
    self.two.fid=self.fid;
    self.three.fid=self.fid;
    self.four.fid=self.fid;
     //将视图view加入到scrollview上
    [self.scrollView addSubview:_first.view];
    [self.scrollView addSubview:_two.view];
    [self.scrollView addSubview:_three.view];
    [self.scrollView addSubview:_four.view];
    
    CGRect rect2=_two.view.frame;
    rect2.origin.x=self.view.frame.size.width;
    rect2.size.height=CGRectGetHeight(_scrollView.frame);
    _two.view.frame=rect2;
    CGRect rect3=_three.view.frame;
    rect3.origin.x=self.view.frame.size.width*2;
    rect3.size.height=CGRectGetHeight(_scrollView.frame);
    _three.view.frame=rect3;
    CGRect rect4=_four.view.frame;
    rect4.origin.x=self.view.frame.size.width*3;
    rect4.size.height=CGRectGetHeight(_scrollView.frame);
    _four.view.frame=rect4;
    


}
#pragma mark - Scrollview delegate
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger ratio = round(offSetX / self.view.frame.size.width);
    _segement.selectedSegmentIndex = ratio;
}

-(void)doSth:(UISegmentedControl * )seg{
    NSInteger index = seg.selectedSegmentIndex;
    CGRect frame = _scrollView.frame;
    frame.origin.x = index * CGRectGetWidth(_scrollView.frame);
    frame.origin.y = 0;
    [_scrollView scrollRectToVisible:frame animated:YES];
//    UISegmentedControl * sege=seg;
//    if (sege.selectedSegmentIndex==0) {
//        self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, self.view.frame.size.width, self.view.frame.size.height-30) style:UITableViewStyleGrouped];
//        _tableView.delegate=self;
//        _tableView.dataSource=self;
//        [self.view addSubview:self.tableView];
//        UINib * nib=[UINib nibWithNibName:@"IWatchTeamZDHTableViewCell" bundle:nil];
//        [self.tableView registerNib:nib forCellReuseIdentifier:@"IWatchTeamZDHTableViewCell"];
//        self.tableView.estimatedRowHeight=300;
//        [self getdata];
//
//    }else if (sege.selectedSegmentIndex==1){
//    
//        //初始化布局对象
//        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//        //    设置滚动方向
//        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//        //    设置行间距
//        layout.minimumLineSpacing = 5;
//        //    设置列间距
//        layout.minimumInteritemSpacing = 5;
//        //    设置item的大小
//        layout.itemSize = CGSizeMake(self.view.frame.size.width/2-5, 50);
//        
//        //    初始化_collectionView并设置布局对象
//        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
//        
//        _collectionView.backgroundColor = [UIColor whiteColor];
//        //    设置代理
//        _collectionView.dataSource = self;
//        _collectionView.delegate = self;
//        //    添加到视图
//        [self.view addSubview:_collectionView];
//        
//        [self.collectionView registerNib:[UINib nibWithNibName:@"IWatchTeamPricesZDHCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"IWatchTeamPricesZDHCollectionViewCell"];
//        [self getdata1];
//    }
//
//
//}
//-(void)getdata{
//    IWatchTeamGetDataFactory  * dl=[IWatchTeamGetDataFactory AFShareManager];
//    NSString * url=[NSString stringWithFormat:@"http://www.iwatch365.com/json/iphone/json_watch.php?t=33&fid=%@",self.fid];
//    [dl POST:url param:nil success:^(NSData *data) {
//        NSDictionary * dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
//        NSArray * array=dic[@"data"];
////        self.dataArray=[IWatchTeamPricesModel arrayOfModelsFromDictionaries:array];
//        [self.dataArray removeAllObjects];
//        self.dataArray = [IWatchTeamPricesModel arrayOfModelsFromDictionaries:array];
//      //NSLog(@"%@",self.dataArray);
//        [self.tableView reloadData];
//    } failure:^(NSError *error) {
//        
//    }];
//
//
//
//}

//#pragma mark -tableView代理方法-
//-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    return 1;
//}
//-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.dataArray.count;
//}
//-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    //    1.cell标识符
//    static NSString *identifier = @"IWatchTeamZDHTableViewCell";
//    //    2.从cell队列中取出cell
//    IWatchTeamZDHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
//    //    3.创建cell
////    if (!cell) {
////        IWatchTeamZDHTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
////    }
//    cell.model=self.dataArray[indexPath.row];
//    //NSLog(@"%@",cell.model);
//    return cell;
//}
//#pragma mark -collection代理方法-
//-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
//    
//    return 1;
//    
//}
//-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    
//    return [_dataArray count];
//    
//}
//-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
//    
//    static NSString *identifier = @"IWatchTeamPricesZDHCollectionViewCell";
//    IWatchTeamPricesZDHCollectionViewCell *cell1 = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
//    //cell.model=self.dataArray[indexPath.item];
//    //NSLog(@"222%lu",(unsigned long)_dataArray.count);
//    cell1.model=self.dataArray[indexPath.item];
//    NSLog(@"%@",cell1.model.cname);
//    return cell1;
//    
}
@end
