//
//  BillPoolController.h
//  mgapp
//
//  Created by 陆思 on 16/6/17.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillPoolController : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *table;
@end
