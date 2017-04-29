//
//  Constants.h
//  ImitateOneApp
//
//  Created by ZhiyongXu on 18/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#ifndef Constants_h
#define Constants_h

// Hint
#define BAD_NETWORK                             @"网络连接失败"
#define SERVER_ERROR                            @"服务器连接失败"

#pragma mark - UIColor

#define HCYViewControllerBGColor                [UIColor colorWithRed:250 / 255.0 green:252 / 255.0 blue:255 / 255.0 alpha:1]// #FAFCFF
#define HCYShadowColor                          [UIColor colorWithWhite:102 / 255.0 alpha:1]// #666666
#define HCYGrayTextColor                        [UIColor colorWithWhite:177 / 255.0 alpha:1]// #B1B1B1
#define HCYLightBlackTextColor                  [UIColor colorWithWhite:90 / 255.0 alpha:1]// #5A5A5A
#define HCYDarkGrayTextColor                    [UIColor colorWithWhite:173 / 255.0 alpha:1]// #ADADAD

// HUD
#define HUD_DELAY                               1.5


// 字体
#pragma mark - font
#define FontWithNameSize(name, size)    [UIFont fontWithName:name size:size]
#define FontWithSize(size)              [UIFont systemFontOfSize:size]


// 屏幕高度
#define SCREEN_HEIGHT             [[UIScreen mainScreen] bounds].size.height
// 屏幕宽度
#define SCREEN_WIDTH              [[UIScreen mainScreen] bounds].size.width
#define FULL_WIDTH                SCREEN_WIDTH


// 是否为中文
#define IS_CH_SYMBOL(chr)               ((int)(chr)>127)
#define StringByTrimWhiteSpace(text)    [text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]]
#define IsStringEmpty(string)           (!string || [@"" isEqualToString:string])
#define IsStringNotEmpty(string)        (string && ![@"" isEqualToString:string])

#endif /* Constants_h */
