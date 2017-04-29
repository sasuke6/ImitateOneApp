//
//  HCYUtility.m
//  ImitateOneApp
//
//  Created by ZhiyongXu on 29/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import "HCYUtility.h"

static NSDateFormatter *myOneDateFormatter;
static NSDateFormatter *longDateFormatter;
static NSDateFormatter *musicDetailsDateFormatter;

@implementation HCYUtility

+ (NSString *)stringDateFormatWithddMMMyyyyEEEByNormalDateString:(NSString *)normalDateString {
    if (!myOneDateFormatter) {
        myOneDateFormatter = [NSDateFormatter new];
        myOneDateFormatter.dateFormat = @"dd MMM,yyyy. EEE.";
        myOneDateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    }
    
    NSDate *date = [HCYUtility dateWithString:normalDateString];
    
    return [myOneDateFormatter stringFromDate:date];
}

+ (NSString *)stringDateForMusicDetailsDateString:(NSString *)normalDateString {
    if (!musicDetailsDateFormatter) {
        musicDetailsDateFormatter = [NSDateFormatter new];
        musicDetailsDateFormatter.dateFormat = @"MMM dd,yyyy";
        musicDetailsDateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    }
    
    NSDate *date = [HCYUtility dateWithString:normalDateString];
    
    return [musicDetailsDateFormatter stringFromDate:date];
}

+ (NSString *)appCurrentVersion {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appCurrentBuild {
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
}

+ (NSAttributedString *)hcy_attributedStringWithText:(NSString *)text lineSpacing:(CGFloat)lineSpacing font:(UIFont *)font textColor:(UIColor *)textColor {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    
    NSDictionary *attrsDictionary = @{NSFontAttributeName : font, NSForegroundColorAttributeName : textColor, NSParagraphStyleAttributeName : paragraphStyle};
    NSAttributedString *attributedString =  [[NSAttributedString alloc] initWithString:text attributes:attrsDictionary];
    
    return attributedString;
}

+ (CGRect)hcy_rectWithAttributedString:(NSAttributedString *)attributedString size:(CGSize)size {
    CGRect rect = [attributedString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return rect;
}

#pragma mark - Int

+ (NSInteger)rowWithCount:(NSInteger)count colNumber:(NSInteger)colNumber {
    NSInteger row = ceilf(count / (CGFloat)colNumber);
    
    return row;
}

#pragma mark - Date / 日期

+ (NSDate *)dateWithString:(NSString *)string {
    if (!longDateFormatter) {
        longDateFormatter = [NSDateFormatter new];
        longDateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
        longDateFormatter.timeZone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    }
    
    return [longDateFormatter dateFromString:string];
}

+ (NSTimeInterval)diffTimeIntervalSinceNowFromDateString:(NSString *)dateString {
    NSDate *date = [HCYUtility dateWithString:dateString];
    NSTimeInterval interval = [date timeIntervalSinceNow];
    
    return interval;
}

+ (NSTimeInterval)diffTimeIntervalSinceNowToDateString:(NSString *)dateString {
    NSDate *date = [HCYUtility dateWithString:dateString];
    NSDate *now = [NSDate date];
    NSTimeInterval interval = [date timeIntervalSinceDate:now];
    
    return interval;
}

@end
