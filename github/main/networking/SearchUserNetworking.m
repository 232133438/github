//
//  SearchUserNetworking.m
//  github
//
//  Created by liyang on 2017/4/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "SearchUserNetworking.h"
#import "AFNetworking.h"
#import "UserModel.h"

#define SEARCH_USER_URL @"https://api.github.com/search/users?"
#define SEARCH_REPOS_URL @"https://api.github.com/users/"

@implementation SearchUserNetworking

//根据用户名查找用户列表
+(void)searchUserTableByUserName:(NSDictionary *)userName
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:SEARCH_USER_URL parameters:userName progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //判断是否查找到用户
        if (responseObject[@"items"]) {
            [UserModel getUserList:responseObject];
        }else{
            // 创建一个通知中心
            NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
            
            // 发送通知
            
            [center postNotificationName:@"serchUserFail" object:nil userInfo:nil];
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        // 创建一个通知中心
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        
        // 发送通知
        
        [center postNotificationName:@"serchUserFail" object:nil userInfo:nil];
    }];
    
}


//根据用户名查找用户使用语言偏好
+(void)searchLanguageByUserName:(NSString *)userName{
    
    NSString *reposURL = [NSString stringWithFormat:@"%@%@/repos",SEARCH_REPOS_URL,userName];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:reposURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UserModel statisticalLanguage:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
    
    
}

@end
