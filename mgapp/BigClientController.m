//
//  BigClientController.m
//  mgapp
//
//  Created by 陆思 on 16/6/17.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "BigClientController.h"

@implementation BigClientController

-(void)viewDidLoad{
    self.table.delegate=self;
    self.table.dataSource=self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"bigclientCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle  reuseIdentifier:identifier];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
