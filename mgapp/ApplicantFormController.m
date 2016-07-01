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
    
//    _content.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
//    
//    _content.layer.borderWidth = 0.6;
//    
//    _content.layer.cornerRadius = 6.0f;
//    
//    [_content.layer setMasksToBounds:YES];
//    
//      _text2.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
//    _text2.layer.borderWidth = 0.6;
//    
//    _text2.layer.cornerRadius = 6.0f;
//    
//    [_text2.layer setMasksToBounds:YES];
    
    
    _text3.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    _text3.layer.borderWidth = 0.6;
    
    _text3.layer.cornerRadius = 6.0f;
    
    [_text3.layer setMasksToBounds:YES];
    _text3.delegate=self;
    
    _content2.layer.borderWidth = 0.6;
    
    _content2.layer.cornerRadius = 6.0f;
    
    [_content2.layer setMasksToBounds:YES];
     _content2.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    
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
- (IBAction)exit:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)exit2:(id)sender {
      [sender resignFirstResponder];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    return YES;
}
@end
