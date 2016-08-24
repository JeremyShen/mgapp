//
//  NewsDetailController.h
//  mgapp
//
//  Created by 陆思 on 16/8/15.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ThreeModel.h"
@interface NewsDetailController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *titleL;

@property (weak, nonatomic) IBOutlet UITextView *content;
@property (nonatomic, weak) UIView *view1;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (nonatomic, weak) ThreeModel *model;
/**
 *  图片
 */
@property (strong, nonatomic) UIImageView *imgIcon;

@end
