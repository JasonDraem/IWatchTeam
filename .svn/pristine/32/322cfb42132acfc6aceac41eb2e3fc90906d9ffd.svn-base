//
//  IWatchTeamGetDataFactory.h
//  IWatchTeam
//
//  Created by Jason on 16/5/3.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <Foundation/Foundation.h>
//
typedef void(^GetData)(id, NSError *error);
//
typedef void(^GetMyMessageBlock)(id, id, NSError *);
//
//typedef void(^GetLoginData)(id, NSError *error);
//请求过程事件
typedef void(^ActionBlock)();
//
//WW请求数据
typedef void (^Success)(NSData * data);
typedef void (^Failure)(NSError * error);


@interface IWatchTeamGetDataFactory : NSObject
//
+ (instancetype)AFShareManager;


//WW
- (void)GET:(NSString *)url param:(NSDictionary *)para success:(Success)success failure:(Failure)failure;
//
- (void)POST:(NSString *)url param:(NSDictionary *)para success:(Success)success failure:(Failure)failure;
/**
 *  网络请求接口 仅适用于登陆
 *
 *  @param url           登陆url
 *  @param para          参数
 *  @param progressEvect 登陆进度
 *  @param backResult    返回请求结果
 */
- (void)AFGetData:(NSString *)url parameters:(id)para progress:(ActionBlock)progressEvect resultHandle:(GetData)backResult;
/**
 *  网络请求接口 登陆成功后
 *
 *  @param url        登陆成功后接口
 *  @param para       参数
 *  @param backResult 返回登陆成功后需要的数据
 */
- (void)JSGetLoginData:(NSString *)url parameters:(id)para resultHandle:(GetData)backResult;
/**
 *  我的私信
 *
 *  @param url    url
 *  @param handle 返回结果
 */
- (void)JSGetMyMessageData:(NSString *)url backResult:(GetMyMessageBlock)handle;
/**
 *  提醒
 *
 *  @param url        url
 *  @param backResult 返回数据
 */
- (void)JSGetTXData:(NSString *)url backResult:(GetData)backResult;
//
- (void)JSGetSendData:(NSString *)url backResult:(GetData)backResult;
//


@end
