//
//  NeedDealCell.m
//  mgapp
//
//  Created by 陆思 on 16/6/6.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "NeedDealCell.h"
#import "DealModel.h"
#import "UIImageView+UIActivityIndicatorForSDWebImage.h"
@implementation NeedDealCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self setup];
    }
    return self;
}

-(void)setup{
    
    
    // 设置约束
    CGFloat margin = 10;
    
    self.imgIcon.sd_layout
    .leftSpaceToView(self.contentView,margin)
    .topSpaceToView(self.contentView,margin)
    .widthIs(120)
    .heightIs(95);
    
    self.lblTitle.sd_layout
    .leftSpaceToView(self.imgIcon ,margin)
    .topSpaceToView(self.contentView,margin)
    .rightSpaceToView(self.contentView,margin)
    .autoHeightRatio(0);
    self.lblTitle.numberOfLines = 0;
    
    self.lblSubtitle.sd_layout
    .topSpaceToView(self.lblTitle,margin)
    .leftSpaceToView(self.imgIcon,margin)
    .rightSpaceToView(self.contentView,margin)
    .autoHeightRatio(0.3);
    
    self.lineView.sd_layout
    .bottomEqualToView(self.contentView)
    .rightSpaceToView(self.contentView,0)
    .leftSpaceToView(self.contentView,0)
    .heightIs(0.5f);
    
    [self setupAutoHeightWithBottomViewsArray:@[self.lblSubtitle, self.imgIcon] bottomMargin:(margin + 1)];
}


-(void)setThreeModel:(ThreeModel *)threeModel{
    DealModel *data=(DealModel*)threeModel;
    [self.imgIcon setImageWithURL:[NSURL URLWithString:data.src] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    self.lblTitle.text=data.bizName;
    self.lblSubtitle.text=@"没有业务内容 ";
    
    
}



@end
