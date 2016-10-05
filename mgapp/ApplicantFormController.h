//
//  ApplicantFormController.h
//  mgapp
//
//  Created by 陆思 on 16/6/7.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ApplicantFormController : UIViewController<UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (weak, nonatomic) IBOutlet UITextField *date;
@property (weak, nonatomic) IBOutlet UITextView *text2;
@property (weak, nonatomic) IBOutlet UITextView *text3;
- (IBAction)exit:(id)sender;
- (IBAction)exit2:(id)sender;

@property (weak, nonatomic) IBOutlet UITextView *content2;

@property (strong, nonatomic)  NSArray *data;
@end
