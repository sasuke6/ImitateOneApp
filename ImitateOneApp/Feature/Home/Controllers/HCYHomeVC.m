//
//  HCYHomeVC.m
//  ImitateOneApp
//
//  Created by ZhiyongXu on 8/5/16.
//  Copyright © 2016 ZhiyongXu. All rights reserved.
//

#import "HCYHomeVC.h"
#import "HCYHomeRequest.h"
#import "HCYHomeItem.h"
#import <YYModel.h>
#import <GMCPagingScrollView.h>
#import "Constants.h"

@interface HCYHomeVC () <GMCPagingScrollViewDataSource, GMCPagingScrollViewDelegate> {
    
}

@property (strong, nonatomic) GMCPagingScrollView *pageScrollView;


@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation HCYHomeVC

#pragma mark - Lifecycle

- (void)dealloc {
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    
//    UIImageView *titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"nav_home_title"]];
    self.navigationItem.title  = @"一个";
    [self addNavigationBarRightSearchItem];
    [self addNavigationBarLeftMeItem];
    
    [self setupViews];
    self.view.backgroundColor = [UIColor whiteColor];
    [self requestHomeContent];
    
}

- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method

- (void)setupViews {
    __weak typeof(self) weakSelf = self;
    
    _pageScrollView = ({
        GMCPagingScrollView *pagingScrollView = [GMCPagingScrollView new];
        pagingScrollView.backgroundColor = HCYViewControllerBGColor;
        
        
        
        pagingScrollView;
    });
    
}

#pragma mark - UI

- (void)addNavigationBarRightSearchItem {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navBarSearchIcon"] style:UIBarButtonItemStylePlain target:self action:@selector(showSearchingViewController)];
}

- (void)addNavigationBarLeftMeItem {
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"userCenter"] style:UIBarButtonItemStylePlain target:self action:@selector(pushMeViewController)];
}

#pragma mark - Network Request

- (void)requestHomeContent {
    NSString *page = @"3858";
    NSString *area = @"%E5%B9%BF%E5%B7%9E%E5%B8%82"; //广州市
    
    HCYHomeRequest *request = [[HCYHomeRequest alloc] initWithPage:page area:area];
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"success");
        NSArray *arr = [NSArray yy_modelArrayWithClass:[HCYHomeItem class] json:request.responseJSONObject[@"data"][@"content_list"]];
        self.dataSource = arr;
//        [self testFunction:[self homeItemAtIndex:0]];
        HCYHomeItem *item = arr[0];
        NSLog(@"tilte is %@", item.title);
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"failed");
    }];
    
}

- (HCYHomeItem *)homeItemAtIndex:(NSInteger)index {
    return _dataSource[index];
}

- (void)testFunction:(HCYHomeItem *)homeItem {
    NSLog(@"the title is %@", homeItem.title);
}

#pragma mark - Action


@end
