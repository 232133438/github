//
//  UserListViewCellTableViewCell.h
//  github
//
//  Created by liyang on 2017/4/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserModel.h"

@interface UserListViewCellTableViewCell : UITableViewCell

+(instancetype)cellWithTableView:(UITableView *)tableView;

@property(strong,nonatomic) UserModel *data;


@end
