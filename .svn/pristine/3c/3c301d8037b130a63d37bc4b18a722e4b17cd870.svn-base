//
//  IWatchTeamPriceViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/4/30.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamPriceViewController.h"
#import "IWatchTeamGetDataFactory.h"
#import "IWatchTeamPricesModel.h"
#import "IWatchTeampricesCollectionReusableView.h"
#import "IWatchTeamCollectionViewCell.h"
#import "IWatchTeamTwoViewController.h"
@interface IWatchTeamPriceViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)NSMutableArray * dataArray;



@property(nonatomic,strong)UICollectionView * collectionView;
@end

@implementation IWatchTeamPriceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
   }
//懒加载
-(NSMutableArray *)dataArray{
    
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    return _dataArray;
}
#pragma mark -获取数据-
-(void)getData{
   IWatchTeamGetDataFactory  * dl=[IWatchTeamGetDataFactory AFShareManager];
    NSString * url=@"http://www.iwatch365.com/json/iphone/json_watch.php?t=48";
    [dl GET:url param:nil success:^(NSData *data) {
        NSDictionary * dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSArray * array=dic[@"data"];
        NSMutableArray *dataArray6=[[NSMutableArray alloc]init];
        NSMutableArray *dataArray7=[[NSMutableArray alloc]init];
        NSMutableArray *dataArray8=[[NSMutableArray alloc]init];
        NSMutableArray *dataArray9=[[NSMutableArray alloc]init];
        NSMutableArray *dataArray10=[[NSMutableArray alloc]init];
        for (NSDictionary *dict in array) {
            if ([dict[@"pinpaifenleiid"] isEqualToString:@"6"]) {
                IWatchTeamPricesModel * model=[[IWatchTeamPricesModel  alloc]initWithDictionary:dict error:nil];
                
                [dataArray6 addObject:model];
            }
            if ([dict[@"pinpaifenleiid"] isEqualToString:@"7"]) {
                IWatchTeamPricesModel * model=[[IWatchTeamPricesModel  alloc]initWithDictionary:dict error:nil];
                
                [dataArray7 addObject:model];
            }
            if ([dict[@"pinpaifenleiid"] isEqualToString:@"8"]) {
                IWatchTeamPricesModel * model=[[IWatchTeamPricesModel  alloc]initWithDictionary:dict error:nil];
                //NSLog(@"%@",model);
                [dataArray8 addObject:model];
            }
            if ([dict[@"pinpaifenleiid"] isEqualToString:@"9"]) {
                IWatchTeamPricesModel * model=[[IWatchTeamPricesModel  alloc]initWithDictionary:dict error:nil];
                //NSLog(@"%@",model);
                [dataArray9 addObject:model];
            }
            if ([dict[@"pinpaifenleiid"] isEqualToString:@"10"]) {
                IWatchTeamPricesModel * model=[[IWatchTeamPricesModel  alloc]initWithDictionary:dict error:nil];
                //NSLog(@"%@",model);
                [dataArray10 addObject:model];
            }
        }
        [self.dataArray addObject:dataArray6];
        [self.dataArray addObject:dataArray7];
        [self.dataArray addObject:dataArray8];
        [self.dataArray addObject:dataArray9];
        [self.dataArray addObject:dataArray10];
        // NSLog(@"%lu",(unsigned long)self.dataArray.count);
        [self createCollectionView];
        
    } failure:^(NSError *error) {
        
    }];
 
    
}
#pragma mark -创建collectionView-
-(void)createCollectionView{
    
    //初始化布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //    设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    //    设置行间距
    layout.minimumLineSpacing = 5;
    //    设置列间距
    layout.minimumInteritemSpacing = 5;
    //    设置item的大小
    layout.itemSize = CGSizeMake(self.view.frame.size.width/2-5, 50);
    
    //    初始化_collectionView并设置布局对象
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    
    _collectionView.backgroundColor = [UIColor whiteColor];
    //    设置代理
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    //    添加到视图
    [self.view addSubview:_collectionView];
    //    注册cell
    UINib *nib = [UINib nibWithNibName:@"IWatchTeamCollectionViewCell" bundle:nil];
    //    [_collectionView registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"MyCollectionViewCell"];
    
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"IWatchTeamCollectionViewCell"];
    //    [_collectionView registerClass:[MYCollectionReusableView class] forCellWithReuseIdentifier:@"head"];
    [_collectionView registerClass:[IWatchTeampricesCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"head"];
}
#pragma mark -代理方法-
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return _dataArray.count;
    
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [_dataArray[section] count];
    
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"IWatchTeamCollectionViewCell";
    IWatchTeamCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    //cell.model=self.dataArray[indexPath.item];
    //NSLog(@"222%lu",(unsigned long)_dataArray.count);
    cell.model=self.dataArray[indexPath.section][indexPath.item];
    //NSLog(@"%@",cell.model.cname);
    return cell;
    
}
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        static NSString *identifier = @"head";
        IWatchTeampricesCollectionReusableView *headerView = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier forIndexPath:indexPath];
        if (indexPath.section==0) {
            headerView.title=@"顶级奢华";
        }
        if (indexPath.section==1) {
            headerView.title=@"经典奢华";
        }
        if (indexPath.section==2) {
            headerView.title=@"经典奢华";
        }
        if (indexPath.section==3) {
            headerView.title=@"亲民传统";
        }
        if (indexPath.section==4) {
            headerView.title=@"时尚奢华";
        }
        
        
        return headerView;
        
    }
    return nil;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    //    横向滚动时，只需要写X
    //    纵向滚动时，只需要写Y
    return CGSizeMake(0, 40);
}
//选中某一个item时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    IWatchTeamPricesModel * model=self.dataArray[indexPath.section][indexPath.item];
    IWatchTeamTwoViewController * TwoVc=[[IWatchTeamTwoViewController alloc]init];
    TwoVc.fid=model.ID;
    
    self.hidesBottomBarWhenPushed = YES;
    
    [self.navigationController pushViewController:TwoVc animated:YES];
   // NSLog(@"%@",model.ID);
    
}
//
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.hidesBottomBarWhenPushed = NO;
}
@end
