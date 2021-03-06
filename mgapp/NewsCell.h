//
//  NewsCell.h
//  mgapp
//
//  Created by 陆思 on 16/6/7.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
#import "SDWebImage/UIImageView+WebCache.h"
@interface NewsCell : UITableViewCell
@property (strong, nonatomic) NewsModel *data;
@property (weak, nonatomic) IBOutlet UIImageView *imv;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
