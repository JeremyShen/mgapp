//
//  NeedDealCell.h
//  mgapp
//
//  Created by 陆思 on 16/6/6.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NeedDealCell : UITableViewCell

@property (strong, nonatomic) NSDictionary *data;
@property (weak, nonatomic) IBOutlet UIImageView *imv;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UILabel *applicantLable;
@end
