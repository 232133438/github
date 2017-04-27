//
//  UserListViewCellTableViewCell.m
//  github
//
//  Created by liyang on 2017/4/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "UserListViewCellTableViewCell.h"
#import "UIImageView+WebCache.h"
@interface UserListViewCellTableViewCell ()

//用户头像
@property (weak, nonatomic) IBOutlet UIImageView *userImage;

//用户名
@property (weak, nonatomic) IBOutlet UILabel *userNameLB;

//用户擅长语言
@property (weak, nonatomic) IBOutlet UILabel *userLanguageLB;

@end

@implementation UserListViewCellTableViewCell


+(instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *indentifer = @"UserListViewCell";
    UserListViewCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer];
    if (!cell) {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"UserListViewCellTableViewCell" owner:nil options:nil]firstObject];
    }

    return cell;
}
-(void)setData:(UserModel *)data{
    [self.userImage sd_setImageWithURL:[NSURL URLWithString: data.avatar_url ]];
    self.userNameLB.text = data.login;
    //判断用户是否有擅长语言
    if (data.language) {
        self.userLanguageLB.text = data.language;
    }else{
    
        self.userLanguageLB.text = @"未找到擅长语言";
    }
 

}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
