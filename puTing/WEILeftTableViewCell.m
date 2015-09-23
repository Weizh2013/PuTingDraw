//
//  WEILeftTableViewCell.m
//  puTing
//
//  Created by apple on 15/9/21.
//  Copyright (c) 2015年 Weizh. All rights reserved.
//

#import "WEILeftTableViewCell.h"
#import "Masonry.h"

@interface WEILeftTableViewCell ()
{
    UIImageView *_indicateView;
}

@end

@implementation WEILeftTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat height = self.bounds.size.height;
        _titleImage = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, height-10, height-10)];
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(15+(height-10), 5, 200, height-10)];
        _titleLabel.textColor = [UIColor whiteColor];
        
        _indicateView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"home_anime_indicator"]];
        [self addSubview:_indicateView];
        
        [_indicateView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@5);
            make.bottom.equalTo(@-5);
            make.right.equalTo(self).offset(-100);
            make.width.equalTo(@32);
        }];
        
        [self addSubview:_titleLabel];
        [self addSubview:_titleImage];
    
    }
    self.backgroundColor = [UIColor clearColor];
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
