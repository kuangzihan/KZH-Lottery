//
//  KZHLotteryCell.m
//  抽奖demo
//
//  Created by 邝子涵 on 2017/2/22.
//  Copyright © 2017年 邝子涵. All rights reserved.
//

#import "KZHLotteryCell.h"

@implementation KZHLotteryCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        self.image = [UIImage imageNamed:@"l3"];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, width-20, height-20)];
        label.textColor = [UIColor blackColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        self.label = label;
    }
    return self;
}

+ (KZHLotteryCell *)createCellWithFrame:(CGRect)frame {
    return [[KZHLotteryCell alloc] initWithFrame:frame];
}

@end
