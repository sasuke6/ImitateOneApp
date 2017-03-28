//
//  AppDelegate.m
//  ImitateOneApp
//
//  Created by ZhiyongXu on 7/28/16.
//  Copyright © 2016 ZhiyongXu. All rights reserved.
//

#import "AppDelegate.h"
#import "HCYMovieTableVC.h"
#import "HCYMusicTableVC.h"
#import "HCYReadVC.h"
#import "HCYHomeVC.h"
#import "HCYAPIConstant.h"
#import <CYLTabBarController.h>
#import <CYLTabBar.h>
#import <CYLPlusButton.h>
#import <YTKNetwork.h>


@interface AppDelegate ()

@property (nonatomic, strong) CYLTabBarController *tabBarController;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // set viewcontroller
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self customizeInterface];
    [self setupViewController];
    [self.window setRootViewController:self.tabBarController];
    
    // set network config
    YTKNetworkConfig *config = [YTKNetworkConfig sharedConfig];
    config.baseUrl = ServerAddress;
    
    [self.window makeKeyAndVisible];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {

}

- (void)applicationWillEnterForeground:(UIApplication *)application {

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

/**
 *  ViewController
 */
- (void)setupViewController {
    HCYHomeVC *homeVC                  = [[HCYHomeVC alloc] init];
    UINavigationController *homeVCNav  = [[UINavigationController alloc] initWithRootViewController:homeVC];

    HCYReadVC *readVC                  = [[HCYReadVC alloc] init];
    UINavigationController *readVCNav  = [[UINavigationController alloc] initWithRootViewController:readVC];

    HCYMusicTableVC *musicVC           = [[HCYMusicTableVC alloc] init];
    UINavigationController *musicVCNav = [[UINavigationController alloc] initWithRootViewController:musicVC];

    HCYMovieTableVC *movieVC           = [[HCYMovieTableVC alloc] init];
    UINavigationController *movieVCNav = [[UINavigationController alloc] initWithRootViewController:movieVC];
    
    CYLTabBarController *tabBarController = [[CYLTabBarController alloc] init];
    [self customizeTabBarForController:tabBarController];
    
    [tabBarController setViewControllers:@[
                                           homeVCNav,
                                           readVCNav,
                                           musicVCNav,
                                           movieVCNav
                                           ]];
    self.tabBarController = tabBarController;
}


- (void)customizeTabBarForController:(CYLTabBarController *)tabBarController {
    NSDictionary *dict1 = @{
                            CYLTabBarItemTitle : @"首页",
                            CYLTabBarItemImage : @"homeSelectedV4",
                            CYLTabBarItemSelectedImage : @"homeUnselectedV4",
                            };
    
    NSDictionary *dict2 = @{
                            CYLTabBarItemTitle : @"阅读",
                            CYLTabBarItemImage : @"readSelectedV4",
                            CYLTabBarItemSelectedImage : @"readUnselectedV4",
                            };
    
    NSDictionary *dict3 = @{
                            CYLTabBarItemTitle : @"音乐",
                            CYLTabBarItemImage : @"musicSelectedV4",
                            CYLTabBarItemSelectedImage : @"musicUnselectedV4",
                            };
    
    NSDictionary *dict4 = @{
                            CYLTabBarItemTitle : @"电影",
                            CYLTabBarItemImage : @"movieSelectedV4",
                            CYLTabBarItemSelectedImage : @"movieUnselectedV4",
                            };
    
    NSArray *tabBarItemsAttributes = @[ dict1, dict2, dict3, dict4 ];
    tabBarController.tabBarItemsAttributes = tabBarItemsAttributes;
}

- (void)customizeInterface {
    // 普通状态下的文字属性
    NSMutableDictionary *normalAttrs = [NSMutableDictionary dictionary];
    normalAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    // 选中状态下的文字属性
    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    // 设置文字属性
    UITabBarItem *tabBar = [UITabBarItem appearance];
    [tabBar setTitleTextAttributes:normalAttrs forState:UIControlStateNormal];
    [tabBar setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    
    
}



@end
