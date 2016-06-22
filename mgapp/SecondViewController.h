//
//  SecondViewController.h
//  mgapp
//
//  Created by 陆思 on 16/6/6.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITabBarItem *barItem;
@property (weak, nonatomic) IBOutlet UITableView *table;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *btns;
@end

