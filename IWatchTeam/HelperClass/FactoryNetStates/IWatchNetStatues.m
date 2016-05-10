//
//  IWatchNetStatues.m
//  IWatchTeam
//
//  Created by Jason on 16/5/2.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchNetStatues.h"

#import <AFNetworking/AFNetworkReachabilityManager.h>

#import "IWacthAlertFactory.h"

@implementation IWatchNetStatues
//
+ (void)MonitorNetStatues:(id)view{
    //__weak typeof(self) weakSelf = self;
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusNotReachable:
                [IWacthAlertFactory autmicDismisAlertWithTitle:@"网络提示" withMessage:@"无服务" onView:view];
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                [IWacthAlertFactory autmicDismisAlertWithTitle:@"网络提示" withMessage:@"当前网络为2G/3G/4G" onView:view];
                break;
                
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                //
                [IWacthAlertFactory autmicDismisAlertWithTitle:@"网络提示"withMessage:@"当前网络为WIFI" onView:view];
            }
                break;
                
            case AFNetworkReachabilityStatusUnknown:
                //
                [IWacthAlertFactory autmicDismisAlertWithTitle:@"网络提示"withMessage:@"未知网络" onView:view];
                break;
            default:
                break;
        }
        
    }];
    [manager startMonitoring];

}
@end
