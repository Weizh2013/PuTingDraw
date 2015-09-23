//
//  WEILeftFooterView.m
//  puTing
//
//  Created by apple on 15/9/21.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "WEILeftFooterView.h"

@implementation WEILeftFooterView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _setButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _setButton.frame = CGRectMake(20, self.bounds.size.height-20, 100, 32);
        _setButton.titleLabel.textAlignment = NSTextAlignmentRight;
        [_setButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:_setButton];
        _setImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, self.bounds.size.height-20, 32, 32)];
        [self addSubview:_setImageView];
        
        _msgButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _msgButton.frame = CGRectMake(160, self.bounds.size.height-20, 100, 32);
        _msgButton.titleLabel.textAlignment = NSTextAlignmentRight;
        [_msgButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:_msgButton];
        _msgImageView = [[UIImageView alloc]initWithFrame:CGRectMake(160, self.bounds.size.height-20, 32, 32)];
        [self addSubview:_msgImageView];

    }
    return self;
}








@end
