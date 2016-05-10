//
//  ZFKForumTableViewModel.m
//  IWatchTeam
//
//  Created by qianfeng on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import "ZFKForumTableViewModel.h"

@implementation ZFKForumTableViewModel
+(BOOL)propertyIsOptional:(NSString *)propertyName{
    return YES;
}
+(JSONKeyMapper *)keyMapper{
    return [[JSONKeyMapper alloc]initWithDictionary:@{@"subject":@"titleView",@"views":@"clickNum",@"replies":@"commentNum",@"author":@"NameView",@"dateline":@"Time",@"tid":@"WebID"}];
}
@end
