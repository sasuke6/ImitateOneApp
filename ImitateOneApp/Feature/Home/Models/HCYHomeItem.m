//
//  HCYHomeItem.m
//  ImitateOneApp
//
//  Created by ZhiyongXu on 29/03/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import "HCYHomeItem.h"


@implementation HCYHomeItem

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"contentId" : @"id",
             @"categoryId" : @"category",
             @"displayCategoryId" : @"display_category",
             @"title" : @"title",
             @"forward" : @"forward",
             @"imgUrl" : @"img_url",
             @"likeCount" : @"like_count",
             @"postDate" : @"post_date",
             @"lateUpdateDate" : @"last_update_date",
             @"volume" : @"volume",
             @"wordInfo" : @"word_info",
             @"contentTypeId" : @"content_type",
             @"contentBgColor" : @"content_bgcolor",
             };
}

@end
