//
//  IWatchTeamBaseViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/4/30.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamBaseViewController.h"


@interface IWatchTeamBaseViewController ()<UISearchBarDelegate,UISearchControllerDelegate>

@end

@implementation IWatchTeamBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置基本的属性
    [self setAttributes];
    //自定义导航栏
    [self navigationView];
}
//
- (void)setAttributes{
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor lightGrayColor];
    //self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];
    _IWatchSerachVC = [[UISearchController alloc] initWithSearchResultsController:nil];
    _IWatchSerachVC.searchBar.frame = CGRectMake(0, 0, VIEW_WIDTH-100, 30);
    _IWatchSerachVC.delegate = self;
    //_IWatchSerachVC.searchBar.backgroundColor = [UIColor grayColor];
    _IWatchSerachVC.searchBar.placeholder = @"搜索手表品牌 系列 型号";
    //是否显示蒙版
    _IWatchSerachVC.dimsBackgroundDuringPresentation = YES;
    //是否隐藏导航栏
    _IWatchSerachVC.hidesNavigationBarDuringPresentation = NO;
    _IWatchSerachVC.searchBar.layer.cornerRadius = 5;
    
    [self.navigationController.navigationBar addSubview:_IWatchSerachVC.searchBar];
    //
}
//隐藏系统导航栏  自定义导航栏
- (UIView *)navigationView{

    return _navigationView;
}
//自制导航栏添加手势   暂时未用到
- (void)hiddenViewAciton:(UITapGestureRecognizer *)tap{
   
    [UIView animateWithDuration:.2 animations:^{
        //_navigationView.transform = CGAffineTransformMakeTranslation(0, -50);
        if (_navigationView.hidden) {
            _navigationView.hidden = NO;
        }else{
            _navigationView.hidden = YES;
        }
        
    }];
}
//触摸屏幕事件  隐藏导航栏
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
    if (_navigationView.hidden) {
        _navigationView.hidden = NO;
    }else{
        _navigationView.hidden = YES;
    }

}
//
//显示tabbar
- (void)viewWillAppear:(BOOL)animated{
    //
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = NO;
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
