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
#import "Constants.h"

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
    if (_scrollView) {
        return;
    }
    
    self.backgroundColor = [UIColor clearColor];
    
    _scrollView = ({
        UIScrollView *scrollView = [UIScrollView new];
        scrollView.showsVerticalScrollIndicator = NO;
        [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        scrollView;
    
    });
    
    
    _contentView = ({
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor whiteColor];
        view.layer.shadowColor = HCYShadowColor.CGColor;// #666666
        view.layer.shadowRadius = 2;
        view.layer.shadowOffset = CGSizeZero;
        view.layer.shadowOpacity = 0.5;
        view.layer.cornerRadius = 5;
        [_scrollView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(_scrollView).insets(UIEdgeInsetsMake(76, 12, 184, 12));
            make.width.equalTo(@(SCREEN_WIDTH - 24));
        }];
        
        view;
    });
    
    _coverView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        imageView.clipsToBounds = YES;
        imageView.userInteractionEnabled = YES;
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(coverTapped)];
//        [imageView addGestureRecognizer:tap];
        [_contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.right.equalTo(_contentView).insets(UIEdgeInsetsMake(6, 6, 0, 6));
            make.height.equalTo(imageView.mas_width).multipliedBy(0.75);
        }];
        
        imageView;
    });
    
    
    _titleLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
//        label.textColor = MLBGrayTextColor;
//        label.font = FontWithSize(10);
        label.textAlignment = NSTextAlignmentRight;
        [label setContentHuggingPriority:251 forAxis:UILayoutConstraintAxisHorizontal];
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_coverView.mas_bottom).offset(8);
            make.left.greaterThanOrEqualTo(_volLabel.mas_right).offset(4);
            make.right.equalTo(_coverView);
        }];
        
        label;
    });
    
    _contentTextView = ({
        UITextView *textView = [UITextView new];
        textView.backgroundColor = [UIColor whiteColor];
//        textView.textColor = MLBLightBlackTextColor;
//        textView.font = FontWithSize(14);
        textView.editable = NO;
        [_contentView addSubview:textView];
        [textView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_volLabel.mas_bottom).offset(15);
            make.left.right.equalTo(_coverView);
            _textViewHeightConstraint = make.height.equalTo(@0);
        }];
        
        textView;
    });
    
    _dateLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
//        label.textColor = MLBDarkGrayTextColor;
//        label.font = FontWithSize(12);
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_contentTextView.mas_bottom).offset(10);
            make.right.equalTo(_coverView);
            make.bottom.equalTo(_contentView).offset(-12);
        }];
        
        label;
    });
    
    _locationLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
//        label.textColor = MLBDarkGrayTextColor;
//        label.font = FontWithSize(12);
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_dateLabel);
            make.right.equalTo(_dateLabel.mas_left).offset(-10);
        }];
        
        label;
    });
    
    _temperatureLabel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
//        label.textColor = MLBDarkGrayTextColor;
//        label.font = FontWithSize(12);
        [_contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(_dateLabel);
            make.right.equalTo(_locationLabel.mas_left).offset(-2);
        }];
        
        label;
    });
    
    _weatherView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = [UIColor whiteColor];
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [_contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@24);
            make.centerY.equalTo(_dateLabel);
            make.right.equalTo(_temperatureLabel.mas_left).offset(-5);
        }];
        
        imageView;
    });
    
    
}

#pragma mark - Action

- (void)diaryButtonClicked {
    if (_clickedButton) {
        _clickedButton(MLBActionTypeDiary);
    }
}

- (void)likeButtonClicked {
    if (_clickedButton) {
        _clickedButton(MLBActionTypePraise);
    }
}


@end
