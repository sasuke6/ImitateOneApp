//
//  UIImageView+HCYSDImageLoader.m
//  ImitateOneApp
//
//  Created by ZhiyongXu on 29/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import "UIImageView+HCYSDImageLoader.h"
#import <SDImageCache.h>
#import "Constants.h"
#import "NSString+HCYUtility.h"
#import <UIImageView+WebCache.h>

@implementation UIImageView (HCYSDImageLoader)

- (void)hcy_sd_setImageWithURL:(NSString *)url placeholderImageName:(NSString *)placeholderImageName cachePlachoderImage:(BOOL)cachePlachoderImage {
    if ([[SDImageCache sharedImageCache] diskImageExistsWithKey:url]) {
        self.image = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:url];
    } else {
        UIImage *placeholderImage;
        if (IsStringNotEmpty(placeholderImageName)) {
            if (cachePlachoderImage) {
                placeholderImage = [UIImage imageNamed:placeholderImageName];
            } else {
                NSString *pathOfImage = [[NSBundle mainBundle] pathForResource:placeholderImageName ofType:@"png"];
                placeholderImage = [UIImage imageWithContentsOfFile:pathOfImage];
            }
        }
        [self sd_setImageWithURL:[url hcy_encodedURL] placeholderImage:placeholderImage completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [[SDImageCache sharedImageCache] storeImage:image forKey:url toDisk:YES];
            });
        }];
                
    }
}

@end
