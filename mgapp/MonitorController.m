//
//  MonitorController.m
//  mgapp
//
//  Created by 陆思 on 16/6/17.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "MonitorController.h"
#import "YSLContainerViewController.h"
@implementation MonitorController


-(void)viewDidLoad{
    // SetUp ViewControllers
    UIViewController *vc1 = [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"deposit"];
    vc1.title = @"存款前十大";
    
    UIViewController * vc2= [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"loan"];
    vc2.title = @"贷款前十大";
    
    UIViewController * vc3= [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"bigclient"];
    vc3.title = @"大客户资金";
    
    UIViewController * vc4= [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"billpool"];
    vc4.title = @"票据池";
    
    UIViewController * vc5= [[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"foreigncurrency"];
    vc5.title = @"外汇情况";
    
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[vc1,vc2,vc3,vc4,vc5]
                topBarHeight:statusHeight + navigationHeight               parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    [self.view addSubview:containerVC.view];

}

#pragma mark -- YSLContainerViewControllerDelegate
- (void)containerViewItemIndex:(NSInteger)index currentController:(UIViewController *)controller
{
    //    NSLog(@"current Index : %ld",(long)index);
    //    NSLog(@"current controller : %@",controller);
    [controller viewWillAppear:YES];
}

@end
