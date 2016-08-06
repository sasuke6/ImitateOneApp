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
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    [self switchToMainView];
    
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

- (void)switchToMainView {
    
    RDVTabBarController *tabbarVC      = [[RDVTabBarController alloc] init];

    HCYHomeVC *homeVC                  = [[HCYHomeVC alloc] init];
    UINavigationController *homeVCNav  = [[UINavigationController alloc] initWithRootViewController:homeVC];
    
    HCYReadVC *readVC                  = [[HCYReadVC alloc] init];
    UINavigationController *readVCNav  = [[UINavigationController alloc] initWithRootViewController:readVC];

    HCYMusicTableVC *musicVC           = [[HCYMusicTableVC alloc] init];
    UINavigationController *musicVCNav = [[UINavigationController alloc] initWithRootViewController:musicVC];

    HCYMovieTableVC *movieVC           = [[HCYMovieTableVC alloc] init];
    UINavigationController *movieVCNav = [[UINavigationController alloc] initWithRootViewController:movieVC];

    tabbarVC.viewControllers           = @[homeVCNav, readVCNav, musicVCNav, movieVCNav];
    
    NSArray *titles = @[@"首页", @"阅读", @"音乐", @"电影"];
    for (int i = 0; i < tabbarVC.viewControllers.count; i++) {
        RDVTabBarItem *item  = tabbarVC.tabBar.items[i];
        NSString *unselected = [NSString stringWithFormat:@"tab_default_%d",i+1];
        NSString *selected   = [NSString stringWithFormat:@"tab_selected_%d", i+1];
        [item setFinishedSelectedImage:[UIImage imageNamed:selected]
           withFinishedUnselectedImage:[UIImage imageNamed:unselected]];
        item.title           = titles[i];
        [self setupTabbarItem:item];
    }
    
    RDVTabBar *tabBar = [tabbarVC tabBar];
    [tabBar setFrame:CGRectMake(CGRectGetMinX(tabBar.frame), CGRectGetMinY(tabBar.frame), CGRectGetWidth(tabBar.frame), 60)];

    
    self.window.rootViewController = tabbarVC;
    
}

- (void)setupTabbarItem:(RDVTabBarItem *)tabbarItem {
    
    NSDictionary *unselectedTitleAttr    = @{NSForegroundColorAttributeName:[UIColor grayColor]};
    tabbarItem.unselectedTitleAttributes = unselectedTitleAttr;

    NSDictionary *selectedTitleAttr      = @{NSForegroundColorAttributeName:[UIColor blueColor]};
    tabbarItem.selectedTitleAttributes   = selectedTitleAttr;
}

@end
