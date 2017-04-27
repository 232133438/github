//
//  UserModel.m
//  github
//
//  Created by liyang on 2017/4/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "UserModel.h"
#import "SearchUserNetworking.h"
#import "MJExtension.h"
#import "UserListModel.h"
@implementation UserModel
{
    
}

+(void)getUserList:(id)json{

     UserListModel *userListModel = [UserListModel sharedUserListModel];
    //先把返回的JOSN数据转换成字典 然后转换成模型数组
    NSDictionary *dic = json;
    userListModel.userList = [UserModel mj_objectArrayWithKeyValuesArray:[dic objectForKey:@"items"]];
    
    if (userListModel.userList.count == 0) {
        // 创建一个通知中心
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        
        // 发送通知
        
        [center postNotificationName:@"serchUserFail" object:nil userInfo:nil];

        return;
    }
    
    //循环查询用户所擅长语言
    for (UserModel *user in userListModel.userList) {
        [SearchUserNetworking searchLanguageByUserName:user.login];
    }

}

+(void)statisticalLanguage:(id)json{
    //创建单力模型准备拼接用户擅长语言
    UserListModel *userListModel = [UserListModel sharedUserListModel];
    //查询次数int循环+1
    userListModel.searchNumber ++;
    //因为用的AFN异步线程所查询的用户擅长语言， 所以字符串来记录这条记录是哪个用户的。
    NSString *userName;
    NSArray *arr = json;
    NSMutableArray *languageArr = [NSMutableArray new];
    for (int i =0 ; i<arr.count; i++) {
        [languageArr addObject:arr[i][@"language"]];
        userName = arr[i][@"owner"][@"login"];
    }
    //统计数组相同元素的个数
    NSString *language;
    //需要统计的数组
    NSSet *set = [NSSet setWithArray:languageArr];
    //用于记录统计到使用最多语言的次数
    int bigNumber = 0;
    for (NSString *setstring in set) {
        if (setstring) {
            //需要去掉的元素数组
            NSMutableArray *filteredArray = [[NSMutableArray alloc]initWithObjects:setstring, nil];
            
            NSMutableArray *dataArray = languageArr;

            NSPredicate * filterPredicate = [NSPredicate predicateWithFormat:@"NOT (SELF IN %@)",filteredArray];
            //过滤数组
            NSArray * reslutFilteredArray = [dataArray filteredArrayUsingPredicate:filterPredicate];
            int number = (int)(dataArray.count-reslutFilteredArray.count);
            //如果当前语言比之前记录的使用最多语言次数多 则记录该语言
            if(bigNumber < number){
            
                bigNumber = number;
                language = setstring;
            
            }
        
            
        }
        
        
    }
    //拼装数据
    for (UserModel *user in userListModel.userList) {
        if (user.login == userName) {
            user.language = language;
        }
    }

    if (userListModel.searchNumber == userListModel.userList.count) {
        // 创建一个通知中心
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        
        // 发送通知
        
        [center postNotificationName:@"serchUserSuccess" object:nil userInfo:nil];
    }


}
 

@end
