//
//  HCYUtility.h
//  ImitateOneApp
//
//  Created by ZhiyongXu on 29/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HCYUtility : NSObject

+ (NSString *)stringDateFormatWithddMMMyyyyEEEByNormalDateString:(NSString *)normalDateString;

+ (NSString *)stringDateForMusicDetailsDateString:(NSString *)normalDateString;

+ (NSString *)appCurrentVersion;

+ (NSString *)appCurrentBuild;

+ (NSAttributedString *)hcy_attributedStringWithText:(NSString *)text lineSpacing:(CGFloat)lineSpacing font:(UIFont *)font textColor:(UIColor *)textColor;

+ (CGRect)hcy_rectWithAttributedString:(NSAttributedString *)attributedString size:(CGSize)size;

#pragma mark - Int

+ (NSInteger)rowWithCount:(NSInteger)count colNumber:(NSInteger)colNumber;

#pragma mark - Date / 日期

+ (NSDate *)dateWithString:(NSString *)string;

+ (NSTimeInterval)diffTimeIntervalSinceNowFromDateString:(NSString *)dateString;

+ (NSTimeInterval)diffTimeIntervalSinceNowToDateString:(NSString *)dateString;

@end
