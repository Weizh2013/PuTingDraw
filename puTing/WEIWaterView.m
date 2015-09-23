//
//  WEIWaterView.m
//  puTing
//
//  Created by apple on 15/9/22.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "WEIWaterView.h"

@interface WEIWaterView ()
{
    //六边形的六个点
    CGPoint _point1;
    CGPoint _point2;
    CGPoint _point3;
    CGPoint _point4;
    CGPoint _point5;
    CGPoint _point6;
    CGPoint _Center;
    
    CGFloat _inX1;   // width/2 ~ width/4
    CGFloat _inX2;   // width/2 ~ 3*width/4
    CGFloat _inX3;   // width/2 ~ width
    CGFloat _inX4;   // 3*width/4 ~ width/2
    CGFloat _inX5;   // width/4 ~ wdith/2
    CGFloat _inX6;   // 0 ~ wdith/2
    CGFloat _inY1,_inY2,_inY3,_inY4,_inY5,_inY6;
    
    NSTimer *_timer;
}
@end

@implementation WEIWaterView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        CGFloat width = self.frame.size.width;
        CGFloat height = self.frame.size.height;
        //六边形的六个点
        _point1 = CGPointMake(width/4, 10);
        _point2 = CGPointMake(3*width/4, 10);
        _point3 = CGPointMake(width, height/2);
        _point4 = CGPointMake(3*width/4, height-10);
        _point5 = CGPointMake(width/4, height-10);
        _point6 = CGPointMake(0, height/2);
        _Center = CGPointMake(width/2, height/2);
        
#define STARTOFFSET 30
#define STARTOFFSET2 50
        _inX1 = width/2 - STARTOFFSET/2;    // width/2 ~ width/4    -
        _inX2 = width/2 + STARTOFFSET/2;    // width/2 ~ 3*width/4  +
        _inX3 = width/2 + STARTOFFSET;      // width/2 ~ width      +
        _inX4 = 3*width/4 - STARTOFFSET2/2;  // 3*width/4 ~ width/2  -
        _inX5 = width/4 + STARTOFFSET2/2;    // width/4 ~ wdith/2    +
        _inX6 = 0 + STARTOFFSET2;            // 0 ~ wdith/2          +
        
        _timer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(didTimeOut) userInfo:self repeats:YES];
    }
    return self;
}

- (void)drawRect:(CGRect)rect{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, width/4, 10);
    CGContextAddLineToPoint(context, 3*width/4, 10);
    CGContextAddLineToPoint(context, width, height/2);
    CGContextAddLineToPoint(context, 3*width/4, height-10);
    CGContextAddLineToPoint(context, width/4, height-10);
    CGContextAddLineToPoint(context, 0, height/2);
    CGContextAddLineToPoint(context, width/4, 10);
    CGContextSetFillColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextDrawPath(context, kCGPathFill);
    
    CGContextMoveToPoint(context, width/4, 10);
    CGContextAddLineToPoint(context, 3*width/4, height-10);
    CGContextMoveToPoint(context, 3*width/4, 10);
    CGContextAddLineToPoint(context, width/4, height-10);
    CGContextMoveToPoint(context, width, height/2);
    CGContextAddLineToPoint(context, 0, height/2);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextDrawPath(context, kCGPathStroke);
    
    CGFloat k;
    k = (_Center.y-_point1.y)/(_Center.x-_point1.x);
    _inY1 = k*_inX1 + (_Center.y - k*_Center.x);
    
    k = (_Center.y-_point2.y)/(_Center.x-_point2.x);
    _inY2 = k*_inX2 + (_Center.y - k*_Center.x);
    
    k = (_Center.y-_point3.y)/(_Center.x-_point3.x);
    _inY3 = k*_inX3 + (_Center.y - k*_Center.x);
    
    k = (_Center.y-_point4.y)/(_Center.x-_point4.x);
    _inY4 = k*_inX4 + (_Center.y - k*_Center.x);
    
    k = (_Center.y-_point5.y)/(_Center.x-_point5.x);
    _inY5 = k*_inX5 + (_Center.y - k*_Center.x);
    
    k = (_Center.y-_point6.y)/(_Center.x-_point6.x);
    _inY6 = k*_inX6 + (_Center.y - k*_Center.x);
    
    CGContextMoveToPoint(context, _inX1, _inY1);
    CGContextAddLineToPoint(context, _inX2, _inY2);
    CGContextAddLineToPoint(context, _inX3, _inY3);
    CGContextAddLineToPoint(context, _inX4, _inY4);
    CGContextAddLineToPoint(context, _inX5, _inY5);
    CGContextAddLineToPoint(context, _inX6, _inY6);
    CGContextAddLineToPoint(context, _inX1, _inY1);
    UIColor *maskColor = [UIColor colorWithRed:0.0 green:0.0 blue:1.0 alpha:0.3];
    CGContextSetFillColorWithColor(context, maskColor.CGColor);
    CGContextDrawPath(context, kCGPathFill);

}

