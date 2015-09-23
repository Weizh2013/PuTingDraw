//
//  WEICenterViewController.m
//  
//
//  Created by apple on 15/9/21.
//
//

#import "WEICenterViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "WEITitleView.h"
#import "WEIWaterView.h"

@interface WEICenterViewController ()

@end

@implementation WEICenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[UIImage imageNamed:@"default_avatar~iphone"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
    self.view.backgroundColor = [UIColor blueColor];
//    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"左侧栏" style:UIBarButtonItemStylePlain target:self action:@selector(toggleButtonClicked:)];
    MMDrawerBarButtonItem *drawerBarButtonItem = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(toggleButtonClicked:)];
    self.navigationItem.leftBarButtonItem = drawerBarButtonItem;
//    self.navigationController.view.backgroundColor = [UIColor redColor];
    self.navigationItem.leftBarButtonItem.image = [[UIImage imageNamed:@"3rd_icon_qzone_hd_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem.style = UIBarButtonItemStylePlain;
    
    WEITitleView *titleButton = [[WEITitleView alloc]initWithFrame:CGRectMake(0, 0, 120, 44)];
    titleButton.titleArray = @[@"番组",@"动态"];
    [titleButton addTarget:self action:@selector(didTitleButtonClicked:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = titleButton;

    CGFloat tmpHeight = 10+100*sqrt(3);
    WEIWaterView *waterView = [[WEIWaterView alloc]initWithFrame:CGRectMake(50, 200, 200, tmpHeight)];
    waterView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:waterView];
}

- (void)didTitleButtonClicked:(WEITitleView *)sender{
    NSLog(@"index:%lu",sender.selectIndex);
}

- (void)test{
    NSLog(@"test");
}

- (void)toggleButtonClicked:(UIBarButtonItem *)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
