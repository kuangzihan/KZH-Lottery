//
//  KZHLuckView.h
//  抽奖demo
//
//  Created by 邝子涵 on 2017/2/22.
//  Copyright © 2017年 邝子涵. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KZHLuckViewDelegate <NSObject>

typedef void (^luckBlock)(NSInteger result);
typedef void (^luckBtnBlock)(UIButton *btn);

- (void)luckViewDidStopWithArrayCount:(NSInteger)count;


@end


@interface KZHLuckView : UIView
// 存储图片数组
@property (nonatomic, strong) NSMutableArray *imageArray;

// 停止位置（数组下标）
@property (nonatomic, assign) int stopCount;



@property (assign, nonatomic) id<KZHLuckViewDelegate> delegate;

@property (copy, nonatomic) luckBlock luckResultBlock;



- (void)getLuckResult:(luckBlock)luckResult;


@end
