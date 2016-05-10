//
//  PushViewController.h
//  IWatchTeam
//
//  Created by 丶苹果 on 16/5/7.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Homepageone.h"
#import "Homepagetwo.h"
#import "Homepagethree.h"
#import "Homepagefour.h"


@interface PushViewController : UIViewController

@property(nonatomic,assign)NSInteger index;



@property (nonatomic,strong)Homepageone *one;

@property (nonatomic,strong)Homepagetwo *two;

@property (nonatomic,strong)Homepagethree *three;

@property (nonatomic,strong)Homepagefour *four;


@end
