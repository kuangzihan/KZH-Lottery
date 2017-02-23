//
//  KZHLuckView.m
//  抽奖demo
//
//  Created by 邝子涵 on 2017/2/22.
//  Copyright © 2017年 邝子涵. All rights reserved.
//

#import "KZHLuckView.h"
#import "KZHLotteryCell.h"
#import "KZHLotteryButton.h"


#define HScreen [[UIScreen mainScreen] bounds].size.height
#define WScreen [[UIScreen mainScreen] bounds].size.width

@interface KZHLuckView () {
    NSTimer *_startTimer;
    
    int _currentTime;
    int _stopTime;
    int _result;
    
    
    int _currentIndex;
}

@property (nonatomic, strong) NSMutableArray *btnArray;

@property (nonatomic, weak) KZHLotteryButton *startButton;

@property (nonatomic, assign) CGFloat time;

@property (nonatomic, weak) UITextField *winNumberText;

@property (nonatomic, assign) BOOL isStartButtonOpen;

@end


@implementation KZHLuckView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    float originX=15;
    float space=10;
    float cellWidth=80;
    float cellHeight=60;
    float orginY=75;
    
    KZHLotteryCell *lotteryCell1 = [KZHLotteryCell createCellWithFrame:CGRectMake(originX, orginY, cellWidth, cellHeight)];
    lotteryCell1.label.text = @"0";
    [self addSubview:lotteryCell1];
    
    KZHLotteryCell *lotteryCell2 = [KZHLotteryCell createCellWithFrame:CGRectMake(originX+cellWidth+space, orginY, cellWidth, cellHeight)];
    lotteryCell2.label.text = @"1";
    [self addSubview:lotteryCell2];
    
    KZHLotteryCell *lotteryCell3 = [KZHLotteryCell createCellWithFrame:CGRectMake(originX+cellWidth*2+space*2, orginY, cellWidth, cellHeight)];
    lotteryCell3.label.text = @"2";
    [self addSubview:lotteryCell3];
    
    KZHLotteryCell *lotteryCell4 = [KZHLotteryCell createCellWithFrame:CGRectMake(originX+cellWidth*3+space*3, orginY, cellWidth, cellHeight)];
    lotteryCell4.label.text = @"3";
    [self addSubview:lotteryCell4];
    
    KZHLotteryCell *lotteryCell5 = [KZHLotteryCell createCellWithFrame:CGRectMake(originX+cellWidth*3+space*3, orginY+cellHeight+space, cellWidth, cellHeight)];
    lotteryCell5.label.text = @"4";
    [self addSubview:lotteryCell5];
    
    KZHLotteryCell *lotteryCell6 = [KZHLotteryCell createCellWithFrame:CGRectMake(originX+cellWidth*3+space*3, orginY+(cellHeight+space)*2, cellWidth, cellHeight)];
    lotteryCell6.label.text = @"5";
    [self addSubview:lotteryCell6];
    
    KZHLotteryCell *lotteryCell7 = [KZHLotteryCell createCellWithFrame:CGRectMake(originX+cellWidth*3+space*3, orginY+(cellHeight+space)*3, cellWidth, cellHeight)];
    lotteryCell7.label.text = @"6";
    [self addSubview:lotteryCell7];
    
    KZHLotteryCell *lotteryCell8 = [KZHLotteryCell createCellWithFrame:CGRectMake(originX+cellWidth*2+space*2, orginY+(cellHeight+space)*3, cellWidth, cellHeight)];
    lotteryCell8.label.text = @"7";
    [self addSubview:lotteryCell8];
    
    KZHLotteryCell *lotteryCell9 = [KZHLotteryCell createCellWithFrame:CGRectMake(originX+cellWidth*1+space*1, orginY+(cellHeight+space)*3, cellWidth, cellHeight)];
    lotteryCell9.label.text = @"8";
    [self addSubview:lotteryCell9];
    
    KZHLotteryCell *lotteryCell10 = [KZHLotteryCell createCellWithFrame:CGRectMake(originX+cellWidth*0+space*0, orginY+(cellHeight+space)*3, cellWidth, cellHeight)];
    lotteryCell10.label.text = @"9";
    [self addSubview:lotteryCell10];
    
    KZHLotteryCell *lotteryCell11 = [KZHLotteryCell createCellWithFrame:CGRectMake(originX+cellWidth*0+space*0, orginY+(cellHeight+space)*2, cellWidth, cellHeight)];
    lotteryCell11.label.text = @"10";
    [self addSubview:lotteryCell11];
    
    KZHLotteryCell *lotteryCell12 = [KZHLotteryCell createCellWithFrame:CGRectMake(originX+cellWidth*0+space*0, orginY+cellHeight+space, cellWidth, cellHeight)];
    lotteryCell12.label.text = @"11";
    [self addSubview:lotteryCell12];
    
    self.btnArray = [NSMutableArray arrayWithObjects:lotteryCell1, lotteryCell2, lotteryCell3, lotteryCell4, lotteryCell5, lotteryCell6, lotteryCell7, lotteryCell8, lotteryCell9, lotteryCell10, lotteryCell11, lotteryCell12, nil];
    
    for (int i = 0; i < self.btnArray.count; i++) {
        KZHLotteryCell *view = self.btnArray[i];
        view.tag = i;
    }
    
    
    
    KZHLotteryButton *startButton = [KZHLotteryButton createCellWithFrame:CGRectMake(originX+cellWidth+space, orginY+cellHeight+space, cellWidth*2+space, cellHeight*2+space)];
    [self addSubview:startButton];
    self.startButton = startButton;
    [startButton addTarget:self action:@selector(prepareLotteryAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    UITextField *winNumberText = [[UITextField alloc] initWithFrame:CGRectMake((WScreen - (WScreen - 100))/2, CGRectGetMaxY(lotteryCell10.frame) + 30, WScreen - 100, 30)];
    winNumberText.placeholder = @"请输入0-11中奖数字";
    winNumberText.layer.borderWidth = 1;
    winNumberText.layer.borderColor = [UIColor blackColor].CGColor;
    winNumberText.keyboardType = UIKeyboardTypeNumberPad;
    winNumberText.clearButtonMode = UITextFieldViewModeAlways;
    [self addSubview:winNumberText];
    self.winNumberText = winNumberText;
    
}


- (void)prepareLotteryAction {
    [self.winNumberText resignFirstResponder];
    
    if (_isStartButtonOpen == NO) {
        //点击开始抽奖
        _currentTime = _result;
        self.time = 0.1;
        _stopTime = 50 + self.stopCount % 8;
        [self.startButton setTitle:@"跳过等待" forState:UIControlStateNormal];
        _startTimer = [NSTimer scheduledTimerWithTimeInterval:self.time target:self selector:@selector(start:) userInfo:nil repeats:YES];
    }else{
        [_startTimer invalidate];
        [self.startButton setTitle:@"开始抽奖" forState:UIControlStateNormal];
        [self changeLotteryCellNumber:[self.winNumberText.text intValue]];
        [self getStopResult];
    }
    
    _isStartButtonOpen = !_isStartButtonOpen;
}

- (void)start:(NSTimer *)timer {
    [self changeLotteryCellNumber:arc4random() % 12];
    // 每次执行递增当前时间
    _currentTime++;
    
    if (_currentTime > _stopTime) {
        [timer invalidate];
        _isStartButtonOpen = NO;
        [self.startButton setTitle:@"开始抽奖" forState:UIControlStateNormal];
        
        NSLog(@"%d", self.stopCount);
        // 执行结束改变最终落下效果
        [self changeLotteryCellNumber:[self.winNumberText.text intValue]];
        // 回传中奖结果
        [self getStopResult];
        
        return;
    }
    
    // 控制轮转时间
    if (_currentTime > _stopTime - 6) {
        // 结束时间递增
        self.time += 0.1;
        [timer invalidate];
        _startTimer = [NSTimer scheduledTimerWithTimeInterval:self.time target:self selector:@selector(start:) userInfo:nil repeats:YES];
    }
}

// cell闪动
- (void)changeLotteryCellNumber:(int)number {
    KZHLotteryCell *oldCell = [self.btnArray objectAtIndex:_currentIndex];
    oldCell.image = [UIImage imageNamed:@"l3"];
    if (number >= 12) {
        _currentIndex = number % 12;
    }else{
        _currentIndex = number;
    }
    KZHLotteryCell *currentCell = [self.btnArray objectAtIndex:_currentIndex];
    currentCell.image = [UIImage imageNamed:@"l2"];
    
    // 结果为当前最终位置
    _result = _currentIndex;
}


- (void)stopWithCount:(NSInteger)count {
    if ([self.delegate respondsToSelector:@selector(luckViewDidStopWithArrayCount:)]) {
        [self.delegate luckViewDidStopWithArrayCount:count];
    }
}


- (void)getStopResult {
    [self stopWithCount:_result];
    if (self.luckResultBlock != nil) {
        self.luckResultBlock(_result);
    }
}


- (void)dealloc {
    [_startTimer invalidate];
}

- (void)getLuckResult:(luckBlock)luckResult {
    self.luckResultBlock = luckResult;
}




- (void)setImageArray:(NSMutableArray *)imageArray {
    if (_imageArray != imageArray) {
        _imageArray = imageArray;
    }
    
    
}


@end
