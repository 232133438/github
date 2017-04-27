//
//  UserListModel.m
//  github
//
//  Created by liyang on 2017/4/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "UserListModel.h"

@implementation UserListModel
+(UserListModel *)sharedUserListModel{
    static dispatch_once_t predicate;
    static UserListModel * sharedUserListModelr;
    dispatch_once(&predicate, ^{
        sharedUserListModelr=[[UserListModel alloc] init];
    });
    return sharedUserListModelr;
}
@end
