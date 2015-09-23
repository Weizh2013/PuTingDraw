//
//  WEILeftHeaderView.m
//  puTing
//
//  Created by apple on 15/9/21.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "WEILeftHeaderView.h"
#import "Masonry.h"
#import "WEIWhiteRoundView.h"

@interface WEILeftHeaderView ()
{
    UIButton *_avatarButton;
    UIButton *_followerButton;
    UIButton *_fansButton;
    WEIWhiteRoundView *_roundView;
}

@end
@implementation WEILeftHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self creatAvatarButton];
        [self creatNickNameLabel];
        [self creatFollowerButton];
        [self creatFansButton];
    }
    return self;
}

- (void)creatAvatarButton{
    _roundView = [[WEIWhiteRoundView alloc]initWithFrame:CGRectMake(86, 20, 100, 100)];
    _roundView.backgroundColor = [UIColor clearColor];
    [self addSubview:_roundView];
    
    _avatarButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_avatarButton setImage:[[UIImage imageNamed:@"default_avatar"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    _avatarButton.layer.cornerRadius = 40;
    _avatarButton.layer.masksToBounds = YES;
    [self addSubview:_avatarButton];
    [_avatarButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@30);
        make.left.equalTo(@96);
        make.width.height.equalTo(@80);
    }];
    
}

- (void)creatNickNameLabel{
    _nickNameLabel = [[UILabel alloc]init];
    _nickNameLabel.text = @"剑气书香";
    _nickNameLabel.textAlignment = NSTextAlignmentCenter;
    _nickNameLabel.textColor = [UIColor whiteColor];
    [self addSubview:_nickNameLabel];
    [_nickNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_avatarButton.mas_bottom).offset(10);
        make.centerX.equalTo(_avatarButton);
        make.width.equalTo(@200);
        make.height.equalTo(@30);
    }];
}

- (void)creatFollowerButton{
    _followerButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_followerButton setTitle:[NSString stringWithFormat:@"关注 %lu",_followers] forState:UIControlStateNormal];
    [_followerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _followerButton.titleLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:_followerButton];
    [_followerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nickNameLabel.mas_bottom).offset(10);
        make.right.equalTo(_nickNameLabel.mas_centerX);
        make.width.equalTo(@80);
        make.height.equalTo(@10);
    }];
    _followerButton.hidden = YES;
}


- (void)creatFansButton{
    _fansButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_fansButton setTitle:[NSString stringWithFormat:@"粉丝 %lu",_fans] forState:UIControlStateNormal];
    [_fansButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _fansButton.titleLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:_fansButton];
    [_fansButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_nickNameLabel.mas_bottom).offset(10);
        make.left.equalTo(_nickNameLabel.mas_centerX);
        make.width.equalTo(@80);
        make.height.equalTo(@10);
    }];
    _fansButton.hidden = YES;
}

- (void)setFans:(NSUInteger)fans{
    _fans = fans;
    [_fansButton setTitle:[NSString stringWithFormat:@"粉丝 %lu",_fans] forState:UIControlStateNormal];
}

- (void)setFollowers:(NSUInteger)followers{
    _followers = followers;
    [_followerButton setTitle:[NSString stringWithFormat:@"关注 %lu",_followers] forState:UIControlStateNormal];
}

- (void)setIsLogin:(BOOL)isLogin{
    _isLogin = isLogin;
    _fansButton.hidden = !isLogin;
    _followerButton.hidden = !isLogin;
}

- (void)addAvatarTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    [_avatarButton addTarget:target action:action forControlEvents:controlEvents];
}

- (void)addFansTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    [_fansButton addTarget:target action:action forControlEvents:controlEvents];
}

- (void)addFollowerTarget:(id)target action:(SEL)action forControlEvents:(UIControlEvents)controlEvents{
    [_followerButton addTarget:target action:action forControlEvents:controlEvents];
}

@end
