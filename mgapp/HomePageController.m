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
#import "RootTabBarController.h"
@interface HomePageController ()<UITabBarControllerDelegate>

@end

@implementation HomePageController
{
    NSMutableArray* datas;
      RootTabBarController *tab;
}

-(void)viewDidAppear:(BOOL)animated{
    
    _scrollView.scrollEnabled=YES;
    [_scrollView setContentSize:CGSizeMake(0, 1100)];
  
}
- (void)viewDidLoad {
    tab=self.tabBarController;
    tab.delegate=self;
    [super viewDidLoad];
    _table.delegate=self;
    _table.dataSource=self;
    
    for (UIButton* b in _buttons) {
        b.layer.masksToBounds = YES; b.layer.cornerRadius=10;
    }
    NSString* hetong=@"合同是当事人或当事双方之间设立、变更、终止民事关系的协议。依法成立的合同，受法律保护。广义合同指所有法律部门中确定权利、义务关系的协议。狭义合同指一切民事合同。还有最狭义合同仅指民事合同中的债权合同。《中华人民共和国民法通则》第85条：合同是当事人之间设立、变更、终止民事关系的协议。依法成立的合同，受法律保护。《中华人民共和国合同法》第2条：合同是平等主体的自然人、法人、其他组织之间设立、变更、终止民事权利义务关系的协议。婚姻、收养、监护等有关身份关系的协议，适用其他法律的规定。";
    NSDictionary* data1=@{@"pic":@"news4.jpg",@"title":@"习近平曾寄语考生:考上可喜考不上不用悲观",@"applicant":@"申请人:陆思",@"content":hetong,@"date":@"12:30"};
    NSDictionary* data2=@{@"pic":@"news1.jpg",@"title":@"“港独”艺人何韵诗被兰蔻终止合作 要求“还公道”",@"applicant":@"申请人:李乐",@"content":hetong,@"date":@"12:30"};
    NSDictionary* data3=@{@"pic":@"news2.jpg",@"title":@"国际原子能机构：朝鲜似乎已重新开启炼钚厂",@"applicant":@"申请人:余叫兽",@"content":hetong,@"date":@"12:30"};
    NSDictionary* data4=@{@"pic":@"news3.jpg",@"title":@"男子“拼车”被骗1.6万 除自己外满车都是骗子",@"applicant":@"申请人:李拉裤",@"content":hetong,@"date":@"12:30"};
    datas=[NSMutableArray arrayWithObjects:data1,data2,data3,data4, nil];
    
//    UIScrollView *demoContainerView = [[UIScrollView alloc] initWithFrame:self.view.frame];
 
//    [_scrollView setBackgroundColor:[UIColor blueColor]];
//    [self.view addSubview:_scrollView];
    
//    self.title = @"轮播Demo";
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
    //         --- 轮播时间间隔，默认1.0秒，可自定义
    uiview.autoScrollTimeInterval = 3.0;
   
    
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
    return datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
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


- (IBAction)needDeal:(id)sender {
    [tab setSelectedIndex:2];
}

- (IBAction)newsA:(id)sender {
    [tab setSelectedIndex:1];
}

- (IBAction)checkA:(id)sender {
    [tab setSelectedIndex:3];
}

- (IBAction)monitorA:(id)sender {
    [tab setSelectedIndex:3];
}
@end
