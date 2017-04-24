//
//  HCYHomeView.m
//  ImitateOneApp
//
//  Created by ZhiyongXu on 24/04/2017.
//  Copyright © 2017 ZhiyongXu. All rights reserved.
//

#import "HCYHomeView.h"
#import "HCYHomeItem.h"
#import <Masonry.h>

NSString *const kHCYHomeViewID = @"MLBHomeViewID";

@interface HCYHomeView ()

@property (strong, nonatomic) UIScrollView *scrollView;
@property (strong, nonatomic) UIButton *diaryButton;
@property (strong, nonatomic) UIButton *likeButton;
@property (strong, nonatomic) UILabel *likeNumLabel;
@property (strong, nonatomic) UIButton *moreButton;
@property (strong, nonatomic) UIView *contentView;
@property (strong, nonatomic) UIImageView *coverView;
@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UIImageView *weatherView;
@property (strong, nonatomic) UILabel *temperatureLabel;
@property (strong, nonatomic) UILabel *locationLabel;
@property (strong, nonatomic) UILabel *dateLabel;
@property (strong, nonatomic) UITextView *contentTextView;
@property (strong, nonatomic) UILabel *volLabel;

@property (strong, nonatomic) MASConstraint *textViewHeightConstraint;

@end


@implementation HCYHomeView

#pragma mark - LifeCycle

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (void)setupViews {
    
}

@end
