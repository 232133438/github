//
//  SearchUserNetworking.h
//  github
//
//  Created by liyang on 2017/4/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchUserNetworking : NSObject

//根据用户名查找用户列表
+(void)searchUserTableByUserName:(NSDictionary *)userName;

//根据用户名查找用户使用语言偏好
+(void)searchLanguageByUserName:(NSString *)userName;

@end
