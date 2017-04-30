//
//  HCYHomeView.h
//  ImitateOneApp
//
//  Created by ZhiyongXu on 24/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import "HCYBaseView.h"
@class HCYHomeItem;

FOUNDATION_EXPORT NSString *const kHCYHomeViewID;

typedef NS_ENUM(NSUInteger, HCYActionType) {
    HCYActionTypeDiary,
    HCYActionTypePraise,
    HCYActionTypeMore,
};

@interface HCYHomeView : HCYBaseView

@property (nonatomic, copy) void (^clickedButton)(HCYActionType type);

- (void)configureViewWithHomeItem:(HCYHomeItem *)homeItem atIndex:(NSInteger)index inViewController:(HCYBaseViewController *)parentViewController;


@end
