//
//  reportModel.h
//  IWatchTeam
//
//  Created by 丶苹果 on 16/5/6.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface reportModel : JSONModel

@property (nonatomic,copy) NSString * title;

@property (nonatomic,copy) NSString * thumb;
@property (nonatomic,copy) NSString * url;

@end
