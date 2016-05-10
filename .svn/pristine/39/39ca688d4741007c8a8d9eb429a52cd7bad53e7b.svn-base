//
//  IWatchTeamBaseOperationViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/7.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamBaseOperationViewController.h"


@interface IWatchTeamBaseOperationViewController ()

@end

@implementation IWatchTeamBaseOperationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.navigationController.navigationBarHidden = YES;
    [self navigationView];
}
//
//隐藏系统导航栏  自定义导航栏
- (UIView *)navigationView{
    self.view.backgroundColor = [UIColor lightTextColor];
    _navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 64)];
    _navigationView.backgroundColor = [UIColor colorWithRed:34/255.0 green:67/255.0 blue:96/255.0 alpha:.8];
    
    [self.view addSubview:_navigationView];
    //返回按钮
    _backButton = [UIButton buttonWithType:UIButtonTypeSystem];
    //_backButton.backgroundColor = [UIColor redColor];
    _backButton.layer.cornerRadius = 5;
    _backButton.clipsToBounds = YES;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"back_white@2x" ofType:@"png"];
    UIImage *back = [[UIImage imageWithContentsOfFile:path] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [_backButton setBackgroundImage:back forState:UIControlStateNormal];
    [_backButton addTarget:self action:@selector(backEvent) forControlEvents:UIControlEventTouchUpInside];
    [_navigationView addSubview:_backButton];
    
    //
    _itemTitleLable = [[UILabel alloc] init];
    //_itemTitleLable.backgroundColor = BACKGROUND_COLOR;
    _itemTitleLable.font = [UIFont systemFontOfSize:15];
    _itemTitleLable.textAlignment = NSTextAlignmentCenter;
    [_navigationView addSubview:_itemTitleLable];
    //__weak typeof(self) WeakSelf = self;
    //适配button
    [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_offset(UIEdgeInsetsMake(20, 10, 10, VIEW_WIDTH-53));
        make.size.mas_equalTo(CGSizeMake(back.size.width, back.size.height));
    }];
    //
    [_itemTitleLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_navigationView).offset(25);
        make.size.mas_equalTo(CGSizeMake(UISCREEN_WIDTH/2, 30));
        make.trailing.equalTo(_navigationView).with.offset(-(UISCREEN_WIDTH - UISCREEN_WIDTH/2)/2);
    }];
    
    return _navigationView;
}

- (void)backEvent{
    //
    [self.navigationController popViewControllerAnimated:YES];
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
