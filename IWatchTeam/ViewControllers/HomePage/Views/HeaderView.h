//
//  HeaderView.h
//  IWatchTeam
//
//  Created by 丶苹果 on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface HeaderView : UICollectionReusableView
//
@property (weak, nonatomic) IBOutlet UIView *mainHeadView;



@property (weak, nonatomic) IBOutlet UIButton *newsBtn;

@property (weak, nonatomic) IBOutlet UIButton *reportBtn;

@property (weak, nonatomic) IBOutlet UIButton *testBtn;

@property (weak, nonatomic) IBOutlet UIButton *buyBtn;
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;

@end
