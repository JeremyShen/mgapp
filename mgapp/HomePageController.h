//
//  HomePageController.h
//  mgapp
//
//  Created by 陆思 on 16/6/30.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "SlideNavigationController.h"
@interface HomePageController : UIViewController<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,SlideNavigationControllerDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
//@property (weak, nonatomic) IBOutlet SDCycleScrollView *uiview;
@property (weak, nonatomic) IBOutlet UITableView *table;


- (IBAction)needDeal:(id)sender;
- (IBAction)newsA:(id)sender;
- (IBAction)checkA:(id)sender;
- (IBAction)monitorA:(id)sender;

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;

@end
