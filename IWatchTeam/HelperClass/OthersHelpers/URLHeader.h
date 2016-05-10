//
//  URLHeader.h
//  IWatchTeam
//
//  Created by Jason on 16/5/2.
//  Copyright © 2016年 Jason. All rights reserved.
//

#ifndef URLHeader_h
#define URLHeader_h
/**
 *  存放所有的URL
 */
//GEThttp://www.iwatch365.com/json/iphone/json.php?t=301&fid=用户名&p=密码

//主域名
#define IWATCH_DOMAINNAME (@"http://www.iwatch365.com/")
#define IWATCH_TRIPPRO    (@"json/iphone/")

//登陆
#define IWATCH_LOGIN (@"json.php?t=301&")
//注册apihttp://www.iwatch365.com/member.php?mod=register.php
#define IWATCH_REGISTER (@"member.php?mod=register.php")
//登陆成功后GET http://www.iwatch365.com/json/iphone/json.php?t=3&fid=1265983
#define IWATCH_LOGIN_SUCCESS (@"json.php?t=3&fid=")
//我的私信
//http://www.iwatch365.com/json/iphone/json.php?t=201&fid=1265983&p=1
#define IWATCH_MYMESSAGE (@"json.php?t=201&fid=")
//提醒
// http://www.iwatch365.com/json/iphone/json.php?t=32&fid=1265983&p=1
#define IWATCH_TX (@"json.php?t=32&fid=")
//我的帖子 我发表的
//http://www.iwatch365.com/json/iphone/json.php?t=5&fid=1265983&p=1
#define IWATCH_SENDMESSAGE (@"json.php?t=5&fid=")
//我的帖子 我回复的
//http://www.iwatch365.com/json/iphone/json.php?t=6&fid=1265983&p=1
#define IWATCH_RESPONDER (@"json.php?t=6&fid=")
//我的收藏
//收藏的帖子
//http://www.iwatch365.com/json/iphone/json.php?t=4&fid=1265983&p=1
#define IWATCH_COLLECTION_TZ (@"json.php?t=4&fid=")
//收藏的腕表
//http://www.iwatch365.com/json/iphone/json_watch.php?t=62&uid=1265983&p=1
#define IWATCH_COLLECTION_WATCH (@"json_watch.php?t=62&uid=")




//第一个界面新闻
#define IWATCH_FIRST_NEWS @"http://www.iwatch365.com/json/iphone/json_watch.php?t=26&uid=21&p=%d"
#define IWATCH_FIRST_REPORT @"http://www.iwatch365.com/json/iphone/json_watch.php?t=26&uid=22&p=%d"
#define IWATCH_FIRST_WATCHWORK @"http://www.iwatch365.com/json/iphone/json.php?t=22&fid=0&p=%d"
#define IWATCH_FIRST_TABLEVIEW @"http://www.iwatch365.com/json/iphone/json.php?t=22&fid=0&p=%d"

#define IWATCH_GUANGGAOWEI @"http://www.iwatch365.com/json/iphone/json_watch.php?t=50"
//
#define daillove_one @"http://www.iwatch365.com/json/iphone/json_watch.php?t=23&p=%d"

#define IWATCH_NEW_REPORT @"http://www.iwatch365.com/json/iphone/json_watch.php?t=59&p=1"



















#endif /* URLHeader_h */
