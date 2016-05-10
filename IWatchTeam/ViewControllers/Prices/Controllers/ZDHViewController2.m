//
//  ZDHViewController2.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ZDHViewController2.h"
#import "IWatchTeamGetDataFactory.h"
#import "IWatchTeamPricesModel.h"
#import "IWatchTeamPricesZDHCollectionViewCell.h"
#import "IWatchTeamZDHXiangQingViewController.h"
@interface ZDHViewController2 ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UICollectionView * collectionView;
@property(nonatomic,strong)NSMutableArray * dataArray;
@end

@implementation ZDHViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self getdata1];
   
}
//懒加载
-(NSMutableArray *)dataArray{
    
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    return _dataArray;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initUI{
   // 初始化布局对象
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
            //    设置滚动方向
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            //    设置行间距
            layout.minimumLineSpacing = 5;
            //    设置列间距
            layout.minimumInteritemSpacing = 5;
            //    设置item的大小
            layout.itemSize = CGSizeMake(self.view.frame.size.width/2-5, 200);
    
            //    初始化_collectionView并设置布局对象
            _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) collectionViewLayout:layout];
    
            _collectionView.backgroundColor = [UIColor whiteColor];
            //    设置代理
            _collectionView.dataSource = self;
            _collectionView.delegate = self;
            //    添加到视图
            [self.view addSubview:_collectionView];
    
            [self.collectionView registerNib:[UINib nibWithNibName:@"IWatchTeamPricesZDHCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"IWatchTeamPricesZDHCollectionViewCell"];
    
        }

-(void)getdata1{
    IWatchTeamGetDataFactory  * dl=[IWatchTeamGetDataFactory AFShareManager];
    NSString * url=[NSString stringWithFormat:@"http://www.iwatch365.com/json/iphone/json_watch.php?t=34&fid=%@&p=1",self.fid];
    [dl POST:url param:nil success:^(NSData *data) {
        NSDictionary * dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSArray * array=dic[@"data"];
        //        self.dataArray=[IWatchTeamPricesModel arrayOfModelsFromDictionaries:array];
        [self.dataArray removeAllObjects];
        self.dataArray = [IWatchTeamPricesModel arrayOfModelsFromDictionaries:array];
               // NSLog(@"%@",self.dataArray);
            [self initUI];
    } failure:^(NSError *error) {

    }];



}
#pragma mark -collection代理方法-
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{

    return 1;

}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return _dataArray.count;

}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *identifier = @"IWatchTeamPricesZDHCollectionViewCell";
    IWatchTeamPricesZDHCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    //cell.model=self.dataArray[indexPath.item];
    //NSLog(@"222%lu",(unsigned long)_dataArray.count);
    cell.model=self.dataArray[indexPath.item];
    //NSLog(@"%@",cell.model.title);
    return cell;

}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    IWatchTeamPricesModel * model=self.dataArray[indexPath.item];
    IWatchTeamZDHXiangQingViewController * XQVc=[[IWatchTeamZDHXiangQingViewController alloc]init];
    XQVc.fid=model.ID;
    [self.navigationController pushViewController:XQVc animated:YES];


}

@end
