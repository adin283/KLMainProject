//
//  ViewController.m
//  KLMainProject
//
//  Created by Kevin on 2016/12/29.
//  Copyright © 2016年 KevinLab. All rights reserved.
//

#import "ViewController.h"
#import "KLProtocolManager.h"
#import "KLGoodsDetailServiceProtocol.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *goodsButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.title = @"首页";
    
    [self.view addSubview:self.goodsButton];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    self.goodsButton.frame = CGRectMake(0, 0, 100, 100);
    self.goodsButton.center = self.view.center;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - event
- (void)didClickGoodsButton:(UIButton *)button
{
    id<KLGoodsDetailServiceProtocol> goodsServiceProvider = [KLProtocolManager serviceProviderForProtocol:@protocol(KLGoodsDetailServiceProtocol)];
    UIViewController *viewController = [goodsServiceProvider goodsDetailViewControllerWithGoodsId:@"123" goodsName:@"房产"];
    [self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - getters
- (UIButton *)goodsButton
{
    if (_goodsButton == nil) {
        _goodsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_goodsButton setTitle:@"A商品" forState:UIControlStateNormal];
        [_goodsButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_goodsButton addTarget:self action:@selector(didClickGoodsButton:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _goodsButton;
}


@end
