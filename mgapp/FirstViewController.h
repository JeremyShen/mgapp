//
//  FirstViewController.h
//  mgapp
//
//  Created by 陆思 on 16/6/6.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
@interface FirstViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,SlideNavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *table;

@property (weak, nonatomic) IBOutlet UINavigationBar *nvbar;
@end

