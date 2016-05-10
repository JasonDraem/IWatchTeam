//
//  IWacthAlertFactory.h
//  IWatchTeam
//
//  Created by Jason on 16/5/2.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
//
typedef void(^ActionBlock)();

@interface IWacthAlertFactory : NSObject
//
//自动消失 时间不自定
+ (void)autmicDismisAlertWithTitle:(NSString *)title withMessage:(NSString *)message onView:(id)view;
//自动消失 时间自定
+ (void)autmicDismisAlertWithTitle:(NSString *)title withMessage:(NSString *)message withTime:(CGFloat)time onView:(id)view;
//点击确定 消失 无事件产生
+ (void)noautmicDismisAlertWithTitle:(NSString *)title withMessage:(NSString *)message onView:(id)view;
//点击确定 发生事件  点击取消 返回
+ (void)actionAlertWithTitle:(NSString *)title withMessage:(NSString *)message eventAction:(ActionBlock)event onView:(id)view;
//AlertSheet
+ (void)actionAlertSheetWithTitle:(NSString *)titleOne withMessage:(NSString *)message eventNameOne:(NSString *)oneTitle eventNameTwo:(NSString *)twoTitle takePhotoAction:(ActionBlock)cameraImge chosoPhoto:(ActionBlock)chose onView:(id)view;

@end
