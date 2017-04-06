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


- (id)initWithPage:(NSString *)page area:(NSString *)area {
    self = [super init];
    if (self) {
        _page = page;
        _area = area;
    }
    return self;
}

- (NSString *)requestUrl {
    NSString *requestUrl = [NSString stringWithFormat:@"%@/%@/%@", HomePage, _page, _area];
    return requestUrl;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (NSInteger)cacheTimeInSeconds {
    return 60 * 3;
}

@end
