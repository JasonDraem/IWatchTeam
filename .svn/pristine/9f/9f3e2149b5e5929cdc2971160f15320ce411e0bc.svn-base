//
//  WebViewController.m
//  IWatchTeam
//
//  Created by 丶苹果 on 16/5/7.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@property (weak,nonatomic)UIWebView * webView;

@end

@implementation WebViewController

-(void)viewWillAppear:(BOOL)animated
{
    self.navigationController.navigationBarHidden = NO;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self createWebView];
}

- (void)createWebView
{
    
    
    //UIWebView * web = [[UIWebView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UIWebView * web = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_HEIGHT)];

    //设置背景色
    web.backgroundColor = [UIColor orangeColor];
    
    //网页自适应weibView视图的大小
    web.scalesPageToFit = YES;
    
    //设置代理
    web.delegate = self;
    
    [self.view addSubview:web];
    
    self.webView = web;
    
    NSString * str = [NSString stringWithFormat:@"http://www.iwatch365.com/json/iphone/bbs_view.php?fid=%@&p=1&uid=0",_URLID];
    //封装URL，同意资源定位符，将字符串封装成可以识别的网址
    NSURL * url = [NSURL URLWithString:str];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    
    [web loadRequest:request];
    
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
