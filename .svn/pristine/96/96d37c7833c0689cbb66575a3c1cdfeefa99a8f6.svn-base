//
//  IWatchTeamLoginViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/1.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamLoginViewController.h"
#import <Masonry/Masonry.h>
//#import <AFNetworking/AFNetworking.h>
#import <MBProgressHUD/MBProgressHUD.h>
/*******************************************/
#import "IWacthAlertFactory.h"
#import "IWatchNetStatues.h"
#import "URLHeader.h"
#import "IWatchTeamTabBarController.h"
#import "IWatchTeamResigistViewController.h"
#import "LoginUserModel.h"
//
#import "IWatchTeamGetDataFactory.h"
/***********************************************/
#import "IWatchTeamMyMessageViewController.h"
/**
 *  WeakSelf
 *
 *  @return 防止self在block中循环引用造成内存泄露
 */
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self
#define WEAK_SELF     __weak typeof(self) WeakSelf = self

@interface IWatchTeamLoginViewController ()<UITextFieldDelegate>
//
@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) UIButton *cancleButton;
@property (nonatomic, strong) UITextField *resgistTF;
@property (nonatomic, strong) UITextField *passWordTF;
@property (nonatomic, strong) UILabel *noticeLabel;
@property (nonatomic, strong) UIButton *registButton;
//
@end

