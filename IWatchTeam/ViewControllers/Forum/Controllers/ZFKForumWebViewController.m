//
//  ZFKForumWebViewController.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/9.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ZFKForumWebViewController.h"
#import "ZFKForumTableViewModel.h"
#define WEB_URL @"http://www.iwatch365.com/json/iphone/bbs_view.php?fid=%ld&p=2&uid=0"

@interface ZFKForumWebViewController ()
{
    UIWebView *_webView;
}
@end

@implementation ZFKForumWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addWebView];
}

-(void)addWebView{
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_webView];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.iwatch365.com/json/iphone/bbs_view.php?fid=%ld&p=2&uid=0",[_fid integerValue]]];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    _webView.scalesPageToFit = YES;
    [_webView loadRequest:request];
}

@end
