//
//  IWatchTeamDailyViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/4/30.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamDailyViewController.h"
#import "IWatchHelper.pch"
#import "IWatchTeamGetDataFactory.h"
#import "URLHeader.h"
#import "IWatchDailyModel.h"
#import <UIImageView+WebCache.h>
#import "IWatchDailycollection.h"
#import "IWatchDailyLoveWEBview.h"
#import "IWatchTeamHomeViewController.h"

#import "IWacthAlertFactory.h"

@interface IWatchTeamDailyViewController ()<UIScrollViewDelegate>
{
    int _page;
    NSInteger _tage;
    UIButton *_backButton;
    UIButton *_rightButton;
    UIImageView * _imageview;
}
@property (nonatomic,strong)UIScrollView *scrollview;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation IWatchTeamDailyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _IWatchSerachVC.searchBar.hidden = YES;
    //self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor lightTextColor];
    [self getdata];
}
-(NSMutableArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray =[[NSMutableArray alloc]init];
    }
    return _dataArray;
}
//getdata
-(void)getdata{
    IWatchTeamGetDataFactory *del =[IWatchTeamGetDataFactory AFShareManager];
    _page=1;
    NSString *url =[NSString stringWithFormat:daillove_one,_page];
    [del GET:url param:nil success:^(NSData *data) {
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        self.dataArray=dic[@"data"];
        //NSLog(@"%@",_dataArray);
        
        [self creatrescrollview];
        
        
    } failure:^(NSError *error) {
        
    }];
}
//pus到web界面
//加点击手势
-(void)addTapGesture{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.scrollview addGestureRecognizer:tap];
}
-(void)tap:(UITapGestureRecognizer*)tap{
    
        IWatchDailyLoveWEBview *vc=[[IWatchDailyLoveWEBview alloc]init];
        vc.string=_dataArray[_imageview.tag][@"id"];
        NSLog(@"*****-*-*-*---*--*--*%@",_dataArray[_imageview.tag][@"id"]);
    
        self.hidesBottomBarWhenPushed = YES;
    
    
        [self.navigationController pushViewController:vc animated:YES];
    
}
//创建scrollview
-(void)creatrescrollview{
    
    _scrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_HEIGHT - 49)];
    _scrollview.pagingEnabled=YES;
    _scrollview.showsHorizontalScrollIndicator =NO;
    
    _scrollview.userInteractionEnabled = YES;
    _scrollview.contentSize=CGSizeMake(UISCREEN_WIDTH*_dataArray.count, UISCREEN_HEIGHT - 49 );
    _scrollview.delegate=self;
    [self.view addSubview:_scrollview];
    [self addScrollviews];
}
-(void)addScrollviews{
    for (NSInteger i=0; i<_dataArray.count; i++) {
        _imageview=[[UIImageView alloc]initWithFrame:CGRectMake(UISCREEN_WIDTH*i, 0, UISCREEN_WIDTH, UISCREEN_HEIGHT-200)];
        _imageview.userInteractionEnabled = YES;
        [_imageview sd_setImageWithURL:[NSURL URLWithString:self.dataArray[i][@"thumb"]]];
        _imageview.tag=i;
        [_scrollview addSubview:_imageview];
        
        //正文lable
        UILabel *zhengleble =[[UILabel alloc]initWithFrame:CGRectMake(UISCREEN_WIDTH*i+100, UISCREEN_HEIGHT-150, 250, 50)];
        zhengleble.numberOfLines=0;
        zhengleble.text=_dataArray[i][@"description"];
        [_scrollview addSubview:zhengleble];
        //原创lable
        UILabel *yuanlable=[[UILabel alloc]initWithFrame:CGRectMake(UISCREEN_WIDTH*i+100, UISCREEN_HEIGHT-175, 240, 40)];
        yuanlable.text=_dataArray[i][@"title"];
        [_scrollview addSubview:yuanlable];
        
        //bylabel
        UILabel *bylabel=[[UILabel alloc]initWithFrame:CGRectMake(100+UISCREEN_WIDTH*i, UISCREEN_HEIGHT-110, 40, 40)];
        bylabel.text=@"by";
        [_scrollview addSubview:bylabel];
        //分享
        UIButton *sharebut =[[UIButton alloc]initWithFrame:CGRectMake(150+UISCREEN_WIDTH*i, UISCREEN_HEIGHT-110, 40, 40)];
        [sharebut setTitle:@"分享" forState:UIControlStateNormal];
        [sharebut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [sharebut addTarget:self action:@selector(shareon) forControlEvents:UIControlEventTouchUpInside];
        [_scrollview addSubview:sharebut];
        
        [self addTapGesture];
        
    }
    
}
-(void)shareon{
    NSLog(@"这里是分享操作........");
    [IWacthAlertFactory actionAlertSheetWithTitle:@"分享" withMessage:nil eventNameOne:@"QQ分享" eventNameTwo:@"微博分享-" takePhotoAction:nil chosoPhoto:nil onView:self];
}
//隐藏系统导航栏  自定义导航栏
- (UIView *)navigationView{
    
    _navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 64)];
    //_navigationView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_navigationView];
    //返回按钮
    _backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    //_backButton.backgroundColor = [UIColor redColor];
    _backButton.layer.cornerRadius = 5;
    _backButton.clipsToBounds = YES;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"back@2x" ofType:@"png"];
    UIImage *back = [[UIImage imageWithContentsOfFile:path] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_backButton setBackgroundImage:back forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backEvent) forControlEvents:UIControlEventTouchUpInside];
    [_navigationView addSubview:_backButton];
    //列表按钮
    _rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    //_rightButton.backgroundColor = [UIColor redColor];
    _rightButton.layer.cornerRadius = 5;
    _rightButton.clipsToBounds = YES;
    NSString *path1 = [[NSBundle mainBundle] pathForResource:@"list@2x" ofType:@"png"];
    UIImage *list = [[UIImage imageWithContentsOfFile:path1] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_rightButton setBackgroundImage:list forState:UIControlStateNormal];
    [_rightButton addTarget:self action:@selector(listEvent) forControlEvents:UIControlEventTouchUpInside];
    [_navigationView addSubview:_rightButton];
    
    //
    //__weak typeof(self) WeakSelf = self;
    //适配button
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(20, 10, 10, VIEW_WIDTH-53));
        make.size.mas_equalTo(CGSizeMake(back.size.width, back.size.height));
    }];
    //适配 button
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(20, VIEW_WIDTH - 53, 10, 10));
        make.size.mas_equalTo(CGSizeMake(list.size.width, list.size.height));
    }];
    
    return _navigationView;
}
//
#pragma mark - backEvent -
- (void)backEvent{
    IWatchTeamHomeViewController *vc=[[IWatchTeamHomeViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - listEvent -
- (void)listEvent{
    
    IWatchDailycollection * nextvc =[[IWatchDailycollection alloc]init];
    
    [self.navigationController pushViewController:nextvc animated:YES];
}
//
- (void)viewWillAppear:(BOOL)animated{
    //self.navigationController.navigationBarHidden = YES;
    //
    }
- (void)viewDidAppear:(BOOL)animated{
    self.hidesBottomBarWhenPushed = NO;
    self.navigationController.navigationBarHidden = YES;
    [self navigationView];
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
