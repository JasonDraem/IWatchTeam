//
//  IWatchTeamHomeViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/4/30.
//  Copyright © 2016年 Jason. All rights reserved.
//


#import "IWatchTeamHomeViewController.h"
#import "IWatchTeamGetDataFactory.h"
#import "URLHeader.h"
#import "IWatchTeamHomePageModel.h"
#import "HeaderView.h"
#import <UIImageView+WebCache.h>
#import "SDAdScrollView.h"
#import "reportModel.h"
#import "ReportCollectionViewCell.h"
#import "PushViewController.h"
#import "reportHeader.h"
#import "reportFooter.h"
#import "NewBuyWatchModel.h"
#import "NewBuyWatchCollectionCell.h"
#import "WebViewController.h"
#import "ReportViewController.h"
#import "NewHeader.h"
#import "NewFooter.h"
#import "SliderWebView.h"

static NSString * identifierNew = @"NewBuyWatchCollectionCell";
static NSString * reporterHeaderIdentifier = @"reportHeader";
static NSString * identifier = @"header";
static NSString * identifier_item = @"ReportCollectionViewCell";
static NSString * identifier_new_header = @"NewHeader";
static NSString * identifier_new_footer = @"NewFooter";
static NSString * reporterFooterIdentifier = @"reportFooter";
@interface IWatchTeamHomeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    
    NSMutableArray * _sliderArray;
    
    NSMutableArray * _dataSource;
    NSMutableArray * _reportDataArray;
    NSMutableArray * _urlArray;
    NSMutableArray * _lastReportArray;
    
    int _page;
    UICollectionView * _collectionView;
    
    NSMutableArray * _newWatchArray;
    
}

@end

@implementation IWatchTeamHomeViewController

-(void)viewWillAppear:(BOOL)animated
{
    //self.navigationController.navigationBarHidden = NO;
    //self.hidesBottomBarWhenPushed = NO;
    self.tabBarController.tabBar.hidden = NO;
    _IWatchSerachVC.searchBar.hidden = NO;
    
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataSource = [[NSMutableArray alloc] init];
    
    
    
    [self getData];
    
    [self getNewBuyWatchData];
    
    
    [self getReportData];
    
    [self createCollectionView];
    
    
    
    
}

- (void)getData{
    
    _sliderArray = [[NSMutableArray alloc] init];
    _urlArray = [[NSMutableArray alloc] init];
    IWatchTeamGetDataFactory * down = [IWatchTeamGetDataFactory AFShareManager];
    
    NSString * url = [NSString stringWithFormat:IWATCH_GUANGGAOWEI];
    
    [down GET:url param:nil success:^(NSData *data) {
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        NSArray * array = dict[@"data"];
        
        for (NSDictionary * dict in array) {
            
            [_sliderArray addObject:dict[@"thumb"]];
            [_urlArray addObject:dict[@"url"]];
        }
        
        [_collectionView reloadData];
        
        
    } failure:^(NSError *error) {
        
    }];
    
    
}

- (void)getNewBuyWatchData
{
    
    _page = 1;
    _newWatchArray = [[NSMutableArray alloc] init];
    
    IWatchTeamGetDataFactory * downNew = [IWatchTeamGetDataFactory AFShareManager];
    
    NSString * url = [NSString stringWithFormat:IWATCH_FIRST_TABLEVIEW,_page];
    
    [downNew GET:url param:nil success:^(NSData *data) {
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        NSArray * array = dict[@"data"];
        
        for (NSDictionary * obj in array) {
            NewBuyWatchModel * model = [[NewBuyWatchModel alloc] initWithDictionary:obj error:nil];
            
            [_newWatchArray addObject:model];
            
        }
        
        
//        _newWatchArray = [NewBuyWatchModel arrayOfModelsFromDictionaries:array error:nil];
        
        
        
        
        
        [_dataSource addObject:_newWatchArray];
        
//        NSLog(@"%@",_newWatchArray);
        
        [_collectionView reloadData];
        
    } failure:^(NSError *error) {
        
    }];
    
    
    
    
}

