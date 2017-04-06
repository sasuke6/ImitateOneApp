//
//  HCYHomeItem.h
//  ImitateOneApp
//
//  Created by ZhiyongXu on 29/03/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <YYModel.h>

@interface HCYHomeItem : NSObject

@property (nonatomic, copy) NSString *contentId;
@property (nonatomic, copy) NSString *categoryId;
@property (nonatomic, copy) NSString *displayCategoryId;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *forward;
@property (nonatomic, copy) NSString *imgUrl;
@property (nonatomic, assign) NSInteger *likeCount;
@property (nonatomic, copy) NSString *postDate;
@property (nonatomic, copy) NSString *lateUpdateDate;
@property (nonatomic, copy) NSString *volume;
@property (nonatomic, copy) NSString *wordInfo;
@property (nonatomic, copy) NSString *contentTypeId;
@property (nonatomic, copy) NSString *contentBgColor;


@end
