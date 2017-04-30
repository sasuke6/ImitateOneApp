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
#import "HCYHomeView.h"
#import "AAPullToRefresh.h"
#import <Masonry.h>

@interface HCYHomeVC () <GMCPagingScrollViewDataSource, GMCPagingScrollViewDelegate> {
    AAPullToRefresh *pullToRefreshLeft;
    AAPullToRefresh *pullToRefreshRight;
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
    
}

#pragma mark - Private Method

- (void)setupViews {
    __weak typeof(self) weakSelf = self;
    
    _pageScrollView = ({
        GMCPagingScrollView *pagingScrollView = [GMCPagingScrollView new];
        pagingScrollView.backgroundColor = HCYViewControllerBGColor;
        [pagingScrollView registerClass:[HCYHomeView class] forReuseIdentifier:kHCYHomeViewID];
        pagingScrollView.dataSource = self;
        pagingScrollView.delegate = self;
        pagingScrollView.pageInsets = UIEdgeInsetsZero;
        pagingScrollView.interpageSpacing = 0;
        pullToRefreshLeft = [pagingScrollView.scrollView addPullToRefreshPosition:AAPullToRefreshPositionLeft actionHandler:^(AAPullToRefresh *v) {
            [weakSelf refreshHomeMore];
            [v performSelector:@selector(stopIndicatorAnimation) withObject:nil afterDelay:1];
        }];
        pullToRefreshLeft.threshold = 100;
        pullToRefreshLeft.borderColor = HCYAppThemeColor;
        pullToRefreshLeft.borderWidth = HCYPullToRefreshBorderWidth;
        pullToRefreshLeft.imageIcon = [UIImage new];
        
        pullToRefreshRight = [pagingScrollView.scrollView addPullToRefreshPosition:AAPullToRefreshPositionRight actionHandler:^(AAPullToRefresh *v) {
            [weakSelf showPreviousList];
            [v performSelector:@selector(stopIndicatorAnimation) withObject:nil afterDelay:1];
        }];
        pullToRefreshRight.borderColor = HCYAppThemeColor;
        pullToRefreshRight.borderWidth = HCYPullToRefreshBorderWidth;
        pullToRefreshRight.imageIcon = [UIImage new];
        
        [self.view addSubview:pagingScrollView];
        [pagingScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        pagingScrollView.hidden = YES;
        
        
        
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
        NSArray *array = [NSArray yy_modelArrayWithClass:[HCYHomeItem class] json:request.responseJSONObject[@"data"][@"content_list"]];
        if (array) {
            self.dataSource = array;
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
                [NSKeyedArchiver archiveRootObject:_dataSource toFile:HCYCacheHomeItemFilePath];
            });

        }
        
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        [self showHUDServerError];
    }];
    
}

- (HCYHomeItem *)homeItemAtIndex:(NSInteger)index {
    return _dataSource[index];
}

- (void)testFunction:(HCYHomeItem *)homeItem {
    NSLog(@"the title is %@", homeItem.title);
}

#pragma mark - Action

- (void)refreshHomeMore {
    [_pageScrollView setCurrentPageIndex:0 reloadData:NO];
    // 刷新
    [self requestHomeContent];
}

- (void)showPreviousList {
    [_pageScrollView setCurrentPageIndex:(_dataSource.count - 1) reloadData:NO];
    // 显示往期列表
}


#pragma mark - GMCPagingScrollViewDataSource
- (NSUInteger)numberOfPagesInPagingScrollView:(GMCPagingScrollView *)pagingScrollView {
    return _dataSource.count;
}

- (UIView *)pagingScrollView:(GMCPagingScrollView *)pagingScrollView pageForIndex:(NSUInteger)index {
    HCYHomeView *view = [pagingScrollView dequeueReusablePageWithIdentifier:kHCYHomeViewID];
    [view configureViewWithHomeItem:[self homeItemAtIndex:index] atIndex:index inViewController:self];
    
    return view;
}

#pragma mark - GMCPagingScrollViewDelegate

- (void)pagingScrollViewDidScroll:(GMCPagingScrollView *)pagingScrollView {
    if (pagingScrollView.isDragging) {
        CGPoint contentOffset = pagingScrollView.scrollView.contentOffset;
        pagingScrollView.scrollView.contentOffset = CGPointMake(contentOffset.x, 0);
    }
}

- (void)pagingScrollView:(GMCPagingScrollView *)pagingScrollView didScrollToPageAtIndex:(NSUInteger)index {

}




@end
