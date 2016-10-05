//
//  NeedDealCell.h
//  mgapp
//
//  Created by 陆思 on 16/6/6.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DealModel.h"
#import "ThreeFirstCell.h"
#import "ThreeModel.h"
#import "SDWebImage/UIImageView+WebCache.h"
@interface NeedDealCell : ThreeBaseCell

@property (weak, nonatomic) IBOutlet UIImageView *imv;

@property (weak, nonatomic) IBOutlet UILabel *titleLable;
@property (weak, nonatomic) IBOutlet UILabel *contentLable;
@property (weak, nonatomic) IBOutlet UILabel *applicantLable;
@end