- (void)didTimeOut{
    CGFloat width = self.frame.size.width;
    
#define ADDOFFSET 4.0
#define SPEEDOFFSET 0.3
    static CGFloat addBase = -ADDOFFSET;
    if (_inX3 > width - STARTOFFSET) {
        addBase = -ADDOFFSET;
    }else if (_inX3 < width/2 + STARTOFFSET){
        addBase = ADDOFFSET;
    }
    _inX3 += addBase;
    _inX1 -= addBase/2;
    if (_inX2 < 3*width/4 - STARTOFFSET/2 && addBase > 0){
        _inX2 += addBase/2 + SPEEDOFFSET;
        
    }else if(_inX2 > width/2 + STARTOFFSET/2 && addBase < 0){
        _inX2 += addBase/2 - SPEEDOFFSET;
    }
    
    static CGFloat addBase2 = -ADDOFFSET;
    if (_inX6 > width/2 - STARTOFFSET) {
        addBase2 = -ADDOFFSET;
    }else if (_inX6 < 0 + STARTOFFSET){
        addBase2 = ADDOFFSET;
    }
    _inX4 -= addBase2/2;
    _inX6 += addBase2;
    if (_inX5 < width/2 - STARTOFFSET/2 && addBase2 > 0) {
        _inX5 += addBase2/2 + SPEEDOFFSET;
    }else if (_inX5 > width/4 + STARTOFFSET/2 && addBase2 < 0){
        _inX5 += addBase2/2 - SPEEDOFFSET;
    }

    
    
    
//    static CGFloat addx1 = -1.0;
//    if (_inX1 > width/2 - 20) {
//        addx1 = -1.0;
//    }else if (_inX1 < width/4 +20){
//        addx1 = 1.0;
//    }
//    static CGFloat addx2 = 1.0;
//    if (_inX2 > 3*width/4 - 20) {
//        addx2 = -1.0;
//    }else if (_inX2 < width/2 +20){
//        addx2 = 1.0;
//    }
//    static CGFloat addx3 = 1.0;
//    if (_inX3 > width - 20) {
//        addx3 = -1.0;
//    }else if (_inX3 < width/2 +20){
//        addx3 = 1.0;
//    }
//    static CGFloat addx4 = -1.0;
//    if (_inX4 > 3*width/4 - 20) {
//        addx4 = -1.0;
//    }else if (_inX4 < width/2 +20){
//        addx4 = 1.0;
//    }
//    static CGFloat addx5 = 1.0;
//    if (_inX5 > width/2 - 20) {
//        addx5 = -1.0;
//    }else if (_inX5 < width/4 +20){
//        addx5 = 1.0;
//    }
//    static CGFloat addx6 = 1.0;
//    if (_inX6 > width/2 - 20) {
//        addx6 = -1.0;
//    }else if (_inX6 < 0 +20){
//        addx6 = 1.0;
//    }
    
//    _inX1 += addx1;
//    _inX2 += addx2;
//    _inX3 += addx3;
//    _inX4 += addx4;
//    _inX5 += addx5;
//    _inX6 += addx6;
    
    [self setNeedsDisplay];
    
    
//    _inX1 = width/2 - STARTOFFSET/2;    // width/2 ~ width/4    -
//    _inX2 = width/2 + STARTOFFSET/2;    // width/2 ~ 3*width/4  +
//    _inX3 = width/2 + STARTOFFSET;      // width/2 ~ width      +
//    _inX4 = 3*width/4 - STARTOFFSET/2;  // 3*width/4 ~ width/2  -
//    _inX5 = width/4 + STARTOFFSET/2;    // width/4 ~ wdith/2    +
//    _inX6 = 0 + STARTOFFSET;            // 0 ~ wdith/2          +

}

@end
