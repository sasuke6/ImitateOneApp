//
//  HCYBaseViewController.m
//  ImitateOneApp
//
//  Created by ZhiyongXu on 18/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import "HCYBaseViewController.h"
#import <MBProgressHUD/MBProgressHUD.h>
#import "Constants.h"

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


#pragma mark - Private Method

- (void)showHUDWithText:(NSString *)text delay:(NSTimeInterval)delay {
    if (!HUD.isHidden) {
        [HUD hideAnimated:NO];
    }
    HUD = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    // Configure for text only and offset down
    HUD.mode = MBProgressHUDModeText;
    HUD.labelText = text;
    HUD.margin = 10.f;
    HUD.removeFromSuperViewOnHide = YES;
    [HUD hide:YES afterDelay:delay];
}


@end
