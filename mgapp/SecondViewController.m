//
//  SecondViewController.m
//  mgapp
//
//  Created by 陆思 on 16/6/6.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "SecondViewController.h"
#import "NewsCell.h"
#import "YSLContainerViewController.h"
#import "AFNetworking.h"
#import "XYString.h"
#import "MJExtension.h"
#import "MJRefresh.h"
#import "ThreeModel.h"
#import "HttpPost.h"
#import "NewsModel.h"
@interface SecondViewController ()
@property (nonatomic, strong) MJRefreshComponent *myRefreshView;
@end

@implementation SecondViewController


{
    NSMutableArray* datas;
    
}
-(void)viewWillAppear:(BOOL)animated{
    
}

#pragma mark - 请求数据
-(void)loadData{
//    NSString * urlString = @"http://182.92.129.168:8080/cyt/news/list";
    NSDictionary* params=@{@"pageSize":@"10",@"pageIndex":@"1"};
    [HttpPost post:NEWS_LIST parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [XYString getObjectFromJsonString:operation.responseString];
        NSArray *data=dict[@"data"];
        // 数组>>model数组
        datas = [NSMutableArray arrayWithArray:[NewsModel mj_objectArrayWithKeyValuesArray:data]];
        //
        self.table.delegate=self;
        self.table.dataSource=self;
        [self.table setSeparatorInset:UIEdgeInsetsMake(0, SCREEN_WIDTH*0.4, 0, 0)];
    } ];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    self.navigationController.navigationBar.barTintColor=UIColorFromHex(0x25b6ed);
//    
//    NSString* hetong=@"合同是当事人或当事双方之间设立、变更、终止民事关系的协议。依法成立的合同，受法律保护。广义合同指所有法律部门中确定权利、义务关系的协议。狭义合同指一切民事合同。还有最狭义合同仅指民事合同中的债权合同。《中华人民共和国民法通则》第85条：合同是当事人之间设立、变更、终止民事关系的协议。依法成立的合同，受法律保护。《中华人民共和国合同法》第2条：合同是平等主体的自然人、法人、其他组织之间设立、变更、终止民事权利义务关系的协议。婚姻、收养、监护等有关身份关系的协议，适用其他法律的规定。";
//    NSDictionary* data1=@{@"pic":@"news4.jpg",@"title":@"习近平曾寄语考生:考上可喜考不上不用悲观",@"applicant":@"申请人:陆思",@"content":hetong,@"date":@"12:30"};
//    NSDictionary* data2=@{@"pic":@"news1.jpg",@"title":@"“港独”艺人何韵诗被兰蔻终止合作 要求“还公道”",@"applicant":@"申请人:李乐",@"content":hetong,@"date":@"12:30"};
//    NSDictionary* data3=@{@"pic":@"news2.jpg",@"title":@"国际原子能机构：朝鲜似乎已重新开启炼钚厂",@"applicant":@"申请人:余叫兽",@"content":hetong,@"date":@"12:30"};
//    NSDictionary* data4=@{@"pic":@"news3.jpg",@"title":@"男子“拼车”被骗1.6万 除自己外满车都是骗子",@"applicant":@"申请人:李拉裤",@"content":hetong,@"date":@"12:30"};
//    datas=[NSMutableArray arrayWithObjects:data1,data2,data3,data4, nil];
//    self.table.delegate=self;
//    self.table.dataSource=self;
//    [self.table setSeparatorInset:UIEdgeInsetsMake(0, SCREEN_WIDTH*0.4, 0, 0)];
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.title = @"最新";
    
    UIViewController * vc2= [[UIViewController alloc] init];
    vc2.title = @"北京";
    
    UIViewController * vc3= [[UIViewController alloc] init];
    vc3.title = @"上海";
    
    UIViewController * vc4= [[UIViewController alloc] init];
    vc4.title = @"南京";
    
    UIViewController * vc5= [[UIViewController alloc] init];
    vc5.title = @"香港";
    
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[vc1,vc2,vc3,vc4,vc5]
                                                                                        topBarHeight:statusHeight + navigationHeight+44               parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    [self.view addSubview:containerVC.view];
    [self.view bringSubviewToFront:self.table];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"newsCell";
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[NewsCell alloc] initWithStyle: UITableViewCellStyleSubtitle  reuseIdentifier:identifier];
    }
    cell.data=datas[indexPath.row];
    return cell;
}

#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
    //    NSLog(@"current Index : %ld",(long)index);
    //    NSLog(@"current controller : %@",controller);
    [controller viewWillAppear:YES];
}

@end
