# KZH-Lottery
*实现随机抽奖效果
*指定中奖结果

======代码======

KZHLuckView *luckView = [[KZHLuckView alloc] initWithFrame:self.view.frame];
[self.view addSubview:luckView];

//指定抽奖结果,对应数组中的元素
luckView.stopCount = 1;


*Block方式获取最终中奖位置
[luckView getLuckResult:^(NSInteger result) {
NSLog(@"block====>抽到了第%ld个",result);
}];

*Delegate方式获取最终中奖位置
<KZHLuckViewDelegate>

luckView.delegate = self;

-(void)luckViewDidStopWithArrayCount:(NSInteger)count {
NSLog(@"delegate====>抽到了第%ld个",count);
}