- (void)getReportData
{
    _reportDataArray = [[NSMutableArray alloc] init];
    
    _lastReportArray = [[NSMutableArray alloc] init];
    
    IWatchTeamGetDataFactory * downLoad = [IWatchTeamGetDataFactory AFShareManager];
    
    NSString * url = [NSString stringWithFormat:IWATCH_NEW_REPORT];
    
    [downLoad GET:url param:nil success:^(NSData *data) {
        NSDictionary * dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        NSArray * array = dict[@"data"];
        
        _reportDataArray = [reportModel arrayOfModelsFromDictionaries:array error:nil];
        
        for (int i = 0; i<6; i++) {
            [_lastReportArray addObject:_reportDataArray[i]];
        }
        
        
        [_collectionView reloadData];
        
        [_dataSource addObject:_lastReportArray];
        
       
        
    } failure:^(NSError *error) {
        
    }];
    
}



- (void)createCollectionView{
    //初始化布局对象
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //    设置滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    //    设置行间距
//    layout.minimumLineSpacing = 5;
//    //    设置列间距
//    layout.minimumInteritemSpacing = 5;
    //    设置item的大小
//    layout.itemSize = CGSizeMake(120, 120);
    
    
    
    
    
    //    初始化__collectionView并设置布局对象
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = [UIColor whiteColor];
    //    设置代理
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    
    [self.view addSubview:_collectionView];
    
    //    注册cell
//    [_collectionView registerClass:[ReportCollectionViewCell class] forCellWithReuseIdentifier:identifier_item];
    
    
    //注册newBuyWatchCollectionCell
    [_collectionView registerNib:[UINib nibWithNibName:@"NewBuyWatchCollectionCell" bundle:nil] forCellWithReuseIdentifier:identifierNew];
    
    
    [_collectionView registerNib:[UINib nibWithNibName:@"ReportCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:identifier_item];
    //    注册分组头视图
    [_collectionView registerNib:[UINib nibWithNibName:@"HeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier];
    
    
    
    //注册report分组头视图
    [_collectionView registerNib:[UINib nibWithNibName:@"reportHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reporterHeaderIdentifier];
    //注册report分组脚视图
    
    [_collectionView registerNib:[UINib nibWithNibName:@"reportFooter" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:reporterFooterIdentifier];
    
    //注册新的分组头脚视图
    [_collectionView registerNib:[UINib nibWithNibName:@"NewHeader" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:identifier_new_header];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"NewFooter" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:identifier_new_footer];
    
}

#pragma mark - dataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return _dataSource.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
//    return [_dataSource[section] count];
//    return _reportDataArray.count;
    
    if (section == 0) {
        return _lastReportArray.count;
    }else{
        return _newWatchArray.count;
    }
    
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        ReportCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier_item forIndexPath:indexPath];
        
        //cell.model = _dataSource[indexPath.section][indexPath.item];
        reportModel *model = _lastReportArray[indexPath.item];
        
        [cell updateWithModel:model];
        return cell;
    }else if (indexPath.section == 1){
        NewBuyWatchCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifierNew forIndexPath:indexPath];
        
        cell.model = _newWatchArray[indexPath.item];
        
        
        
        return cell;
    }
    
    
    
    return nil;
    
    
    
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
    
            HeaderView * header = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier forIndexPath:indexPath];
            
            if (0 != _sliderArray.count) {
                SDAdScrollView * adView = [[SDAdScrollView alloc] initWithFrame:CGRectMake(0, 0, header.mainHeadView.frame.size.width, header.mainHeadView.frame.size.height)];
                
                adView.backgroundColor = [UIColor blackColor];
                
                NSMutableArray * array= [[NSMutableArray alloc] init];
                
                NSMutableArray * array1 = [[NSMutableArray alloc] init];
                
                for (int i = 0; i<4; i++) {
                    [array addObject:_sliderArray[i]];
                    [array1 addObject:_urlArray[i]];
                }
                
                adView.adList = array;
                
                adView.tapActionBlock = ^(SDAdScrollView * adScrollView){
                    _IWatchSerachVC.searchBar.hidden = YES;
                    self.hidesBottomBarWhenPushed = YES;
                    
                    SliderWebView * sliderVc = [[SliderWebView alloc] init];
                    
                    sliderVc.URL = array1[adScrollView.currentPage];
                    
                    [self.navigationController pushViewController:sliderVc animated:YES];
                    
                };
                
                [header.mainHeadView addSubview:adView];
                
                [header.newsBtn addTarget:self action:@selector(pushNext:) forControlEvents:UIControlEventTouchUpInside];
                header.newsBtn.tag=0;
                
                
                [header.reportBtn addTarget:self action:@selector(pushNext:) forControlEvents:UIControlEventTouchUpInside];
                header.reportBtn.tag=1;
                
                [header.testBtn addTarget:self action:@selector(pushNext:) forControlEvents:UIControlEventTouchUpInside];
                header.testBtn.tag=2;
                
                [header.buyBtn addTarget:self action:@selector(pushNext:) forControlEvents:UIControlEventTouchUpInside];
                header.buyBtn.tag=3;
                
                [header.messageBtn addTarget:self action:@selector(pushNext:) forControlEvents:UIControlEventTouchUpInside];
                header.messageBtn.tag=4;
                
                
                
                
                
                
                
                
                
 
            }
            return header;
        }else{
            reportFooter * footer = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:reporterFooterIdentifier forIndexPath:indexPath];
                
            return footer;
            }
    }else{
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            NewHeader * header = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier_new_header forIndexPath:indexPath];
            return header;
        }else{
            NewFooter * footer = [_collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:identifier_new_footer forIndexPath:indexPath];
            
            return footer;
            
        }
    }
    
}

