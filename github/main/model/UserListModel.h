//
//  UserListModel.h
//  github
//
//  Created by liyang on 2017/4/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserListModel : NSObject

//使用单例传值
@property (strong,nonatomic) NSMutableArray *userList;


//用一个int来记录查询了多少个用户的擅长语言
@property (assign,nonatomic) int searchNumber;


+(UserListModel *)sharedUserListModel;
@end
