//
//  WEILeftHeaderView.h
//  puTing
//
//  Created by apple on 15/9/21.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WEILeftHeaderView : UIView

@property (nonatomic,strong) UIImage *avatarImage;
@property (nonatomic,strong,readonly) UILabel *nickNameLabel;
@property (nonatomic,assign) NSUInteger followers;
@property (nonatomic,assign) NSUInteger fans;
@property (nonatomic,assign) BOOL isLogin;

- (void)addAvatarTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
- (void)addFollowerTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;
- (void)addFansTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

@end