@implementation IWatchTeamLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //
    self.view.backgroundColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:255/255.0 alpha:.7];
    self.navigationController.navigationBarHidden = NO;
    [self navigationView];
    //创建注册登陆输入框
    [self createResgistTF];
    //创建密码输入框
    [self createPassWordTF];
    //创建提示标签
    [self createLabel];
    //创建登陆  注册按钮
    [self createButton];
    //网络检测状态  静态方法
    //[IWatchNetStatues MonitorNetStatues:self];
}
//
- (UITextField *)createResgistTF{
    
    __weak typeof(self) WeakSelf = self;
    if (!_resgistTF) {
        
        _resgistTF = [[UITextField alloc] init];
        
        _resgistTF.backgroundColor = [UIColor lightTextColor];
        _resgistTF.borderStyle = UITextBorderStyleRoundedRect;

        _resgistTF.placeholder = @"请输入邮箱/用户名";
        //删除按钮类型
        _resgistTF.clearButtonMode = UITextFieldViewModeWhileEditing;
        _resgistTF.delegate = self;
        
        [self.view addSubview:_resgistTF];
        
        //
        [_resgistTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(WeakSelf.view.frame.size.width - 120, 30));
            //make.centerX.equalTo(WeakSelf.view);
            make.leading.offset(60);
            //距导航栏的距离和宽度相等
            //make.top.width.offset(VIEW_WIDTH - 100);
            make.top.offset(WeakSelf.view.frame.size.height/2 - 100);
        }];
    }
    return _resgistTF;
}
//
- (UITextField *)createPassWordTF{
    __weak typeof(self) weakSelf = self;
    if (!_passWordTF) {
        _passWordTF = [[UITextField alloc] init];
        _passWordTF.backgroundColor = [UIColor lightTextColor];
        _passWordTF.borderStyle = UITextBorderStyleRoundedRect;
        _passWordTF.placeholder = @"请输入密码";
        _passWordTF.secureTextEntry = YES;
        _passWordTF.clearButtonMode =UITextFieldViewModeWhileEditing;
        _resgistTF.delegate = self;
        
        [self.view addSubview:_passWordTF];
        //
        [_passWordTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(weakSelf.view.frame.size.width - 120, 30));
            //make.centerX.equalTo(_resgistTF);
            make.leading.offset(60);
            make.top.equalTo(_resgistTF.mas_bottom).with.offset(10);
        }];
        // 创建自定义的触摸手势来实现对键盘的隐藏
        UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
        tapGr.cancelsTouchesInView = NO;
        [self.view addGestureRecognizer:tapGr];
    }
    return _passWordTF;
}
//
- (UILabel *)createLabel{
    __weak typeof(self) WeakSelf = self;
    if (!_noticeLabel) {
        NSArray *title = @[@"账号:", @"密码:"];
        for (NSInteger i = 0; i < title.count; i ++) {
            _noticeLabel = [[UILabel alloc] init];
            //_noticeLabel.tag = i + 100;
            //_noticeLabel.backgroundColor = BACKGROUND_COLOR;
            _noticeLabel.text= title[i];
            _noticeLabel.textAlignment = NSTextAlignmentRight;
            _noticeLabel.textColor = [UIColor whiteColor];
            [self.view addSubview:_noticeLabel];
            //
            [_noticeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                
                //make.size.mas_offset(UIEdgeInsetsMake(100 + 50* i, 10, 300, VIEW_WIDTH - 10));
                make.size.mas_equalTo(CGSizeMake(50, 30));
                make.leading.offset(10);
                //make.centerX.equalTo(WeakSelf.view);
                //距导航栏的距离和宽度相等
                //make.top.width.offset(VIEW_WIDTH - 100);
                make.top.offset(WeakSelf.view.frame.size.height/2 - 100 + 40*i);
            }];
        }
    }
    return _noticeLabel;
}
//
- (UIButton *)createButton{
    __weak typeof(self) weakSelf = self;
    if (!_registButton) {
        NSArray *title = @[@"登陆", @"注册"];
        for (NSInteger i = 0; i < title.count; i ++) {
            _registButton = [UIButton buttonWithType:UIButtonTypeSystem];
            [_registButton setTitle:title[i] forState:UIControlStateNormal];
            [_registButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            _registButton.tag = 1000 + i;
            _registButton.layer.cornerRadius = 5;
            //_registButton.backgroundColor = BACKGROUND_COLOR;
            
            [_registButton addTarget:self action:@selector(loginEvent:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:_registButton];
            //
            [_registButton mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(50, 30));
                make.leading.offset(weakSelf.view.frame.size.width/2 - 60 + i * 70);
                //make.centerX.equalTo(_passWordTF);
                //make.leading.offset(60);
                make.top.equalTo(_passWordTF.mas_bottom).with.offset(10);
            }];
        }
    }
    return _registButton;
}
//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//
//
//隐藏系统导航栏  自定义导航栏
- (UIView *)navigationView{
    
    _navigationView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, VIEW_WIDTH, 64)];
    //_navigationView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_navigationView];
    //返回按钮
    _cancleButton = [UIButton buttonWithType:UIButtonTypeSystem];
    //_cancleButton.backgroundColor = [UIColor redColor];
    _cancleButton.layer.cornerRadius = 10;
    _cancleButton.clipsToBounds = YES;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"canclex" ofType:@"png"];
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
    return _navigationView;
}
//
#pragma mark - loginEvent -
- (void)loginEvent:(UIButton *)button{
__weak typeof(self)weakSelf = self;
switch (button.tag) {
    case 1000:
    {
        //网络状态检测
        //[IWatchNetStatues MonitorNetStatues:self];
        
        MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:weakSelf.view animated:YES];
        hud.mode = MBProgressHUDModeAnnularDeterminate;
        /**
//            //登陆
//            AFHTTPSessionManager *AFManager = [AFHTTPSessionManager manager];
//            AFManager.responseSerializer = [AFHTTPResponseSerializer serializer];
//            //
//            NSMutableString * urlStr = [[NSMutableString alloc] init];
//            [urlStr appendFormat:@"%@%@", IWATCH_DOMAINNAME, IWATCH_TRIPPRO];
//            [urlStr appendFormat:@"%@", IWATCH_LOGIN];
//            [urlStr appendFormat:@"fid=%@", self.resgistTF.text];
//            [urlStr appendFormat:@"&p=%@", self.passWordTF.text];
//            //NSLog(@"login:------->%@", urlStr);
//            
//            [AFManager GET:urlStr parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
//                
//                hud.labelText = @"登陆中";
//            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//                //登陆成功后 将用户名和密码存到本地
//                NSString *userName = self.resgistTF.text;
//                NSString *passWord = self.passWordTF.text;
//                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//                [userDefaults setObject:userName forKey:@"username"];
//                [userDefaults setObject:passWord forKey:@"password"];
//                [userDefaults synchronize];
//                //注意返回的是 uid 登陆成功success：1  失败success：0
//                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
//                
//                if (1 == [dic[@"success"] integerValue]){
//                    hud.labelText = @"登陆成功";
////                                        NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
////                    NSLog(@"result------>%@", str);
//////
//                    //延时操作
//                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                        [hud hide:YES];
//
//                        IWatchTeamTabBarController *tvc =[[IWatchTeamTabBarController alloc] init];
//                        
//                        [self presentViewController:tvc animated:YES completion:^{
//                            
//                        }];
//                    });
//                }else if (0 == [dic[@"success"] integerValue]){
//                    hud.labelText = @"登陆失败";
//                    
////                    NSString *str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
////                    NSLog(@"result------>%@", str);
//
//                    //延时操作
//                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//                        [hud hide:YES];
//                        [IWacthAlertFactory autmicDismisAlertWithTitle:@"错误提示" withMessage:[NSString stringWithFormat:@"%@", dic[@"reason"]] onView:weakSelf];
//                    });
//                }
//            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//                //网路数据请求错误时的提醒
//                [IWacthAlertFactory autmicDismisAlertWithTitle:@"数据请求数据" withMessage:[NSString stringWithFormat:@"%@", error] onView:weakSelf];
//                //NSLog(@"---------->%@", [NSString stringWithFormat:@"%@", error]);
//            }];
***/
        
        NSMutableString * urlStr = [[NSMutableString alloc] init];
        [urlStr appendFormat:@"%@%@", IWATCH_DOMAINNAME, IWATCH_TRIPPRO];
        [urlStr appendFormat:@"%@", IWATCH_LOGIN];
        [urlStr appendFormat:@"fid=%@", self.resgistTF.text];
        [urlStr appendFormat:@"&p=%@", self.passWordTF.text];
        //NSLog(@"login:------->%@", urlStr);
        [[IWatchTeamGetDataFactory AFShareManager] AFGetData:urlStr parameters:nil progress:^{
            hud.labelText = @"登陆中";
        } resultHandle:^(LoginUserModel * userModel, NSError *error) {
            //
            if (1 == [userModel.Login_success integerValue]) {
                hud.labelText = @"登陆成功";
                
                //登陆成功后 将用户名和密码存到本地
                NSString *userName = self.resgistTF.text;
                NSString *passWord = self.passWordTF.text;
                
                NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
                [userDefaults setObject:userName forKey:@"username"];
                [userDefaults setObject:passWord forKey:@"password"];
                [userDefaults setObject:userModel.Login_uid forKey:@"uid"];
                NSLog(@"-------------->%@", userModel.Login_uid);
                [userDefaults synchronize];
                //注意返回的是 uid 登陆成功success：1  失败success：0
                //延时操作
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hud hide:YES];
                    
                    IWatchTeamTabBarController *tvc = [[IWatchTeamTabBarController alloc] init];
                    //
                    [self presentViewController:tvc animated:YES completion:^{
                        
                    }];
                });
            }else if (0 == [userModel.Login_success integerValue]){
                hud.labelText = @"登陆失败";
                 //延时操作
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [hud hide:YES];
                    //登陆失败原因提示
                    if (0 == _resgistTF.text.length && 0 == _passWordTF.text.length) {
                        [IWacthAlertFactory autmicDismisAlertWithTitle:@"错误提示" withMessage:@"请填写完整的用户和密码" onView:self];
                    }
                    if ([userModel.Login_reason isEqualToString:@"UserName Error!"]) {
                        [IWacthAlertFactory autmicDismisAlertWithTitle:@"错误提示" withMessage:@"用户名错误" onView:self];
                    }else if ([userModel.Login_reason isEqualToString:@"Password Error!"]){
                         [IWacthAlertFactory autmicDismisAlertWithTitle:@"错误提示" withMessage:@"密码错误" onView:self];
                    }
                    //
                });
            }
        }];
        
    }
        break;
    
    case 1001:
    {
        //注册
        IWatchTeamResigistViewController *ITRVC = [[IWatchTeamResigistViewController alloc] init];
        [self presentViewController:ITRVC animated:YES completion:^{
            
        }];
    }
        break;
        
    default:
        break;
}
}
#pragma mark - backEvent -
- (void)backEvent{
    [self dismissViewControllerAnimated:YES completion:^{
    }];
}
#pragma mark - 放弃键盘第一响应 -
//键盘的隐藏
-(void)viewTapped:(UITapGestureRecognizer*)tapGr{
    [_resgistTF resignFirstResponder];
    [_passWordTF resignFirstResponder];
}
//写不写都行
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
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
