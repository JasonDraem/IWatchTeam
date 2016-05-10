//
//  IWatchTeamTabBarController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/4/30.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamTabBarController.h"

#import "IWatchTeamBaseViewController.h"

@interface IWatchTeamTabBarController ()

@end

@implementation IWatchTeamTabBarController
//
- (instancetype)init{
    
    self = [super init];
    if (self) {
        [self createTabBar];
    }
    return self;
}
//
- (void)viewDidLoad {
    [super viewDidLoad];
}

//
- (void)createTabBar{
    self.tabBar.barTintColor = [UIColor whiteColor];
    //
        //
    // IWatchTeam Home Daily Price Forum Mine
    // 首页 每日爱表 价格 论坛 我的
    //item标题
    NSArray *itemTitles = @[
  @[@"首页", @"home"],
  @[@"每日爱表", @"loveWatch"],
  @[@"价格", @"price"],
  @[@"论坛", @"forum"],
  @[@"我的", @"mine"]];
    
 NSArray *controllerName = @[@"Home",
                           @"Daily",
                           @"Price",
                           @"Forum",
                           @"Mine"];
    
    //控制器的名字
    //用于存放控制器
    NSMutableArray *controllers = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < itemTitles.count; i ++) {
        //
        NSString *str = [NSString stringWithFormat:@"IWatchTeam%@ViewController", controllerName[i]];
        //将字符串转换类名
        Class cla = NSClassFromString(str);
        //创建视图控制器
        IWatchTeamBaseViewController *BVC = [[cla alloc] init];
        UINavigationController *NVC = [[UINavigationController alloc] initWithRootViewController:BVC];
        //
        //BVC.navigationItem.title = itemTitles[i][0];
        //
        NSString *ImageName = [NSString stringWithFormat:@"tabbar_%@", itemTitles[i][1]];
        //正常状态下的item图片
        UIImage *normalImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_normal", ImageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //选中状态下的item图片
        UIImage *selectedImage = [[UIImage imageNamed:[NSString stringWithFormat:@"%@_selected", ImageName]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        //设置item
        UITabBarItem *items = [[UITabBarItem alloc] initWithTitle:itemTitles[i][0] image:normalImage selectedImage:selectedImage];
        BVC.tabBarItem = items;
        //将视图添加到数组中
        [controllers addObject:NVC];
    }
//    //正常状态下
//    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:151/255.0 green:151/255.0 blue:151/255.0 alpha:1.0], NSFontAttributeName:[UIFont systemFontOfSize:10]} forState:UIControlStateNormal];
    //设置items选中状态下的字体颜色
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:53/255.0 green:149/255.0 blue:195/255.0 alpha:1.0]} forState:UIControlStateSelected];
    //
    self.viewControllers = controllers;
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
