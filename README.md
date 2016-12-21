# countDown
自定义倒计时，在block中回调进行的逻辑

_countDown = [[FRCountDown alloc]init]; 实例化

//每一秒调用一次
[_countDown countDownWithPER_SECBlock:^{
    [self updateTime];
    }];
