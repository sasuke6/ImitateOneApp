//
//  UIImageView+HCYSDImageLoader.h
//  ImitateOneApp
//
//  Created by ZhiyongXu on 29/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (HCYSDImageLoader)

- (void)hcy_sd_setImageWithURL:(NSString *)url placeholderImageName:(NSString *)placeholderImageName cachePlachoderImage:(BOOL)cachePlachoderImage;

@end
