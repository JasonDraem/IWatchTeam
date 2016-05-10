//
//  NewsAndModel.h
//  IWatchTeam
//
//  Created by DSB on 16/5/8.
//  Copyright © 2016年 Jason. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface NewsAndModel : JSONModel

@property (nonatomic,copy)NSString *thumb;

@property (nonatomic,copy)NSString *title;

@property (nonatomic,copy)NSString *text;



@end
