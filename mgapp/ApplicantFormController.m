//
//  ApplicantFormController.m
//  mgapp
//
//  Created by 陆思 on 16/6/7.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "ApplicantFormController.h"

@implementation ApplicantFormController

-(void)viewDidLoad{
    
//    _content.layer.backgroundColor = [[UIColor groupTableViewBackgroundColor] CGColor];
    
    _content.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    
    _content.layer.borderWidth = 0.6;
    
    _content.layer.cornerRadius = 6.0f;
    
    [_content.layer setMasksToBounds:YES];
    
    UIBarButtonItem* item= [[UIBarButtonItem alloc] initWithTitle:@"退出编辑" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    item.tintColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=item;
    
    UIBarButtonItem* item2= [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:nil];
    item2.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=item2;
}

-(void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
