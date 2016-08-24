//
//  NewsDetailController.m
//  mgapp
//
//  Created by 陆思 on 16/8/15.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "NewsDetailController.h"
#import "UIView+SDAutoLayout.h"
#import "UIImageView+WebCache.h"
@interface NewsDetailController ()

@end

@implementation NewsDetailController

- (float) heightForString:(UITextView *)textView andWidth:(float)width{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}

-(void)viewDidAppear:(BOOL)animated{
//    float height=  [self heightForString:self.content andWidth:self.content.frame.size.width];
//    
//    self.content.frame=CGRectMake(self.content.frame.origin.x, self.content.frame.origin.y
//                                  , self.content.frame.size.width, height);
    
//    _titleL.lineBreakMode = NSLineBreakByWordWrapping | NSLineBreakByTruncatingTail;
//    _titleL.numberOfLines = 2;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationItem.backBarButtonItem=[[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStyleBordered target:nil action:nil];
    UILabel *subview1 = [UILabel new]; // 初始化子view1
    subview1.text =_model.title;
    subview1.font = [UIFont boldSystemFontOfSize:30];
//    subview1.backgroundColor = [UIColor purpleColor];
    
//    UILabel *subview2 = [UILabel new]; // 初始化子view1
    _titleL.text =_model.content;
//    _titleL.font=[UIFont fontWithName:@"STHeitiJ-Light" size:18];
//    subview2.backgroundColor = [UIColor orangeColor];
    _imgIcon=[UIImageView new];
     [self.imgIcon sd_setImageWithURL:[NSURL URLWithString:_model.imgUrl] placeholderImage:[UIImage imageNamed:@"303"]];
   
    // 将子vie添加进父view
    [self.scrollView sd_addSubviews:@[subview1,_imgIcon, _titleL]];
    
    
    subview1.sd_layout
    .leftSpaceToView(self.scrollView, 10)
    .rightSpaceToView(self.scrollView, 10)
    .topSpaceToView(self.scrollView, 20)
   
    .autoHeightRatio(0); // 设置文本内容自适应，如果这里的参数为大于0的数值则会以此数值作为view的高宽比设置view的高度
    self.imgIcon.sd_layout
    .leftSpaceToView(self.scrollView,10)
    .topSpaceToView(subview1,10)
    .widthRatioToView(subview1, 1)
    .heightIs(SCREEN_HEIGHT/4);
    
    _titleL.sd_layout
    .topSpaceToView(_imgIcon, 10)
    .leftSpaceToView(self.scrollView, 10)
    .widthRatioToView(subview1, 1)
    .autoHeightRatio(0);
    
    
    // view1使用高度根据子view内容自适应，所以不需要设置高度，而是设置“[self.view1 setupAutoHeightWithBottomView:testView bottomMargin:10];”实现高度根据内容自适应
    self.scrollView.sd_layout
    .leftSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0);
    
    // 设置view1高度根据子其内容自适应
    [self.scrollView setupAutoHeightWithBottomView:_titleL bottomMargin:10];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
