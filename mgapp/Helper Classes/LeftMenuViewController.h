//
//  MenuViewController.h
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SlideNavigationController.h"
#import "FSMediaPicker.h"
@interface LeftMenuViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,FSMediaPickerDelegate>

@property (nonatomic, strong) IBOutlet UITableView *tableView1;
@property (nonatomic, assign) BOOL slideOutAnimationEnabled;
//@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIImageView *head;
@end
