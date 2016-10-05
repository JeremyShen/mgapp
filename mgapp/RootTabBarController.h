//
//  RootTabBarController.h
//  mgapp
//
//  Created by 陆思 on 16/6/7.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootTabBarController : UITabBarController

@property (weak, nonatomic) IBOutlet UITabBar *rootTabBar;
- (void)makeTabBarHidden:(BOOL)hide;
@end
