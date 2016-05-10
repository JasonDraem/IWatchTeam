//
//  NewsAndModel.m
//  IWatchTeam
//
//  Created by DSB on 16/5/8.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "NewsAndModel.h"

@implementation NewsAndModel

+(BOOL)propertyIsOptional:(NSString *)propertyName
{
    return YES;
}
+ (JSONKeyMapper*)keyMapper{
    return [[JSONKeyMapper alloc] initWithDictionary:@{@"description":@"text"}];
}


@end
