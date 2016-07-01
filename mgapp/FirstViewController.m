//
//  FirstViewController.m
//  mgapp
//
//  Created by 陆思 on 16/6/6.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "FirstViewController.h"
#import "NeedDealCell.h"
#import "LeftMenuViewController.h"
@interface FirstViewController ()

@end

@implementation FirstViewController
{
    NSMutableArray* datas;
}
-(void)viewWillAppear:(BOOL)animated{
   
//   _nvbar.backgroundColor=UIColorFromHex(0x25b6ed);
    
}
- (void)viewDidLoad {
 
    UIImage *rightImage = [UIImage imageNamed:@"添加"];
    UIBarButtonItem* item= [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(add:)];
    item.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=item;
    
    UIStoryboard *board=[UIStoryboard storyboardWithName:@"Main"bundle:nil];
    LeftMenuViewController *leftMenu=[board instantiateViewControllerWithIdentifier:@"LeftMenuViewController"];
    //    RightMenuViewController *rightMenu = [[RightMenuViewController alloc] init];
    
    //    [SlideNavigationController sharedInstance].rightMenu = rightMenu;
    [SlideNavigationController sharedInstance].leftMenu = leftMenu;
    [SlideNavigationController sharedInstance].menuRevealAnimationDuration = .18;
    NSString* hetong=@"合同是当事人或当事双方之间设立、变更、终止民事关系的协议。依法成立的合同，受法律保护。广义合同指所有法律部门中确定权利、义务关系的协议。狭义合同指一切民事合同。还有最狭义合同仅指民事合同中的债权合同。《中华人民共和国民法通则》第85条：合同是当事人之间设立、变更、终止民事关系的协议。依法成立的合同，受法律保护。《中华人民共和国合同法》第2条：合同是平等主体的自然人、法人、其他组织之间设立、变更、终止民事权利义务关系的协议。婚姻、收养、监护等有关身份关系的协议，适用其他法律的规定。";
    NSDictionary* data1=@{@"pic":@"hetong",@"title":@"合同招标带审批",@"applicant":@"申请人:陆思",@"content":hetong,@"date":@"12:30"};
       NSDictionary* data2=@{@"pic":@"hetong2",@"title":@"服务器采购带审批",@"applicant":@"申请人:李乐",@"content":hetong,@"date":@"12:30"};
       NSDictionary* data3=@{@"pic":@"hetong3",@"title":@"定期存款带审批",@"applicant":@"申请人:陆余",@"content":hetong,@"date":@"12:30"};
       NSDictionary* data4=@{@"pic":@"hetong4",@"title":@"活期存款带审批",@"applicant":@"申请人:李乐",@"content":hetong,@"date":@"12:30"};
    datas=[NSMutableArray arrayWithObjects:data1,data2,data3,data4, nil];
    self.table.delegate=self;
    self.table.dataSource=self;
    [self.table setSeparatorInset:UIEdgeInsetsMake(0, SCREEN_WIDTH*0.26, 0, 0)];
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return datas.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"needDealCell";
    NeedDealCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[NeedDealCell alloc] initWithStyle: UITableViewCellStyleSubtitle  reuseIdentifier:identifier];
    }
    cell.data=datas[indexPath.row];
    return cell;
}
- (UIStatusBarStyle)preferredStatusBarStyle;{
    return UIStatusBarStyleLightContent;
}

- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
{
    return YES;
}

- (BOOL)slideNavigationControllerShouldDisplayRightMenu
{
    return NO;
}

-(void)add:(id)sender{
    FirstViewController *vc=[[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"form"];
    vc.navigationItem.title=@"申请单";
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstViewController *vc=[[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"form"];
    vc.navigationItem.title=@"审批单";
    [self.navigationController pushViewController:vc animated:YES];
}

@end
