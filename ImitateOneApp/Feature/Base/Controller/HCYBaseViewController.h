//
//  HCYBaseViewController.h
//  ImitateOneApp
//
//  Created by ZhiyongXu on 18/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, HCYPopMenuType) {
    HCYPopMenuTypeWechatFrined,// 微信好友
    HCYPopMenuTypeMoments,// 朋友圈
    HCYPopMenuTypeWeibo,// 微博
    HCYPopMenuTypeQQ,// QQ
    HCYPopMenuTypeCopyURL,// 复制链接
    HCYPopMenuTypeFavorite,// 收藏
};

@interface HCYBaseViewController : UIViewController

@property (nonatomic, assign) BOOL hideNavigationBar;

#pragma mark - HUD

- (void)showHUDWithText:(NSString *)text delay:(NSTimeInterval)delay;


- (void)showSearchingViewController;

- (void)pushMeViewController;

- (void)showHUDServerError;


@end
