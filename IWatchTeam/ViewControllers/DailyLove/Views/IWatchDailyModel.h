//
//  IWatchDailyModel.h
//  IWatchTeam
//
//  Created by DSB on 16/5/2.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface IWatchDailyModel : JSONModel

@property (nonatomic,copy)NSString *title;

@property (nonatomic,copy)NSString *thumb;

@property (nonatomic,copy)NSString *text;

@property (nonatomic,copy)NSString *updatetime;

@property (nonatomic,copy)NSString *ID;




@end
