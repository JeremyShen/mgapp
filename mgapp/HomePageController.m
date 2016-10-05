//
//  HomePageController.m
//  mgapp
//
//  Created by 陆思 on 16/6/30.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "HomePageController.h"
#import "SDCycleScrollView.h"
#import "NewsCell.h"
#import "BigClientCell.h"
#import "FirstViewController.h"
#import "HttpPost.h"
#import "RootTabBarController.h"
#import "XYString.h"
#import "UIView+SDAutoLayout.h"
#import "MJExtension.h"
#import "NewsDetailController.h"
#import "ThreeModel.h"  
#import "LeftMenuViewController.h"
@interface HomePageController ()<UITabBarControllerDelegate>

@end

@implementation HomePageController
{
    NSMutableArray* datas;
      RootTabBarController *tab;
    CGFloat contentHeight;
}

-(void)viewDidAppear:(BOOL)animated{
  
   
  
}

- (void)viewDidLayoutSubviews{

}

#pragma mark - 请求数据
-(void)loadData{
    
    NSString * urlString = @"http://182.92.129.168:8080/cyt/news/list";
    NSDictionary* params=@{@"pageSize":@"10",@"pageIndex":@"1"};
   
    [HttpPost post:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        NSDictionary *dict = [XYString getObjectFromJsonString:operation.responseString];
        NSArray *data=dict[@"data"];
        // 数组>>model数组
        datas = [NSMutableArray arrayWithArray:[NewsModel mj_objectArrayWithKeyValuesArray:data]];
        _table.delegate=self;
        _table.dataSource=self;
        [_table reloadData];
        _scrollView.scrollEnabled=YES;
//        self.scrollView.sd_layout
//        .leftSpaceToView(self.view, 0)
//        .topSpaceToView(self.view, 0)
//        .rightSpaceToView(self.view, 0);
//        
        // 设置view1高度根据子其内容自适应
//        [self.scrollView setupAutoHeightWithBottomView: bottomMargin:10];
    } ];
}


- (void)viewDidLoad {
      [super viewDidLoad];
    UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main"bundle:nil];
    LeftMenuViewController *leftMenu=[board instantiateViewControllerWithIdentifier:@"LeftMenuViewController"];
    [SlideNavigationController sharedInstance].leftMenu = leftMenu;
    [SlideNavigationController sharedInstance].menuRevealAnimationDuration = .38;
   
    
    tab=self.tabBarController;
    tab.delegate=self;
   
   
    
    for (UIButton* button in _buttons) {
        
//
        
        button.imageEdgeInsets = UIEdgeInsetsMake(-10,10,0,button.titleLabel.bounds.size.width);//设置image在button上的位置（上top，左left，下bottom，右right）这里可以写负值，对上写－5，那么image就象上移动5个像素
//
//        [button setTitle:@"首页" forState:UIControlStateNormal];//设置button的title
        button.titleLabel.font = [UIFont systemFontOfSize:13];//title字体大小
//        button.titleLabel.textAlignment = NSTextAlignmentCenter;//设置title的字体居中
//        [button setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];//设置title在一般情况下为白色字体
//        [button setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];//设置title在button被选中情况下为灰色字体
        button.titleLabel.textColor=[UIColor lightGrayColor];
        button.titleEdgeInsets = UIEdgeInsetsMake(80, -80, 0, 0);//设置title在button上的位置（上top，左left，下bottom，右right）
        
    }
    UIButton *button=_buttons[0];
    button.titleEdgeInsets = UIEdgeInsetsMake(80, -90, 0, 0);//设置title在button上的位置（上top，左left，下

    // 情景一：采用本地图片实现
    NSArray *imageNames = @[@"h1.jpg",
                            @"h2.jpg",
                            @"h3.jpg",
                            @"h4.jpg"
                            ];
    // >>>>>>>>>>>>>>>>>>>>>>>>> demo轮播图1 >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    
//    // 本地加载 --- 创建不带标题的图片轮播器
   SDCycleScrollView* uiview = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, -64, SCREEN_WIDTH+5, 200) shouldInfiniteLoop:YES imageNamesGroup:imageNames];
    uiview.delegate = self;
    uiview.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
    [_scrollView addSubview:uiview];
    uiview.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    uiview.titlesGroup=[NSArray arrayWithObjects:@"余彭年告深圳地铁",@"打母男子被释放",@"高考658被打出走",@"刘亦菲甜笑引尖叫", nil] ;
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    uiview.autoScrollTimeInterval = 3.0;
    contentHeight+=400;
    [self loadData];
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return @"新闻";
    }
    else{
        return @"贷款前十大";
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    contentHeight+=_table.rowHeight;
    [_scrollView setContentSize:CGSizeMake(0, contentHeight)];
    if (indexPath.section==0) {
        static NSString *identifier = @"newsCell";
        NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (cell == nil) {
            cell = [[NewsCell alloc] initWithStyle: UITableViewCellStyleSubtitle  reuseIdentifier:identifier];
        }
        cell.data=datas[indexPath.row];
        
        return cell;
    }else{
        static NSString *identifier = @"bigclientCell";
        BigClientCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
         UINib *n;
        if (cell == nil) {
            NSArray *_nib=[[NSBundle mainBundle] loadNibNamed:@"BigClientCell"
                                                        owner:self  options:nil];
            cell  = [_nib objectAtIndex:0];
            //通过这段代码，来完成LableSwitchXibCell的ReuseIdentifier的设置
            //这里是比较容易忽视的，若没有此段，再次载入LableSwitchXibCell时，dequeueReusableCellWithIdentifier:的值依然为nil
            n= [UINib nibWithNibName:@"BigClientCell" bundle:[NSBundle mainBundle]];
            [_table registerNib:n forCellReuseIdentifier:@"bigclientCell"];
            
        }
        _table.rowHeight=90;
     
        
//        cell.textLabel.text=@"xxxxx";
        return cell;
    }
 
}
//  [tab setSelectedIndex:3];

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsDetailController *vc=[[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"NewsDetailController"];
    //    vc.navigmationItem.title=@"审批单";
    ThreeModel * threeModel = datas[indexPath.row];
    vc.model=threeModel;
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (IBAction)needDeal:(id)sender {
    [tab setSelectedIndex:2];
}

- (IBAction)newsA:(id)sender {
    [tab setSelectedIndex:1];
}

- (IBAction)checkA:(id)sender {
    [tab setSelectedIndex:1];
}

- (IBAction)monitorA:(id)sender {
    [tab setSelectedIndex:3];
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}
@end
