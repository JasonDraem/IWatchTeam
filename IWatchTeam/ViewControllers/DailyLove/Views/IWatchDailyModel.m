//
//  IWatchDailyModel.m
//  IWatchTeam
//
//  Created by DSB on 16/5/2.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "IWatchDailyModel.h"

@implementation IWatchDailyModel

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
+ (JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"description":@"text",@"id":@"ID"}];
}


@end
