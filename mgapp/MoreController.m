//
//  MoreController.m
//  mgapp
//
//  Created by 陆思 on 16/6/12.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "MoreController.h"

@implementation MoreController
{
//    NSMutableArray *datas;
    NSDictionary *sec;
}
-(void)viewDidLoad{
    NSMutableArray *datas1=[NSMutableArray arrayWithObjects:@"账号与安全",nil];
    NSMutableArray *datas2=[NSMutableArray arrayWithObjects:@"新消息通知",@"隐私",@"通用",nil];
     NSMutableArray *datas3=[NSMutableArray arrayWithObjects:@"联系我们",nil];
    NSMutableArray *datas4=[NSMutableArray arrayWithObjects:@"退出登录",nil];
    sec=@{@"0":datas1,@"1":datas2,@"2":datas3,@"3":datas4};
    self.table.delegate=self;
    self.table.dataSource=self;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSMutableArray* datarow=sec[[NSString stringWithFormat:@"%ld",section]];
    return datarow.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"moreCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle  reuseIdentifier:identifier];
    }
     NSMutableArray* datarow=sec[[NSString stringWithFormat:@"%ld",indexPath.section]];
    cell.textLabel.text=datarow[indexPath.row];
    if (indexPath.section==0) {
        cell.detailTextLabel.text=@"已保护";
    }else
        cell.detailTextLabel.text=@"";
    if (indexPath.section==3) {
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
    }
    return cell;
}
@end
