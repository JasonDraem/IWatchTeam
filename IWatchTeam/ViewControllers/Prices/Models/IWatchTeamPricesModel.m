//
//  IWatchTeamPricesModel.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/5.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchTeamPricesModel.h"

@implementation IWatchTeamPricesModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    
    
    return YES;
}
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"id":@"ID",@"description":@"descrip",@"content":@"contt"}];
    
    
}
@end
