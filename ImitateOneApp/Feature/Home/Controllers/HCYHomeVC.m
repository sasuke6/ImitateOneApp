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
#import <YYKit.h>

@interface HCYHomeVC ()

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
    HCYHomeRequest *request = [[HCYHomeRequest alloc] initRequestHomeContent];
    [request startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"success");
        HCYHomeItem *homeItem = [HCYHomeItem modelWithJSON:request.responseJSONObject];
        NSLog(@"the model is %@", homeItem);
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        NSLog(@"failed");
    }];
    
}

@end
