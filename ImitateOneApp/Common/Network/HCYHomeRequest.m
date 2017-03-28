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


- (id)initRequestHomeContent:(NSString *)page withArea:(NSString *)area {
    self = [super init];
    if (self) {
        _page = page;
        _area = area;
    }
    return self;
}

- (NSString *)requestUrl {
    return [NSString stringWithFormat:@"/%@/%@", _page, _area];
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodGET;
}

- (NSInteger)cacheTimeInSeconds {
    return 60 * 3;
}

@end
