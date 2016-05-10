//
//  IWatchTeamZDHXiangQingViewController.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamZDHXiangQingViewController.h"
#import "IWatchTeamPricesModel.h"
#import "IWatchTeamGetDataFactory.h"
@interface IWatchTeamZDHXiangQingViewController ()<UIWebViewDelegate>
@property(nonatomic,strong)UIWebView * webView;
@property(nonatomic,strong)NSMutableArray * dataArray;
//@property(nonatomic,strong)IWatchTeamPricesModel * model;
@property(nonatomic,strong)NSDictionary *dic;
@end

@implementation IWatchTeamZDHXiangQingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self getdata];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSMutableArray *)dataArray{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    return _dataArray;
    
}
-(void)getdata{
    IWatchTeamGetDataFactory  * dl=[IWatchTeamGetDataFactory AFShareManager];
    NSString * url=[NSString stringWithFormat:@"http://www.iwatch365.com/json.php?t=40&fid=%@",self.fid];
    NSLog(@"%@",self.fid);
    [dl POST:url param:nil success:^(NSData *data) {
        _dic=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
//        _model=[[IWatchTeamPricesModel alloc]initWithDictionary:dic error:nil];
         //NSLog(@"%@",_dic[@"data"][@"0"][@"1"]);
        
        
        [self initUI];
    } failure:^(NSError *error) {
        
    }];
    
    
    
}
-(void)initUI{
    _webView=[[UIWebView alloc]initWithFrame:self.view.bounds];
    //    网页自适应weibView视图的大小
    _webView.scalesPageToFit = YES;
    //    设置代理
    _webView.delegate = self;
    [self.view addSubview:_webView];
   NSString *str=[NSString stringWithFormat:@"%@",_dic[@"data"][@"0"][@"1"]];
  
//    NSLog(@"%@",_dataArray[0]);
    //    str = [NSString stringWithFormat:@"<html><head></head><body>%@</body></html>",str];
    [_webView loadHTMLString:str baseURL:nil];
    
    //NSLog(@"%@",_dataArray[0][@"1"]);
    
    
}
#pragma mark - delegate
//即将加载
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    //    YES:可以加载网页
    //    NO:不能加载网页
    return YES;
}
-(void)webViewDidStartLoad:(UIWebView *)webView{
    
}
-(void)webViewDidFinishLoad:(UIWebView *)webView{
    
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    
}


@end