-(void)pushNext:(UIButton*)but
{
    PushViewController * pushVc = [[PushViewController alloc] init];
    //_IWatchSerachVC.searchBar.hidden = YES;
    self.hidesBottomBarWhenPushed = YES;
    pushVc.index=but.tag;
    
    
    [self.navigationController pushViewController:pushVc animated:YES];
    
    
}


#pragma mark - delegate
//如果使用代理方法来设置网格的大小、行间距、列间距的话，会覆盖属性的设置
//设置网格的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    //  CGSize根据需求来写，但大小不能超过collectionView的size
    //    item 默认的大小是50x50
    
    
    if (indexPath.section == 0) {
        return CGSizeMake(140, 140);
    }else{
        return CGSizeMake(350, 90);
    }
    
    
    
}

//设置距离四边的距离
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return  UIEdgeInsetsMake(10, 10, 10, 10);
}
//设置最小的列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}
//设置最小行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 15;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return CGSizeMake(self.view.frame.size.width, 220*(UISCREEN_HEIGHT/600.0));
    }else{
        return CGSizeMake(self.view.frame.size.width, 40*(UISCREEN_HEIGHT/600.0));
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(self.view.frame.size.width, 40*(UISCREEN_HEIGHT/667.0));
}




//选中某一个item时调用的方法
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    _IWatchSerachVC.searchBar.hidden = YES;
    //self.hidesBottomBarWhenPushed = YES;
    self.tabBarController.tabBar.hidden = YES;
    
    if (indexPath.section == 0) {
        
        reportModel * model = _lastReportArray[indexPath.row];
        
        ReportViewController * reportVc = [[ReportViewController alloc] init];
        
        reportVc.URL = model.url;
        
        [self.navigationController pushViewController:reportVc animated:YES];
        
        
        
    }else{
        
        NewBuyWatchModel * model = _newWatchArray[indexPath.item];
        
        WebViewController * webVc = [[WebViewController alloc] init];
        
        webVc.URLID = model.tid;
        
        [self.navigationController pushViewController:webVc animated:YES];
        
        
    }
    
}

@end


















