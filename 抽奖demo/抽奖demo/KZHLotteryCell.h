//
//  KZHLotteryCell.h
//  抽奖demo
//
//  Created by 邝子涵 on 2017/2/22.
//  Copyright © 2017年 邝子涵. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KZHLotteryCell : UIImageView
@property (nonatomic, weak) UILabel *label;

@property (nonatomic, weak) UIImageView *titleImageView;


+ (KZHLotteryCell *)createCellWithFrame:(CGRect)frame;

@end
