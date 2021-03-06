//
//  IWatchTeamSuccessViewController.m
//  IWatchTeam
//
//  Created by JasonXu on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamSuccessViewController.h"

#import "IWatchTeamSuccessTitleTableViewCell.h"

#import "IWatchTeamSuccessImageTableViewCell.h"
//
#import "IWatchTeamGetDataFactory.h"

#import "IWatchLoginSuccessModel.h"

#import "URLHeader.h"




@interface IWatchTeamSuccessViewController ()<UITableViewDataSource, UITableViewDelegate>
//
@property (nonatomic, strong) UITableView *successTB;
@property (nonatomic, strong) NSMutableArray *successDataSource;
@property (nonatomic, strong) NSMutableArray *successDetailSource;

@end

static NSString *successCellId = @"successCellId";
static NSString *imageCellId = @"headerId";

@implementation IWatchTeamSuccessViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightTextColor];
    self.navigationItem.title = @"个人中心";
    //
    self.navigationController.navigationBarHidden = NO;
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(popToView)];
    item.tintColor = [UIColor blackColor];
    
    self.navigationItem.leftBarButtonItem = item;
    //
    [self successTB];
    [self successDataSource];
    [self successDetailSource];
}
//
- (UITableView *)successTB{
    
    if (!_successTB) {
        
        _successTB = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, UISCREEN_WIDTH, UISCREEN_HEIGHT) style:UITableViewStylePlain];
        _successTB.delegate = self;
        _successTB.dataSource = self;
        
        UINib *titleNib = [UINib nibWithNibName:@"IWatchTeamSuccessTitleTableViewCell" bundle:nil];
        [_successTB registerNib:titleNib forCellReuseIdentifier:successCellId];
        
        UINib *imageNib = [UINib nibWithNibName:@"IWatchTeamSuccessImageTableViewCell" bundle:nil];
        [_successTB registerNib:imageNib forCellReuseIdentifier:imageCellId];
        
        _successTB.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self.view addSubview:_successTB];
    }
    return _successTB;
}
//
- (NSMutableArray *)successDataSource{
    
    if (!_successDataSource) {
        
        NSArray *sectionOne = @[@"头像", @"昵称"];
        //
        NSArray *sectionTwo = @[@"金币",
                                @"社会知名度",
                                @"威望",
                                @"积分",
                                @"精华帖",
                                @"帖子数目"];
        //
        _successDataSource = [[NSMutableArray alloc] init];
        //
        [_successDataSource addObject:sectionOne];
        [_successDataSource addObject:sectionTwo];
    }
    return _successDataSource;
}
//
- (NSMutableArray *)successDetailSource{
    
    if (!_successDetailSource) {
        
        _successDetailSource = [[NSMutableArray alloc] init];
        NSMutableString *urlStr = [[NSMutableString alloc] init];
        //
        [urlStr appendFormat:@"%@%@", IWATCH_DOMAINNAME, IWATCH_TRIPPRO];
        [urlStr appendFormat:@"%@", IWATCH_LOGIN_SUCCESS];
        [urlStr appendFormat:@"%@", self.uidURL];
        //NSLog(@"++++++++++++>%@", urlStr);
        
        [[IWatchTeamGetDataFactory AFShareManager] JSGetLoginData:urlStr parameters:nil resultHandle:^(IWatchLoginSuccessModel *model, NSError *error) {
            
            //NSLog(@"grouptitle----->%@", model.grouptitle);
            NSArray *nameArr = @[@"", model.username];
            NSArray *sectionArr = @[model.extcredits2, model.extcredits3, model.extcredits1, model.credits, model.posts, model.digestposts];
            //
            [_successDetailSource addObject:nameArr];
            [_successDetailSource addObject:sectionArr];
            [_successTB reloadData];
            //
            //NSLog(@"1111111%ld", _successDetailSource.count);
        }];
        //[_successTB reloadData];
        //NSLog(@"222222222%ld",self.successDetailSource.count);
    }
    return _successDetailSource;
}
//
- (void)popToView{
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark -  -
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return _successDataSource.count;
}
//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_successDataSource[section] count];
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (0 == indexPath.section  && 0 == indexPath.row) {
        
        if (0 !=_successDetailSource.count) {
            
            IWatchTeamSuccessImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:imageCellId];
            cell.title_Label.text = _successDataSource[0][0];
            NSString *path = [[NSBundle mainBundle] pathForResource:@"headerImageView" ofType:@"jpg"];
            UIImage *image = [UIImage imageWithContentsOfFile:path];
            cell.headerImageView.image = image;
            cell.userInteractionEnabled = NO;
            
            return cell;
        }
    }
    
    IWatchTeamSuccessTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:successCellId];
    
    cell.detail_Label.text = _successDataSource[indexPath.section][indexPath.row];
    
    if (0 != _successDetailSource.count) {
        
        cell.contentLabel.text = _successDetailSource[indexPath.section][indexPath.row];
    }
    cell.userInteractionEnabled = NO;
   
    return cell;
}
//
#pragma mark -  -
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (0 == section) {
        return 10;
    }
    return 5;
}
//
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor lightGrayColor];
    return view;
}
//
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (0 == indexPath.section && 0 == indexPath.row) {
        return 70;
    }
    
    
    return 44;
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
