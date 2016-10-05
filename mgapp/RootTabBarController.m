//
//  RootTabBarController.m
//  mgapp
//
//  Created by 陆思 on 16/6/7.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "RootTabBarController.h"

@implementation RootTabBarController

-(void)viewWillAppear:(BOOL)animated{
//    _rootTabBar.tintColor=[UIColor redColor];
//    _rootTabBar.barTintColor=[UIColor blackColor];
    UITabBarItem *item0 = [_rootTabBar.items objectAtIndex:0];
    UITabBarItem *item1 = [_rootTabBar.items objectAtIndex:1];
    UITabBarItem *item2 = [_rootTabBar.items objectAtIndex:2];
    UITabBarItem *item3 = [_rootTabBar.items objectAtIndex:3];
    // 对item设置相应地图片
//    item0.selectedImage = [[UIImage imageNamed:@"recognize-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
//    item0.image = [[UIImage imageNamed:@"待办"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
////    item1.selectedImage = [[UIImage imageNamed:@"life-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
//    item1.image = [[UIImage imageNamed:@"新闻"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
////    item2.selectedImage = [[UIImage imageNamed:@"edit-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
//    item2.image = [[UIImage imageNamed:@"监控"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//    
//    item3.image = [[UIImage imageNamed:@"更多"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    [item0 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];

    [item0 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromHex(0x1E90FF), NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    [item1 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    [item1 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromHex(0x1E90FF), NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    [item2 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    [item2 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromHex(0x1E90FF), NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    [item3 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor], NSForegroundColorAttributeName, nil] forState:UIControlStateNormal];
    
    [item3 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:UIColorFromHex(0x1E90FF), NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
 
    
}
-(void)viewDidLoad{
//    [self setSelectedIndex:3];
    }
- (void)makeTabBarHidden:(BOOL)hide {
    if ( [self.view.subviews count] < 2 )
        return;
    
    UIView *contentView;
    
    if ( [[self.view.subviews objectAtIndex:0] isKindOfClass:[UITabBar class]] )
        contentView = [self.view.subviews objectAtIndex:1];
    else
        contentView = [self.view.subviews objectAtIndex:0];
    
    if ( hide ){
        contentView.frame = self.view.bounds;
    }
    else{
        contentView.frame = CGRectMake(self.view.bounds.origin.x,
                                       self.view.bounds.origin.y,
                                       self.view.bounds.size.width,
                                       self.view.bounds.size.height - self.tabBar.frame.size.height);
    }
    
    self.rootTabBar.hidden=YES;
}
@end
