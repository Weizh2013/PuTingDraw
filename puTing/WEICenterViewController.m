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

@interface WEICenterViewController ()<UIScrollViewDelegate>
{
    WEITitleView *_titleButton;
    UIScrollView *_scrollView;
    WEIWaterView *_waterView;
}
@end

@implementation WEICenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationSet];
    [self scrollViewCreat];
}

- (void)scrollViewCreat{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _scrollView.backgroundColor = [UIColor grayColor];
    _scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*2, self.view.bounds.size.height);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    _scrollView.minimumZoomScale = 0.1;
    _scrollView.maximumZoomScale = 1.5;
    
    _scrollView.pagingEnabled = YES;
    _scrollView.bounces = NO;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];
    UIView *view1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    view1.backgroundColor = [UIColor redColor];
    UIView *view2 = [[UIView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    view2.backgroundColor = [UIColor greenColor];
    [_scrollView addSubview:view1];
    [_scrollView addSubview:view2];
    [self addWaterViewIn:_scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"拖动结束，结束码：%d",decelerate);
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    NSLog(@"将要减速");
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSLog(@"减速完成");
    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
    CGFloat xOffset = scrollView.contentOffset.x;
    _titleButton.selectIndex = xOffset/self.view.bounds.size.width;
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return _waterView;
}

- (void)navigationSet{
    //left button creat
    MMDrawerBarButtonItem *drawerBarButtonItem = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(toggleButtonClicked:)];
    self.navigationItem.leftBarButtonItem = drawerBarButtonItem;
    self.navigationItem.leftBarButtonItem.image = [[UIImage imageNamed:@"3rd_icon_qzone_hd_normal"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.leftBarButtonItem.style = UIBarButtonItemStylePlain;
    
    //title button creat
    self.view.backgroundColor = [UIColor blueColor];
    _titleButton = [[WEITitleView alloc]initWithFrame:CGRectMake(0, 0, 120, 44)];
    _titleButton.titleArray = @[@"番组",@"动态"];
    [_titleButton addTarget:self action:@selector(didTitleButtonClicked:) forControlEvents:UIControlEventValueChanged];
    self.navigationItem.titleView = _titleButton;
}

- (void)addWaterViewIn:(UIView *)superView{
    CGFloat tmpHeight = 10+100*sqrt(3);
    _waterView = [[WEIWaterView alloc]initWithFrame:CGRectMake(50, 200, 200, tmpHeight)];
    _waterView.backgroundColor = [UIColor clearColor];
    [superView addSubview:_waterView];
}

- (void)didTitleButtonClicked:(WEITitleView *)sender{
    NSLog(@"index:%lu",sender.selectIndex);
    [_scrollView setContentOffset:CGPointMake(sender.selectIndex*self.view.bounds.size.width, 0) animated:YES];
}

- (void)toggleButtonClicked:(UIBarButtonItem *)sender{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
