//
//  KZHLotteryButton.m
//  抽奖demo
//
//  Created by 邝子涵 on 2017/2/22.
//  Copyright © 2017年 邝子涵. All rights reserved.
//

#import "KZHLotteryButton.h"

@implementation KZHLotteryButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        [self setTitle:@"开始抽奖" forState:UIControlStateNormal];
    }
    return self;
}

+ (KZHLotteryButton *)createCellWithFrame:(CGRect)frame {
    return [[KZHLotteryButton alloc] initWithFrame:frame];
}

@end
