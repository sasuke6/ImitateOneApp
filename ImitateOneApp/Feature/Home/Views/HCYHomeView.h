//
//  HCYHomeView.h
//  ImitateOneApp
//
//  Created by ZhiyongXu on 24/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import "HCYBaseView.h"

FOUNDATION_EXPORT NSString *const kHCYHomeViewID;

typedef NS_ENUM(NSUInteger, HCYActionType) {
    MLBActionTypeDiary,
    MLBActionTypePraise,
    MLBActionTypeMore,
};

@interface HCYHomeView : HCYBaseView

@property (nonatomic, copy) void (^clickedButton)(HCYActionType type);


@end
