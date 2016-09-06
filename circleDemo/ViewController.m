//
//  ViewController.m
//  circleDemo
//
//  Created by 吴凡 on 16/9/2.
//  Copyright © 2016年 吴凡. All rights reserved.
//

#import "ViewController.h"
#import "RecordingCircleOverlayView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    RecordingCircleOverlayView *view = [[RecordingCircleOverlayView alloc]initWithFrame:CGRectMake(0, 0, 300, 300)];

    [self.view addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
