//
//  UserModel.h
//  github
//
//  Created by liyang on 2017/4/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject


//头像URL
@property (copy,nonatomic) NSString *avatar_url;


//用户名
@property (copy,nonatomic) NSString *login;


//擅长语言
@property (copy,nonatomic) NSString *language;




+(void)getUserList:(id _Nullable )json;


+(void)statisticalLanguage:(id _Nullable )json;

@end
