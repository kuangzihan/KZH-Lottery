# KZH-Lottery

###功能实现：
* 随机抽奖闪动效果
* 引入数字指定中奖位置

###技术要点：
* 点击按钮调用NSTimer实现轮盘转动
* 每次调用定时器递增当前时间，通过减结束时间控制递减时间并每次调用自身，直到当前时间大于结束时间终止定时器。

###代码调用：
<p>初始化并设置抽奖位置：</p>
<pre><code>// 初始抽奖界面
KZHLuckView *luckView = [[KZHLuckView alloc] initWithFrame:self.view.frame];
[self.view addSubview:luckView];
// 指定抽奖结果,对应数组中的元素
luckView.stopCount = 1;
</code></pre>
<p>block方式获取最终中奖位置：</p>
<pre><code>// 调用block返回中奖结果
[luckView getLuckResult:^(NSInteger result) {
NSLog(@"block====>抽到了第%ld个",result);
}];
</code></pre>
<p>delegate方式获取最终中奖位置：</p>
<pre><code>
// 首先调用KZHLuckViewDelegate
// 签订代理人
luckView.delegate = self;

// 实现代理方法
-(void)luckViewDidStopWithArrayCount:(NSInteger)count {
NSLog(@"delegate====>抽到了第%ld个",count);
}
</code></pre>
