//
//  ViewController.m
//  抽奖demo
//
//  Created by 邝子涵 on 2017/2/22.
//  Copyright © 2017年 邝子涵. All rights reserved.
//

#import "ViewController.h"
#import "KZHLuckView.h"

@interface ViewController ()<KZHLuckViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupUI];
}

- (void)setupUI {
    KZHLuckView *luckView = [[KZHLuckView alloc] initWithFrame:self.view.frame];
    luckView.delegate = self;
    [self.view addSubview:luckView];
    
    
    //指定抽奖结果,对应数组中的元素
    luckView.stopCount = 1;
    
    //block获取结果
    [luckView getLuckResult:^(NSInteger result) {
        NSLog(@"block====>抽到了第%ld个",result);
    }];
    
}

- (void)luckViewDidStopWithArrayCount:(NSInteger)count {
    NSLog(@"delegate====>抽到了第%ld个",count);
}


@end
