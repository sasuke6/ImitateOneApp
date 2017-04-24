//
//  HCYBaseView.h
//  ImitateOneApp
//
//  Created by ZhiyongXu on 24/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HCYBaseViewController;

@interface HCYBaseView : UIView

@property (nonatomic, weak) HCYBaseViewController *parentViewController;
@property (nonatomic, assign) NSInteger viewIndex;

@end
