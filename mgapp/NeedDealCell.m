//
//  NeedDealCell.m
//  mgapp
//
//  Created by 陆思 on 16/6/6.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "NeedDealCell.h"

@implementation NeedDealCell



-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
      
    }
    return self;
}

-(void)setData:(NSDictionary *)data{
    _imv.image=[UIImage imageNamed:data[@"pic"]];
    _titleLable.text=data[@"title"];
    _applicantLable.text=data[@"applicant"];
    _contentLable.text=data[@"content"];
    _contentLable.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
    _contentLable.numberOfLines = 2;

    
}

@end
