//
//  NSString+HCYUtility.m
//  ImitateOneApp
//
//  Created by ZhiyongXu on 29/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import "NSString+HCYUtility.h"

@implementation NSString (HCYUtility)

- (NSURL *)hcy_encodedURL {
    return [NSURL URLWithString:[self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
}

@end
