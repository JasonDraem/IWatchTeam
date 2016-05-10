//
//  IWatchDailycollection.m
//  IWatchTeam
//
//  Created by DSB on 16/5/4.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchDailycollection.h"
#import "CollectionViewCell.h"
#import "IWatchTeamGetDataFactory.h"

#import "URLHeader.h"
#import "IWatchDailyModel.h"
#import "MJRefresh.h"
#import "IWatchDailyLoveWEBview.h"

@interface IWatchDailycollection ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    int _page;
}
@property (nonatomic,strong)UICollectionView *collectionView;
@property (nonatomic,strong)NSMutableArray *dataArray;

@end

@implementation IWatchDailycollection

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    _page =1;
    self.navigationController.navigationBarHidden = YES;
        
    
    [self createCollectionView];
    [self addRefresh];
    [self createdata:_page];
    //[self getNewData];
    [self addSwipeGesture];
}
-(NSMutableArray*)dataArray{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    return _dataArray;
}
-(void)addRefresh{

    self.collectionView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMoreData)];
}

-(void)getMoreData{
    _page++;
    [self createdata:_page];
}
-(void)createdata:(int)page{
    
    IWatchTeamGetDataFactory *del =[IWatchTeamGetDataFactory AFShareManager];
    NSString *url =[NSString stringWithFormat:daillove_one,_page];
    NSLog(@"%@",url);
    [del GET:url param:nil success:^(NSData *data) {
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        NSArray *array=[NSArray arrayWithArray:dic[@"data"]];
        NSArray *newdata=[[NSArray alloc]init];
        newdata= [IWatchDailyModel arrayOfModelsFromDictionaries:array error:nil];
        //NSLog(@"%@",newdata);
        [self.dataArray addObjectsFromArray:newdata];
        //NSLog(@"%@",self.dataArray);
        
        [self.collectionView reloadData];
        
        //[self.collectionView.mj_header endRefreshing];
        [self.collectionView.mj_footer endRefreshing];
       
    } failure:^(NSError *error) {
        
    }];
}
//创建collectionview
-(void)createCollectionView{
   // NSLog(@"**************************");
    UICollectionViewFlowLayout * layout=[[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection=UICollectionViewScrollDirectionVertical;
    layout.minimumLineSpacing =0;
    layout.minimumInteritemSpacing=5;
    layout.itemSize = CGSizeMake(self.view.frame.size.width/2-5, 200);
//    _collectionView=[[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView=[[UICollectionView alloc]initWithFrame:CGRectMake(0,44 , UISCREEN_WIDTH, UISCREEN_HEIGHT-44) collectionViewLayout:layout];
    _collectionView.delegate=self;
    _collectionView.dataSource=self;
    [self.view addSubview:_collectionView];
    //NSLog(@"111111111111111");
    [self addtitle];
    UINib *nib =[UINib nibWithNibName:@"CollectionViewCell" bundle:nil];
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"CollectionViewCell"];
    
}
//标题 方法
-(void)addtitle{
    UILabel * titlelable=[[UILabel alloc]initWithFrame:CGRectMake(UISCREEN_WIDTH/2-40, 10, 80, 34)];
    titlelable.text=@"每日爱表";
    [self.view addSubview:titlelable];
    UIButton * but=[[UIButton alloc]initWithFrame:CGRectMake(0, 10, 34, 34)];
    [but setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(dosth:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
}
-(void)dosth:(UIButton *)but{
    [self.navigationController popToRootViewControllerAnimated:YES];
}




-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _dataArray.count;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identif=@"CollectionViewCell";
    CollectionViewCell *cell =[collectionView dequeueReusableCellWithReuseIdentifier:identif forIndexPath:indexPath];
    cell.model=_dataArray[indexPath.item];
    //NSLog(@"2222222222");
    return cell;
}
-(void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    IWatchDailyLoveWEBview * vc=[[IWatchDailyLoveWEBview alloc]init];
    IWatchDailyModel *model=[[IWatchDailyModel alloc]init];
    model= self.dataArray[indexPath.item];
    vc.string=model.ID;
    
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)addSwipeGesture{
    UISwipeGestureRecognizer *rightSwipe=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(swip:)];
    
    rightSwipe.direction=UISwipeGestureRecognizerDirectionRight;
    [self.collectionView addGestureRecognizer:rightSwipe];
    
}
-(void)swip:(UISwipeGestureRecognizer*)swip{
    [self.navigationController popToRootViewControllerAnimated:YES];
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
