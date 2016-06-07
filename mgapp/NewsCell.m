//
//  NewsCell.m
//  mgapp
//
//  Created by 陆思 on 16/6/7.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "NewsCell.h"

@implementation NewsCell


-(void)setData:(NSDictionary *)data{
    _imv.image=[UIImage imageNamed:data[@"pic"]];
    _imv.clipsToBounds = YES;
    _imv.contentMode = UIViewContentModeScaleAspectFill;
    _titleLabel.text=data[@"title"];
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
    _titleLabel.numberOfLines = 2;
    
    
}
@end
