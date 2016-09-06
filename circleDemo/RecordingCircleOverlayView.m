//
//  RecordingCircleOverlayView.m
//  circleDemo
//
//  Created by 吴凡 on 16/9/2.
//  Copyright © 2016年 吴凡. All rights reserved.
//

#import "RecordingCircleOverlayView.h"

@implementation RecordingCircleOverlayView
{
    NSThread *thread1;
    NSThread *thread2;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        self.strokeWidth = 5.0f;
        
        CGPoint arcCenter = CGPointMake(CGRectGetMidY(self.bounds), CGRectGetMidX(self.bounds));
        //CGFloat radius = CGRectGetMidX(self.bounds) - insets.top - insets.bottom;
        self.cilclePath = [UIBezierPath bezierPathWithArcCenter:arcCenter radius:100 startAngle:M_PI/2*3 endAngle:M_PI/2*7 clockwise:YES];
        [self drawBackgroundShapeLayer];
        
//        dispatch_queue_t serialQueue=dispatch_queue_create("myThreadQueue1", DISPATCH_QUEUE_SERIAL);
//        dispatch_async(serialQueue, ^{
//            [self AddTestViewAndAnimation1];
//            [self AddTestViewAndAnimation2];
//        });
//        
        [self AddTestViewAndAnimation1];
        [self AddTestViewAndAnimation2];
    
    }
    return self;
}

- (void) drawBackgroundShapeLayer
{
    self.CABgLayer = [CAShapeLayer new];
    //填充色
    self.CABgLayer.fillColor = [UIColor clearColor].CGColor;
    //线的颜色
    self.CABgLayer.strokeColor = [UIColor lightGrayColor].CGColor;
    //线宽
    self.CABgLayer.lineWidth = self.strokeWidth;
    
    self.CABgLayer.path = _cilclePath.CGPath;
    
    [self.layer addSublayer:self.CABgLayer];
}

- (void)AddTestViewAndAnimation1{
    self.redLayer = [CAShapeLayer new];
    self.redLayer.fillColor = [UIColor clearColor].CGColor;
    self.redLayer.strokeColor = [UIColor redColor].CGColor;
    self.redLayer.lineWidth = self.strokeWidth;
    self.redLayer.strokeStart = 0.005;
    self.redLayer.strokeEnd = 0.4;
    self.redLayer.path = _cilclePath.CGPath;
    [self.layer addSublayer:self.redLayer];
    
    CABasicAnimation* strokeEndAnimation = nil;
    strokeEndAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation.duration = 2.5;
    strokeEndAnimation.fromValue = @0.005;
    strokeEndAnimation.toValue = @0.4;
    strokeEndAnimation.autoreverses = false;
    strokeEndAnimation.repeatCount = 0.0f;
    
    [self.redLayer addAnimation:strokeEndAnimation forKey:@"strokeEndAnimation"];
    
   // [NSThread sleepForTimeInterval:0.1];
    
    
}

- (void)AddTestViewAndAnimation2{
    self.blueLayer = [CAShapeLayer new];
    self.blueLayer.fillColor = [UIColor clearColor].CGColor;
    self.blueLayer.strokeColor = [UIColor blueColor].CGColor;
    self.blueLayer.lineWidth = self.strokeWidth;
    self.blueLayer.strokeStart = 0.4;
    self.blueLayer.strokeEnd = 0; //从0.4开始，如果不设置为0动画开始前就已经绘制
    self.blueLayer.path = _cilclePath.CGPath;
    [self.layer addSublayer:self.blueLayer];
    
    CABasicAnimation* strokeEndAnimation2 = nil;
    strokeEndAnimation2 = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    strokeEndAnimation2.beginTime = CACurrentMediaTime()+ 2.5;
    strokeEndAnimation2.duration = 2.5;
    strokeEndAnimation2.fromValue = @0.4;
    strokeEndAnimation2.toValue = @0.6;
    strokeEndAnimation2.autoreverses = false;
    strokeEndAnimation2.repeatCount = 0.0f;
    //两个一起动画才不会移除
    strokeEndAnimation2.fillMode = kCAFillModeForwards;
    strokeEndAnimation2.removedOnCompletion = NO;
    
    [self.blueLayer addAnimation:strokeEndAnimation2 forKey:@"strokeEndAnimation"];

}














@end
