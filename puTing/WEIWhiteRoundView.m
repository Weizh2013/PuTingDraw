//
//  WEIWhiteRoundView.m
//  puTing
//
//  Created by apple on 15/9/22.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "WEIWhiteRoundView.h"

@interface WEIWhiteRoundView ()
{
    NSUInteger _startRadius;
    NSUInteger _endRadius;
}
@end
@implementation WEIWhiteRoundView

- (void)drawRect:(CGRect)rect{
    _startRadius = self.frame.size.width/2;
    _endRadius = self.frame.size.width/2-5;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef space = CGColorSpaceCreateDeviceRGB();
    CGFloat red,green,blue;
    [[UIColor whiteColor]getRed:&red green:&green blue:&blue alpha:nil];
    const CGFloat comp[] = {
        red, green, blue, 0.3,
        red, green, blue, 0.5,
        red, green, blue, 0.3
    };
    const CGFloat locations[] = {0.0, 0.5, 1.0};
    CGGradientRef gradient = CGGradientCreateWithColorComponents(space, comp, locations, 3);
    
    CGPoint point = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    CGContextDrawRadialGradient(context, gradient, point, _startRadius, point, _endRadius, 0);
    
    CGColorSpaceRelease(space);
    CGGradientRelease(gradient);

}

@end
