//
//  NewsCell.m
//  mgapp
//
//  Created by 陆思 on 16/6/7.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
@implementation NewsCell


-(void)setData:(NewsModel *)data{
    // Here we use the new provided sd_setImageWithURL: method to load the web image
    [_imv setImageWithURL:[NSURL URLWithString:data.imgUrl] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _imv.clipsToBounds = YES;
    _imv.contentMode = UIViewContentModeScaleAspectFill;
    _titleLabel.text=data.title;
    _titleLabel.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
    _titleLabel.numberOfLines = 2;
    
    
}
@end
