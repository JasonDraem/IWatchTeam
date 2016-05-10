//
//  IWatchNetStatues.h
//  IWatchTeam
//
//  Created by Jason on 16/5/2.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface IWatchNetStatues : NSObject
/**
 *  检测网络状态 以及网络型号
 */
+ (void)MonitorNetStatues:(id)view;
@end
