//
//  RecordingCircleOverlayView.h
//  circleDemo
//
//  Created by 吴凡 on 16/9/2.
//  Copyright © 2016年 吴凡. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecordingCircleOverlayView : UIView
@property (nonatomic,assign)CGFloat strokeWidth;
@property (nonatomic,strong)CAShapeLayer *CABgLayer;
@property (nonatomic,strong)UIBezierPath *cilclePath;
@property(nonatomic,strong)NSMutableArray* progressLayers;
@property(nonatomic,strong)CAShapeLayer* currentProgressLayer;
@property(nonatomic,strong)CAShapeLayer* redLayer;
@property(nonatomic,strong)CAShapeLayer* blueLayer;

@end
