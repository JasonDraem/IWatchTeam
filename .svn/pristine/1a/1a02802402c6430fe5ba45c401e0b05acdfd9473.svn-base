//
//  IWatchTeamGetDataFactory.m
//  IWatchTeam
//
//  Created by Jason on 16/5/3.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamGetDataFactory.h"

#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "URLHeader.h"
//
//
#import "LoginUserModel.h"
#import "IWatchLoginSuccessModel.h"
#import "IWatchTeamMessageModel.h"
#import "IWatchTeamTXModel.h"
#import "IWatchTeamSendMessageModel.h"

@implementation IWatchTeamGetDataFactory
//
{
    AFHTTPSessionManager *_AFSessionManger;
}
+ (instancetype)AFShareManager{
    //
    static IWatchTeamGetDataFactory *downloader = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        downloader = [[IWatchTeamGetDataFactory alloc] init];
    });
    return downloader;
}
//
- (instancetype)init{
    if (self = [super init]) {
        _AFSessionManger = [AFHTTPSessionManager manager];
        _AFSessionManger.responseSerializer = [AFHTTPResponseSerializer serializer];
    }
    return self;
}
//
//WW
- (void)GET:(NSString *)url param:(NSDictionary *)para success:(Success)success failure:(Failure)failure
{
    [_AFSessionManger GET:url parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}
//
- (void)POST:(NSString *)url param:(NSDictionary *)para success:(Success)success failure:(Failure)failure
{
    [_AFSessionManger GET:url parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
}

/**
 *  登陆接口
 *
 *  @param url           登陆url
 *  @param para          无需拼接参数
 *  @param progressEvect 登陆过程事件
 *  @param BackResult    返回请求数据
 */
- (void)AFGetData:(NSString *)url parameters:(id)para progress:(ActionBlock)progressEvect resultHandle:(GetData)BackResult{
    
    NSError *error = nil;
    //
    [_AFSessionManger GET:url parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //
        //NSString *str = dic[@"success"];
        //NSString *failed = dic[@"reason"];
        //
        LoginUserModel *loginModel = [[LoginUserModel alloc] init];
        loginModel.Login_success = dic[@"success"];
        loginModel.Login_reason = dic[@"reason"];
        loginModel.Login_uid = dic[@"uid"];
        //
        BackResult(loginModel, error);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        BackResult(nil, error);
    }];
}
/**
 *  登陆成功后
 *
 *  @param url        登陆成功后url
 *  @param para       无需拼接
 *  @param backResult 返回请求数据
 */
- (void)JSGetLoginData:(NSString *)url parameters:(id)para resultHandle:(GetData)backResult{
    [_AFSessionManger GET:url parameters:para progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        NSError *error;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        if (!error) {
            IWatchLoginSuccessModel *model = [[IWatchLoginSuccessModel alloc] init];
            
            model.number = dic[@"success"];
            
            NSArray *dataArray = dic[@"data"];
            NSDictionary * detailDic = dataArray[0];
            
            model.username = detailDic[@"username"];
            model.extcredits1 = detailDic[@"extcredits1"];
            model.extcredits2 = detailDic[@"extcredits2"];
            model.extcredits3 = detailDic[@"extcredits3"];
            model.credits = detailDic[@"credits"];
            model.posts = detailDic[@"posts"];
            model.digestposts = detailDic[@"digestposts"];
            model.uid = detailDic[@"uid"];
            model.grouptitle = detailDic[@"grouptitle"];
            backResult(model, nil);
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        backResult(nil, nil);
    }];
}
//
- (void)JSGetMyMessageData:(NSString *)url backResult:(GetMyMessageBlock)handle{
    [_AFSessionManger GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSError *error;
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        //
        IWatchTeamMessageModel *messageModel = [[IWatchTeamMessageModel alloc] init];
        //
        if (!error) {
            messageModel.message_Success = dict[@"success"];
            
            NSArray *modelArr = dict[@"data"];
            
            handle(messageModel, modelArr, error);
        }else{
            handle(nil, nil, error);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
//
- (void)JSGetTXData:(NSString *)url backResult:(GetData)backResult{
    [_AFSessionManger GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        NSError *error;
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        //
        NSLog(@"99999999999999999%@", dict);
        IWatchTeamTXModel *model = [[IWatchTeamTXModel alloc] init];
        if (!error) {
            
            model.TX_Success = dict[@"success"];
            model.TX_Reason = dict[@"reason"];
            //NSArray *arr = dict[@"data"];
            
            backResult(model, error);
        }else{
            backResult(model, error);
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
//
- (void)JSGetSendData:(NSString *)url backResult:(GetData)backResult{
    //
   
    [_AFSessionManger GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //
        NSError *error;
     
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:&error];
        //
        
        if (!error) {
            //
            //model.send_Success = dict[@"success"];
            NSArray *dataArr = dict[@"data"];
            
            for (NSDictionary *zeroDic in dataArr) {
                
                IWatchTeamSendMessageModel *model = [[IWatchTeamSendMessageModel alloc] init];
                //
                model.send_Tid = zeroDic[@"tid"];
                model.send_Subject = zeroDic[@"subject"];
                model.send_Deteline = zeroDic[@"dateline"];
                model.send_Lastpost = zeroDic[@"lastpost"];
                model.send_LastPoster = zeroDic[@"lastposter"];
                model.send_View = zeroDic[@"views"];
                model.send_Replines = zeroDic[@"replies"];
                model.send_Author = zeroDic[@"author"];
                model.send_Authorid = zeroDic[@"authorid"];
                model.send_Displayorder = zeroDic[@"displayorder"];
                model.send_Attachment = zeroDic[@"attachment"];
                //
                backResult(model, error);
            }
            //
        }else{
            //
            backResult(nil, error);
        }
   
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}
//

@end
