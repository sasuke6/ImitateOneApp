//
//  AppDelegate.m
//  ImitateOneApp
//
//  Created by ZhiyongXu on 7/28/16.
//  Copyright © 2016 ZhiyongXu. All rights reserved.
//

#import "AppDelegate.h"
#import <RDVTabBarController.h>
#import <RDVTabBarItem.h>
#import "HCYMovieTableVC.h"
#import "HCYMusicTableVC.h"
#import "HCYReadVC.h"
#import "HCYHomeVC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyWindow];
    
    [self switchToMainView];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)switchToMainView {
    
    RDVTabBarController *tabbarVC = [[RDVTabBarController alloc] init];
    
//    BBTGirlsVC *girlVC = [[BBTGirlsVC alloc] init];
//    UINavigationController *girlsVCNav = [[UINavigationController alloc] initWithRootViewController:girlVC];
    
//    BBTRankingListVC *rankingVC = [[BBTRankingListVC alloc] init];
//    UINavigationController *rankingVCNav = [[UINavigationController alloc] initWithRootViewController:rankingVC];
//    
//    BBTChatListVC *chatVC = [[BBTChatListVC alloc] init];
//    UINavigationController *chatVCNav = [[UINavigationController alloc] initWithRootViewController:chatVC];
//    
//    BBTMeForBoyVC *meVC = [[BBTMeForBoyVC alloc] init];
//    UINavigationController *meVCNav = [[UINavigationController alloc] initWithRootViewController:meVC];
    
//    tabbarVC.viewControllers = @[girlsVCNav, rankingVCNav, chatVCNav, meVCNav];
    
    NSArray *titles = @[@"首页", @"阅读", @"音乐", @"电影"];
    for (int i = 0; i < tabbarVC.viewControllers.count; i++) {
        RDVTabBarItem *item = tabbarVC.tabBar.items[i];
        [item setFinishedSelectedImage:[UIImage imageNamed:@"icon_test"]
           withFinishedUnselectedImage:[UIImage imageNamed:@"icon_test_unselected"]];
        item.title = titles[i];
//        [self setupTabbarItem:item];
    }
    
    self.window.rootViewController = tabbarVC;
    
}

@end
