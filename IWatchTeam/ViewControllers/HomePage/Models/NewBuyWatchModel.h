//
//  NewBuyWatchModel.h
//  IWatchTeam
//
//  Created by 丶苹果 on 16/5/7.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface NewBuyWatchModel : JSONModel

@property (nonatomic,copy)NSString * author;

@property (nonatomic,copy)NSString * subject;

@property (nonatomic,copy)NSString * views;

@property (nonatomic,copy)NSString * authorImage;

@property (nonatomic,copy)NSString * attachImage;

@property (nonatomic,copy)NSString * tid;

@end
