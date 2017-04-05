//
//  HCYHomeRequest.m
//  ImitateOneApp
//
//  Created by ZhiyongXu on 28/03/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import "HCYHomeRequest.h"
#import "HCYAPIConstant.h"

@implementation HCYHomeRequest {
    NSString *_page;
    NSString *_area;
}


- (id)initRequestHomeContent {
    self = [super init];
    if (self) {
        _page = @"3858";
        _area = @"广州";
    }
    return self;
}

- (NSString *)requestUrl {
    return @"onelist/3858/%E5%B9%BF%E5%B7%9E%E5%B8%82"; //广州市
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (NSInteger)cacheTimeInSeconds {
    return 60 * 3;
}

@end
