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

@interface HCYHomeVC ()

@property (strong, nonatomic) NSArray *dataSource;

@end

@implementation HCYHomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self requestHomeContent];
    
}

- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Private Method

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
@end
