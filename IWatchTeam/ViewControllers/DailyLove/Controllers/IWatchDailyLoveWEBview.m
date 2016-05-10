//
//  IWatchDailyLoveWEBview.m
//  IWatchTeam
//
//  Created by DSB on 16/5/5.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchDailyLoveWEBview.h"
#import "IWatchTeamGetDataFactory.h"
#import "URLHeader.h"
#import "IWacthAlertFactory.h"

@interface IWatchDailyLoveWEBview ()<UIWebViewDelegate>

@property (weak,nonatomic)UIWebView *webView;

@property (nonatomic,strong)NSMutableArray *dataArray;

@property (nonatomic,copy)NSString *url;

@end

@implementation IWatchDailyLoveWEBview

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor lightTextColor];
    [self getdata];
    
    //self.navigationController.navigationBarHidden = NO;
    
    
}
-(NSMutableArray*)dataArray{
    if (_dataArray==nil) {
        _dataArray=[[NSMutableArray alloc]init];
    }
    return _dataArray;
}
-(void)getdata{
    IWatchTeamGetDataFactory *del =[[IWatchTeamGetDataFactory alloc]init];
    NSString *str=[NSString stringWithFormat:@"http://www.iwatch365.com/json/iphone/json_watch.php?t=50"];
    [del GET:str param:nil success:^(NSData *data) {
        NSDictionary *dic =[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        self.dataArray=dic[@"data"];
        NSLog(@"********");
        [self geturl];
        
    } failure:^(NSError *error) {
        
    }];
    
}
-(void)geturl{
   // NSLog(@"%@",_dataArray);
    for (NSDictionary * dic in _dataArray) {
        if ([dic[@"id"] isEqualToString:_string]) {
            _url=dic[@"url"];
            NSLog(@"%@",_url);
            [self createWebview];
        }
    }
}
-(void)createWebview{
   // NSLog(@"++++++++++++++++++++++");
    //NSLog(@"%@",self.url);
    UIWebView *web =[[UIWebView alloc]initWithFrame:CGRectMake(0, 44,UISCREEN_WIDTH , UISCREEN_HEIGHT-44)];
    //网页自适应webview大小
    web.scalesPageToFit=YES;
    web.delegate =self;
    
    web.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:web];
    [self addtitle];
    self.webView=web;
    
    NSURL *aurl =[NSURL URLWithString:_url];
    NSURLRequest *request=[NSURLRequest requestWithURL:aurl];
    [web loadRequest:request];
    
}
////添加标题
//-(void)addtitle{
//    UILabel * titlelable=[[UILabel alloc]initWithFrame:CGRectMake(UISCREEN_WIDTH/2-40, 0, 80, 44)];
//    titlelable.text=@"报道";
//    [self.view addSubview:titlelable];
//    
//    UIButton * but=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 44, 44)];
//    [but setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
//    
//    [but addTarget:self action:@selector(dosth:) forControlEvents:UIControlEventTouchUpInside];
//    
//    [self.view addSubview:but];
//    
//    UIButton * but2=[[UIButton alloc]initWithFrame:CGRectMake(250, 0, 44, 44)];
//    [but setBackgroundImage:[UIImage imageNamed:@"shareTo"] forState:UIControlStateNormal];
//    [but2 addTarget:self action:@selector(dosths:) forControlEvents:UIControlEventTouchUpInside];
    
    //[self.view addSubview:but2];
//}
//-(void)dosth:(UIButton *)but{
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}
//-(void)dosths:(UIButton *)but{
//    [IWacthAlertFactory actionAlertSheetWithTitle:@"分享" withMessage:nil eventNameOne:@"QQ分享" eventNameTwo:@"微博分享-" takePhotoAction:nil chosoPhoto:nil onView:self];
//}
-(void)addtitle{
    UILabel * titlelable=[[UILabel alloc]initWithFrame:CGRectMake(UISCREEN_WIDTH/2-20, 10, 40, 34)];
    titlelable.text=@"报道";
    [self.view addSubview:titlelable];
    UIButton * but=[[UIButton alloc]initWithFrame:CGRectMake(0, 10, 34, 34)];
    [but setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [but addTarget:self action:@selector(dosth:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    UIButton *buuuu=[[UIButton alloc]initWithFrame:CGRectMake(UISCREEN_WIDTH-44, 10, 34, 34)];
    [buuuu setBackgroundImage:[UIImage imageNamed:@"shareTo"] forState:UIControlStateNormal];
    [buuuu addTarget:self action:@selector(share) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:buuuu];
    
    
    
}
-(void)share{
    [IWacthAlertFactory actionAlertSheetWithTitle:@"分享" withMessage:nil eventNameOne:@"QQ分享" eventNameTwo:@"微博分享-" takePhotoAction:nil chosoPhoto:nil onView:self];
}
-(void)dosth:(UIButton *)but{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    return YES;
}



























@end
