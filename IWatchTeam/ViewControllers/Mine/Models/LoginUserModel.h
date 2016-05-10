//
//  LoginUserModel.h
//  IWatchTeam
//
//  Created by Jason on 16/5/2.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LoginUserModel : NSObject
//
@property (nonatomic, copy) NSString * UserName;
@property (nonatomic, copy) NSString * PassWords;
//
@property (nonatomic, copy) NSString * Login_uid;
@property (nonatomic, copy) NSString * Login_success;
@property (nonatomic, copy) NSString * Login_reason;

@end
