//
//  RootViewController.m
//  KH2017
//
//  Created by 三海教育 on 2017/6/10.
//  Copyright © 2017年 三海教育. All rights reserved.
//

#import "RootViewController.h"
#import "HomeViewController.h"
#import "MineViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupRootVC];
    // Do any additional setup after loading the view.
}

- (void) setupRootVC{
    
    // 视图
    HomeViewController *homeVC = [[HomeViewController alloc]init];
    UINavigationController *homeNav = [[UINavigationController alloc]initWithRootViewController:homeVC];
    
    MineViewController *mineVC = [[MineViewController alloc]init];
    UINavigationController *mineNav = [[UINavigationController alloc]initWithRootViewController:mineVC];
    
    // 标题
    homeVC.title = @"首页";
    mineVC.title = @"我的";
    
    self.viewControllers = @[homeNav, mineNav];
    
    // 设置底部tabBar
    UITabBar *tabBar = self.tabBar;
    UITabBarItem *homeItem = [tabBar.items objectAtIndex:0];
    homeItem.image = [UIImage imageNamed:@"home_sel"];
    
    UITabBarItem *mineItem = [tabBar.items objectAtIndex:1];
    mineItem.image = [UIImage imageNamed:@"mine_sel"];
}

- (void)didReceiveMemoryWarning {
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
