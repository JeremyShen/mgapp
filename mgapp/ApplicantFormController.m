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
    
    _content.layer.backgroundColor = [[UIColor clearColor] CGColor];
    
    _content.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    
    _content.layer.borderWidth = 0.6;
    
    _content.layer.cornerRadius = 6.0f;
    
    [_content.layer setMasksToBounds:YES];
}
@end
