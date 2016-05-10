//
//  AppDelegate.m
//  IWatchTeam
//
//  Created by JasonXu on 16/4/30.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "AppDelegate.h"

#import "IWatchRootViewController.h"
#import "IWatchTeamTabBarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    /**
     *  第一次成功登陆后无需再次输入密码
     */
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    if ([userDefaults objectForKey:@"username"]) {
        IWatchTeamTabBarController *tvc = [[IWatchTeamTabBarController alloc] init];
//        NSLog(@"11111111111111%@", [userDefaults objectForKey:@"username"]);
//        NSLog(@"11111111111111%@", [userDefaults objectForKey:@"password"]);
        self.window.rootViewController = tvc;
    }else{
        IWatchRootViewController *IWRvc = [[IWatchRootViewController alloc] init];
        //NSLog(@"22222222222");
        self.window.rootViewController = IWRvc;
    }
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(CGRect)createFrimeWithX:(CGFloat)x andY:(CGFloat)y andWidth:(CGFloat)width andHeight:(CGFloat)height{
    return CGRectMake(x*(UISCREEN_WIDTH/375.0), y*(UISCREEN_HEIGHT/667.0), width*(UISCREEN_WIDTH/375.0), height*(UISCREEN_HEIGHT/667));
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
