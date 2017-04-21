//
//  HCYBaseViewController.m
//  ImitateOneApp
//
//  Created by ZhiyongXu on 18/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import "HCYBaseViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "HCYSearchVC.h"
#import "Constants.h"
#import <CocoaLumberjack.h>

#pragma mark - Framework

#define LOG_LEVEL_DEF ddLogLevel
static const DDLogLevel ddLogLevel = DDLogLevelVerbose;

@interface HCYBaseViewController ()

@end


@implementation HCYBaseViewController {
    MBProgressHUD *HUD;
}

#pragma mark - Lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = HCYViewControllerBGColor;
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = _hideNavigationBar;
    
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.hidesBottomBarWhenPushed = YES;
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    if (self == [self.navigationController.viewControllers firstObject]) {
        self.hidesBottomBarWhenPushed = NO;
    }
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}


#pragma mark - Private Method

#pragma mark - HUD

- (void)showHUDWithText:(NSString *)text delay:(NSTimeInterval)delay {
    if (!HUD.isHidden) {
        [HUD hideAnimated:NO];
    }
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    // Configure for text only and offset down
    HUD.mode = MBProgressHUDModeText;
    HUD.label.text = text;
    HUD.margin = 10.f;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hideAnimated:YES afterDelay:delay];
}

- (void)showHUDDone {
    [self showHUDDoneWithText:@"Completed"];
}

- (void)showHUDDoneWithText:(NSString *)text {
    if (!HUD.isHidden) {
        [HUD hideAnimated:NO];
    }
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_right"]];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.label.text = text;
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:HUD_DELAY];
    
}

- (void)showHUDErrorWithText : (NSString *)text {
    if (!HUD.isHidden) {
        [HUD hideAnimated:NO];
    }
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"common_icon_error"]];
    HUD.mode = MBProgressHUDModeCustomView;
    HUD.label.text = text;
    [HUD showAnimated:YES];
    [HUD hideAnimated:YES afterDelay:HUD_DELAY];
}

- (void)showHUDNetError {
    [self showHUDErrorWithText:BAD_NETWORK];
}

- (void)showHUDServerError {
    [self showHUDErrorWithText:SERVER_ERROR];
}

- (void)showWithLabelText:(NSString *)showText executing:(SEL)method {
    if (!HUD.isHidden) {
        [HUD hideAnimated:NO];
    }
    HUD = [[MBProgressHUD alloc] initWithView:self.view];
    [self.view addSubview:HUD];
    HUD.label.text = showText;
    [HUD showWhileExecuting:method onTarget:self withObject:nil animated:YES]; //保留先，使用GCD
}

- (void)showHUDWithText:(NSString *)text {
    [self hideHud];
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    // Configure for text only and offset down
    HUD.mode = MBProgressHUDModeIndeterminate;
    HUD.label.text = text;
    HUD.margin = 10.f;
    HUD.removeFromSuperViewOnHide = YES;
}

- (void)modelTransformFailedWithError:(NSError *)error {
    [self showHUDErrorWithText:@"JSON 转 Model 失败"];
    DDLogDebug(@"error = %@", error);
}

- (void)hideHud {
    if (HUD && !HUD.isHidden) {
        [HUD hideAnimated:NO];
    }
}

#pragma mark - UI

#pragma mark - Action

- (void)pushMeViewController {
    
}

- (void)showSearchingViewController {
    [self.navigationController presentViewController:[[UINavigationController alloc] initWithRootViewController:[[HCYSearchVC alloc] init]] animated:YES completion:NULL];
}



@end
