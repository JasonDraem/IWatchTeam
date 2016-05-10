//
//  PushViewController.m
//  IWatchTeam
//
//  Created by 丶苹果 on 16/5/7.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "PushViewController.h"
#import "IWatchHelper.pch"


@interface PushViewController ()<UIScrollViewDelegate>



@property (nonatomic,strong)UISegmentedControl *headersegment;

@property (nonatomic,strong)UIScrollView *scrollview;

@property(nonatomic,strong)UIScrollView * scrollView;

@property(nonatomic,strong)UISegmentedControl *segement;


@end

@implementation PushViewController
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    //self.view.backgroundColor=[UIColor whiteColor];
//    //self.navigationController.navigationBarHidden = YES;
//    // NSLog(@"%@",self.fid);
//    
//    
//    self.navigationController.navigationBarHidden = YES;
//    [self getSegmentedControl];
//    
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    
//}
//
////系列，全部表款，零售店，品牌介绍
//#pragma mark - SegmentedControl
//-(void)getSegmentedControl{
//    
//    UIButton * but=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 30)];
//    [but setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
//    [but addTarget:self action:@selector(dosth:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:but];
//    
//    _segement=[[UISegmentedControl alloc]initWithFrame:CGRectMake(60, 20, self.view.frame.size.width-60, 30)];
//    
//    [_segement insertSegmentWithTitle:@"新闻" atIndex:0 animated:YES];
//    [_segement insertSegmentWithTitle:@"报道" atIndex:1 animated:YES];
//    [_segement insertSegmentWithTitle:@"评测" atIndex:2 animated:YES];
//    [_segement insertSegmentWithTitle:@"导购" atIndex:3 animated:YES];
//    
//    [_segement addTarget:self action:@selector(doSth:) forControlEvents:UIControlEventValueChanged];
//    _segement.selectedSegmentIndex=0;
//    
//    [self.view addSubview:_segement];
//    
//    _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    //self.automaticallyAdjustsScrollViewInsets = NO;
//    [self.view addSubview:_scrollView];
//    
//    _scrollView.pagingEnabled = YES;
//    _scrollView.delegate = self;
//    _scrollView.showsHorizontalScrollIndicator = NO;
//    //方向锁
//    _scrollView.directionalLockEnabled = YES;
//    //取消自动布局
//    //self.automaticallyAdjustsScrollViewInsets = NO;
//    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 4, self.view.frame.size.height-50);
//    self.one =[[Homepageone alloc]init];
//    self.two =[[Homepagetwo alloc]init];
//    self.three=[[Homepagethree alloc]init];
//    self.four=[[Homepagefour alloc]init];
//    
//    
//    
//    
//    //指定该控制器为其子控制器
//    [self addChildViewController:_one];
//    
//    
//    [self addChildViewController:_two];
//    
////    [self addChildViewController:_five];
//    [self addChildViewController:_three];
//    
//    [self addChildViewController:_four];
//    
//    
//    
////    self.first.fid=self.fid;
////    self.two.fid=self.fid;
////    self.three.fid=self.fid;
////    self.four.fid=self.fid;
//    //将视图view加入到scrollview上
//    
//    [self.scrollView addSubview:_one.view];
//    [self.scrollView addSubview:_two.view];
//       [self.scrollView addSubview:_three.view];
//    [self.scrollView addSubview:_four.view];
//   
//    
//    CGRect rect2=_two.view.frame;
//    rect2.origin.x=self.view.frame.size.width;
//    rect2.size.height=CGRectGetHeight(_scrollView.frame);
//    _two.view.frame=rect2;
//    CGRect rect3=_three.view.frame;
//    rect3.origin.x=self.view.frame.size.width*2;
//    rect3.size.height=CGRectGetHeight(_scrollView.frame);
//    _three.view.frame=rect3;
//    CGRect rect4=_four.view.frame;
//    rect4.origin.x=self.view.frame.size.width*3;
//    rect4.size.height=CGRectGetHeight(_scrollView.frame);
//    _four.view.frame=rect4;
//    
//        
//        
//   
//    
//    
//    
//    
//}
//-(void)dosth:(UIButton *)but{
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}
//#pragma mark - Scrollview delegate
//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//    CGFloat offSetX = scrollView.contentOffset.x;
//    NSInteger ratio = round(offSetX / self.view.frame.size.width);
//    _segement.selectedSegmentIndex = ratio;
//}
//
//-(void)doSth:(UISegmentedControl * )seg{
//    
//    NSInteger index = seg.selectedSegmentIndex;
//    NSLog(@"aaaaaaaaaaaaaa");
//    CGRect frame = _scrollView.frame;
//    frame.origin.x = index * CGRectGetWidth(_scrollView.frame);
//    frame.origin.y = 0;
//   [_scrollView scrollRectToVisible:frame animated:YES];
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//   self.view.backgroundColor = [UIColor orangeColor];
    self.navigationController.navigationBarHidden = YES;


    
    [self creatersegmentandscrollview];
}
//创建headersegment
-(void)creatersegmentandscrollview{
        UIButton * but=[[UIButton alloc]initWithFrame:CGRectMake(0, 20, 40, 44)];
        [but setBackgroundImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [but addTarget:self action:@selector(dop) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:but];
    
    
    
    
    
    _headersegment=[[UISegmentedControl alloc]initWithFrame:CGRectMake(60, 20, UISCREEN_WIDTH-80, 44)];
    //_headersegment.backgroundColor=[UIColor redColor];
    [_headersegment insertSegmentWithTitle:@"最新" atIndex:0 animated:YES];
    [_headersegment insertSegmentWithTitle:@"新闻" atIndex:1 animated:YES];
    [_headersegment insertSegmentWithTitle:@"报道" atIndex:2 animated:YES];
    [_headersegment insertSegmentWithTitle:@"评测" atIndex:3 animated:YES];
   // [_headersegment insertSegmentWithTitle:@"导购" atIndex:4 animated:YES];
    _headersegment.selectedSegmentIndex=_index;
  
    [_headersegment addTarget:self action:@selector(segmentselect:) forControlEvents:UIControlEventValueChanged];
    _scrollview =[[UIScrollView alloc]initWithFrame:CGRectMake(0, 35, UISCREEN_WIDTH, UISCREEN_HEIGHT-44)];
    _scrollView.userInteractionEnabled = YES;
    //_scrollview.backgroundColor=[UIColor orangeColor];
    _scrollview.pagingEnabled=YES;
    _scrollview.delegate=self;
    
    _scrollview.showsHorizontalScrollIndicator=NO;
    
    _scrollview.directionalLockEnabled=YES;
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _scrollview.contentSize=CGSizeMake(UISCREEN_WIDTH*4, UISCREEN_HEIGHT-44);
    [self.view addSubview:_scrollview];
 
    //[self.navigationController.navigationBar addSubview:_headersegment];
    [self.view addSubview:_headersegment];
    [self setupviewControll];
}
-(void)segmentselect:(UISegmentedControl*)seg{
    NSInteger index =seg.selectedSegmentIndex;
    CGRect frame =_scrollview.frame;
    frame.origin.x =index*CGRectGetWidth(_scrollview.frame);
    frame.origin.y=0;
    [_scrollview scrollRectToVisible:frame animated:YES];
}

-(void)dop{
    NSLog(@"14891461616165118695161619698");
        [self.navigationController popToRootViewControllerAnimated:YES];
    }

//添加控制中的每一个子控制器
-(void)setupviewControll{
    self.one=[[Homepageone alloc]init];
    self.two=[[Homepagetwo alloc]init];
    self.three=[[Homepagethree alloc]init];
    self.four=[[Homepagefour alloc]init];
    //self.five=[[Homepagefive alloc]init];
    
    [self addChildViewController:_one];
    [self addChildViewController:_two];
    [self addChildViewController:_three];
    [self addChildViewController:_four];
    //[self addChildViewController:_five];
    
    
    [self.scrollview addSubview:_one.view];
    [self.scrollview addSubview:_two.view];
    [self.scrollview addSubview:_three.view];
    [self.scrollview addSubview:_four.view];
    //[self.scrollview addSubview:_five.view];
    
    CGRect rect2=_two.view.frame;
    rect2.origin.x=self.view.frame.size.width;
    rect2.size.height=CGRectGetHeight(_scrollview.frame);
    _two.view.frame=rect2;
    CGRect rect3=_three.view.frame;
    rect3.origin.x=self.view.frame.size.width*2;
    rect3.size.height=CGRectGetHeight(_scrollview.frame);
    _three.view.frame=rect3;
    CGRect rect4=_four.view.frame;
    rect4.origin.x=self.view.frame.size.width*3;
    rect4.size.height=CGRectGetHeight(_scrollview.frame);
    _four.view.frame=rect4;
   // CGRect rect5=_five.view.frame;
//    rect5.origin.x=self.view.frame.size.width*4;
//    rect5.size.height=CGRectGetHeight(_scrollview.frame);
//    _four.view.frame=rect5;
    
    
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat offSetX = scrollView.contentOffset.x;
    NSInteger ratio = round(offSetX / self.view.frame.size.width);
    _headersegment.selectedSegmentIndex = ratio;
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
