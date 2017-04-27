//
//  UserListViewController.m
//  github
//
//  Created by liyang on 2017/4/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "UserListViewController.h"
#import "UserModel.h"
#import "UserListModel.h"
#import "UserListViewController.h"
#import "UserListViewCellTableViewCell.h"
#import "MJExtension.h"

@interface UserListViewController()
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property(strong,nonatomic)UserListModel *userListModel;

@end


@implementation UserListViewController


- (void)viewDidLoad {
    self.userListModel = [UserListModel sharedUserListModel];
    [super viewDidLoad];
    
}





-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    
    return self.userListModel.userList.count;
}


- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UserListViewCellTableViewCell *cell = [UserListViewCellTableViewCell cellWithTableView:tableView];
    cell.data = [UserModel mj_objectWithKeyValues:self.userListModel.userList[indexPath.row]];
    return cell;
    
}



-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
