//
//  IWacthAlertFactory.m
//  IWatchTeam
//
//  Created by Jason on 16/5/2.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWacthAlertFactory.h"

@implementation IWacthAlertFactory
//
+ (void)autmicDismisAlertWithTitle:(NSString *)title withMessage:(NSString *)message onView:(id)view{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    //    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //
    //    }]];
    
    [view presentViewController:alert animated:YES completion:^{
        
    }];
    //自动消失
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [alert dismissViewControllerAnimated:YES completion:^{
            
        }];
    });
}
//
+ (void)autmicDismisAlertWithTitle:(NSString *)title withMessage:(NSString *)message withTime:(CGFloat)time onView:(id)view{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    //    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    //
    //    }]];
    
    [view presentViewController:alert animated:YES completion:^{
        
    }];
    //自动消失
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [alert dismissViewControllerAnimated:YES completion:^{
            
        }];
    });

}
//
+ (void)noautmicDismisAlertWithTitle:(NSString *)title withMessage:(NSString *)message onView:(id)view{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [view presentViewController:alert animated:YES completion:^{
        
    }];
}
//
+ (void)actionAlertWithTitle:(NSString *)title withMessage:(NSString *)message eventAction:(ActionBlock)event onView:(id)view{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        event();
    }]];
    
    //
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [view presentViewController:alert animated:YES completion:^{
        
    }];
}
/**
 *  Description
 */
+ (void)actionAlertSheetWithTitle:(NSString *)title withMessage:(NSString *)message eventNameOne:(NSString *)oneTitle eventNameTwo:(NSString *)twoTitle takePhotoAction:(ActionBlock)cameraImge chosoPhoto:(ActionBlock)chose onView:(id)view{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alert addAction:[UIAlertAction actionWithTitle:oneTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //
        //cameraImge();
    }]];
    
    //
    [alert addAction:[UIAlertAction actionWithTitle:twoTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //chose();
    }]];
    //
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    
    [view presentViewController:alert animated:YES completion:^{
        
    }];
    
}

@end
