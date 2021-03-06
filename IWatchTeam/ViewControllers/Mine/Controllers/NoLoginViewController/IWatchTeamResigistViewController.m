//
//  IWatchTeamResigistViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/2.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamResigistViewController.h"
#import <WebKit/WebKit.h>
#import <MBProgressHUD/MBProgressHUD.h>
#import <Masonry/Masonry.h>
#import <KVNProgress/KVNProgress.h>

#import "IWacthAlertFactory.h"
#import "URLHeader.h"

@interface IWatchTeamResigistViewController ()<UIWebViewDelegate>
{
    UIWebView *_resgistWeb;
    MBProgressHUD *_hud;
}
//
@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) UILabel *navigationLabel;
@property (nonatomic, strong) UIButton *cancleButton;
@property (nonatomic, strong) UIView *zheView;
@end

@implementation IWatchTeamResigistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //
    [self navigationView];
    //
    [self resigistWebView];
}
//视图已将显示 添加加载提示
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _hud = [MBProgressHUD showHUDAddedTo:_resgistWeb animated:YES];
    _hud.mode  = MBProgressHUDModeAnnularDeterminate;
    _hud.labelText = @"加载中......";
    _hud.yOffset = -VIEW_HEITHT/5;
//
//    _zheView = [[UIView alloc] init];
//    _zheView.backgroundColor = [UIColor lightGrayColor];
    //_hud.labelColor = BACKGROUND_COLOR;
    
    
    
    
}
//
- (void)resigistWebView{
    _resgistWeb = [[UIWebView alloc] initWithFrame:CGRectMake(0, 50, UISCREEN_WIDTH, UISCREEN_HEIGHT)];
    _resgistWeb.scalesPageToFit = YES;
    _resgistWeb.delegate = self;
    //
    _resgistWeb.scrollView.bounces = NO;
    _resgistWeb.scrollView.alwaysBounceHorizontal = NO;
    _resgistWeb.scrollView.alwaysBounceVertical = NO;
    [self.view addSubview:_resgistWeb];
    [_resgistWeb addSubview:_zheView];
    //
    [_zheView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(UIEdgeInsetsMake(0, 0, 0, 0));
        
    }];

    NSMutableString *webStr = [[NSMutableString alloc] init];
    [webStr appendFormat:@"%@%@", IWATCH_DOMAINNAME, IWATCH_REGISTER];
    //GCD 创建线程加载web
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    dispatch_async(queue, ^{
        // block会在子线程中执行
        //        NSLog(@"%@", [NSThread currentThread]);
        
        NSURL *webURL = [NSURL URLWithString:webStr];
        NSURLRequest *resquest = [NSURLRequest requestWithURL:webURL];
        [_resgistWeb loadRequest:resquest];
/***
//        dispatch_queue_t queue = dispatch_get_main_queue();
//        dispatch_sync(queue, ^{
//            // block一定会在主线程执行
//            NSLog(@"%@", [NSThread currentThread]);
//            NSURL *webURL = [NSURL URLWithString:webStr];
//            NSURLRequest *resquest = [NSURLRequest requestWithURL:webURL];
//            [_resgistWeb loadRequest:resquest];
//
//        });
 *///
    });
}
//
//隐藏系统导航栏  自定义导航栏
- (UIView *)navigationView{
    //
    _navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 50)];
    //_navigationView.backgroundColor = [UIColor lightGrayColor];
    
    [self.view addSubview:_navigationView];
    //返回按钮
    _cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    //_cancleButton.backgroundColor = [UIColor redColor];
    _cancleButton.layer.cornerRadius = 10;
    _cancleButton.clipsToBounds = YES;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"close_1@2x" ofType:@"png"];
    UIImage *back = [[UIImage imageWithContentsOfFile:path] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_cancleButton setBackgroundImage:back forState:UIControlStateNormal];
    [_cancleButton addTarget:self action:@selector(backEvent) forControlEvents:UIControlEventTouchUpInside];
    [_navigationView addSubview:_cancleButton];
    //
    //__weak typeof(self) WeakSelf = self;
    //适配button
    [_cancleButton mas_makeConstraints:^(MASConstraintMaker *make) {
        //make.edges.mas_offset(UIEdgeInsetsMake(20, 10, 10, VIEW_WIDTH - 40));
        make.leading.offset(20);
        make.top.equalTo(_navigationView.mas_top).with.offset(20);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    //
    [self createNavigationLabel];
    return _navigationView;
}
//
- (UILabel *)createNavigationLabel{
    //
    if (!_navigationLabel) {
        _navigationLabel = [[UILabel alloc] init];
        //_navigationLabel.backgroundColor = BACKGROUND_COLOR;
        _navigationLabel.text = @"注册";
        _navigationLabel.textAlignment = NSTextAlignmentCenter;
        [_navigationView addSubview:_navigationLabel];
        //
        [_navigationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_navigationView);
            make.top.mas_equalTo(_navigationView).with.offset(20);
            make.size.mas_equalTo(CGSizeMake(UISCREEN_WIDTH/3, 25));
        }];
    }
    return _navigationLabel;
}
#pragma mark - backEvent -
- (void)backEvent{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
//
#pragma mark -  -
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    
       return YES;
}
//
- (void)webViewDidStartLoad:(UIWebView *)webView{
    //NSLog(@"22222222222222222");
}
//JS交互
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    //NSString *str = @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '120%'";
    //改变webview中的字体大小
    NSString *str = @"document.body.style.fontSize = '23px'";
    [_resgistWeb stringByEvaluatingJavaScriptFromString:str];
    //去除网页最底部的信息
     [_resgistWeb stringByEvaluatingJavaScriptFromString:@"javascript:document.getElementById('ft','wp cl').style.display='none';"];
    //去除网页搜索框
    [_resgistWeb stringByEvaluatingJavaScriptFromString:@"javascript:document.getElementById('scbar_form').style.display='none';"];
    //去除网页头部的那一坨
    //
    [_resgistWeb stringByEvaluatingJavaScriptFromString:
     @"var x = document.getElementsByClassName(\"hd\");var i;for (i = 0; i < x.length; i++) {x[i].parentNode.removeChild(x[i]);}"];
    //去除右侧右侧的分享提示
    [_resgistWeb stringByEvaluatingJavaScriptFromString:
     @"var x = document.getElementsByClassName(\"bdshare-slide-button\");var i;for (i = 0; i < x.length; i++) {x[i].parentNode.removeChild(x[i]);}"];
    //

    //NSLog(@"33333333333333333");
    //[_zheView removeFromSuperview];
    //加载完成后隐藏加载提示框
    [_hud hide:YES afterDelay:.5];
    //[_hud removeFromSuperview];
}
//
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    //NSLog(@"44444444444444444");
    //加载失败时提示
    [IWacthAlertFactory autmicDismisAlertWithTitle:@"加载失败" withMessage:[NSString stringWithFormat:@"%@", error] onView:self];
}
//干掉广告
- (nullable NSString *)stringByEvaluatingJavaScriptFromString:(NSString *)script{
    
    return nil;
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
