//
//  SearchViewController.m
//  github
//
//  Created by liyang on 2017/4/27.
//  Copyright © 2017年 liyang. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchUserNetworking.h"
#import "UserListViewController.h"
#import "UserListModel.h"
#import "SVProgressHUD.h"
@interface SearchViewController ()

//用户名输入框
@property (weak, nonatomic) IBOutlet UITextField *userTF;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillDisappear:(BOOL)animated
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"serchUserSuccess" object:nil];
     [[NSNotificationCenter defaultCenter]removeObserver:self name:@"serchUserFail" object:nil];
}

- (IBAction)clickBtn:(UIButton *)sender {
    
    NSMutableDictionary *dic = [NSMutableDictionary new];
    [dic setObject:self.userTF.text forKey:@"q"];
    [SearchUserNetworking searchUserTableByUserName:dic];
    
    //通知中心是个单例
    NSNotificationCenter *notiCenter = [NSNotificationCenter defaultCenter];
    // 注册一个监听事件
    [notiCenter addObserver:self selector:@selector(serchUserSuccess:) name:@"serchUserSuccess" object:nil];
    [notiCenter addObserver:self selector:@selector(serchUserFail:) name:@"serchUserFail" object:nil];
    
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
}

// 查询成功通知
- (void)serchUserSuccess:(NSNotification *)noti
{
    [SVProgressHUD dismiss];
    
    //查询用户擅长语言int置0
    UserListModel *model = [UserListModel sharedUserListModel];
    model.searchNumber = 0;
    
    UserListViewController *vc = [UserListViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
// 查询失败通知
-(void)serchUserFail:(NSNotification *)noti
{
    [SVProgressHUD dismiss];
    [SVProgressHUD showErrorWithStatus:@"查询失败"];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
