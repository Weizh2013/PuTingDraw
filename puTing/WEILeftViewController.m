//
//  WEILeftViewController.m
//  
//
//  Created by apple on 15/9/21.
//
//

#import "WEILeftViewController.h"
#import "WEILeftTableViewCell.h"
#import "WEILeftHeaderView.h"
#import "WEILeftFooterView.h"
#import "MMDrawerBarButtonItem.h"

@interface WEILeftViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *_titleArray;
    NSArray *_iconArray;
    WEILeftHeaderView *_leftHeaderView;
}
@end

@implementation WEILeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.view.backgroundColor = [UIColor clearColor];
    
    _titleArray = @[@"追番记录",@"离线缓存",@"布丁统计",@"布丁娘送周边"];
    _iconArray = @[@"side_menu_icon_history",@"side_menu_icon_cache",@"side_menu_icon_statistics",@"side_menu_icon_promotor"];
    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];

    tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"side_menu_bg.jpg"]];
    [tableView registerClass:[WEILeftTableViewCell class] forCellReuseIdentifier:@"leftCell"];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    _leftHeaderView = [[WEILeftHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width-100, 200)];
    [_leftHeaderView addAvatarTarget:self action:@selector(didAvatarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_leftHeaderView addFansTarget:self action:@selector(didFansButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [_leftHeaderView addFollowerTarget:self action:@selector(didFollowerButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    tableView.tableHeaderView = _leftHeaderView;
    
        
    //side_menu_icon_setting
    //side_menu_icon_notification
    WEILeftFooterView *leftFooterView = [[WEILeftFooterView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-400)];
    leftFooterView.setImageView.image = [UIImage imageNamed:@"side_menu_icon_setting"];
    [leftFooterView.setButton setTitle:@"设置" forState:UIControlStateNormal];
    [leftFooterView.setButton addTarget:self action:@selector(didSetButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    leftFooterView.msgImageView.image = [UIImage imageNamed:@"side_menu_icon_notification"];
    [leftFooterView.msgButton setTitle:@"通知" forState:UIControlStateNormal];
    [leftFooterView.msgButton addTarget:self action:@selector(didMsgButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    tableView.tableFooterView = leftFooterView;
    
    tableView.scrollEnabled = NO;
    [self.view addSubview:tableView];
    
}

- (void)didAvatarButtonClicked:(UIButton *)sender{
    NSLog(@"%s",__func__);
//    _leftHeaderView.isLogin = !_leftHeaderView.isLogin;
}

- (void)didFollowerButtonClicked:(UIButton *)sender{
    NSLog(@"%s",__func__);
//    _leftHeaderView.followers++;
}

- (void)didFansButtonClicked:(UIButton *)sender{
    NSLog(@"%s",__func__);
//    _leftHeaderView.fans++;
}

- (void)didSetButtonClicked:(UIButton *)sender{
    NSLog(@"%s",__func__);
}

- (void)didMsgButtonClicked:(UIButton *)sender{
    NSLog(@"%s",__func__);
}

- (void)didLoginButtonClicked:(UIButton *)sender{
    NSLog(@"login in button clicked");
}

//table View delegates
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _titleArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WEILeftTableViewCell *cell;
    cell = [tableView dequeueReusableCellWithIdentifier:@"leftCell"];
    cell.titleImage.image = [UIImage imageNamed:_iconArray[indexPath.row]];
    cell.titleLabel.text = _titleArray[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
