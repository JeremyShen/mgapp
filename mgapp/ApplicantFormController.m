//
//  ApplicantFormController.m
//  mgapp
//
//  Created by 陆思 on 16/6/7.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "ApplicantFormController.h"
#import "DealDataModel.h"
#import "TextCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
@interface ApplicantFormController()
@property(nonatomic ,strong) UITableView *tv;

@property(nonatomic ,strong) NSMutableArray *listArry;

@end

@implementation ApplicantFormController

-(NSMutableArray *)listArry{
    
    if (!_listArry) {
        _listArry = [[NSMutableArray alloc] init];
    }
    return _listArry;
}
#pragma mark - getter
- (UITableView *)tv{
    
    /*
     本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
     */
    
    if (!_tv) {
        
        _tv = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tv.separatorColor = [UIColor clearColor];
        _tv.delegate = self;
        _tv.dataSource = self;
        _tv.backgroundColor = [UIColor clearColor];
        
    }
    return _tv;
}

-(void)viewDidLoad{
//    self.view.lee_theme.LeeConfigBackgroundColor(@"demovc10_backgroundcolor");
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    [self.view addSubview:self.tv];
    
    self.tv.sd_layout.spaceToSuperView(UIEdgeInsetsMake(200, 0, 0, 0));
    
    //定义一个toolBar
    UIToolbar * topView = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
    
    //设置style
    [topView setBarStyle:UIBarStyleDefault];
    
    //定义两个flexibleSpace的button，放在toolBar上，这样完成按钮就会在最右边
    UIBarButtonItem * button1 =[[UIBarButtonItem  alloc]initWithBarButtonSystemItem:                                        UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem * button2 = [[UIBarButtonItem  alloc]initWithBarButtonSystemItem:                                        UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    //定义完成按钮
    UIBarButtonItem * doneButton = [[UIBarButtonItem alloc]initWithTitle:@"完成" style:UIBarButtonItemStyleDone  target:self action:@selector(resignKeyboard)];
    
    //在toolBar上加上这些按钮
    NSArray * buttonsArray = [NSArray arrayWithObjects:button1,button2,doneButton,nil];
    [topView setItems:buttonsArray];
    
    [_text3 setInputAccessoryView:topView];
    
    
    _text3.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    _text3.layer.borderWidth = 0.6;
    
    _text3.layer.cornerRadius = 6.0f;
    
    [_text3.layer setMasksToBounds:YES];
    _text3.delegate=self;
    
    _content2.layer.borderWidth = 0.6;
    
    _content2.layer.cornerRadius = 6.0f;
    
    [_content2.layer setMasksToBounds:YES];
     _content2.layer.borderColor = [[UIColor colorWithRed:215.0 / 255.0 green:215.0 / 255.0 blue:215.0 / 255.0 alpha:1] CGColor];
    
    UIBarButtonItem* item= [[UIBarButtonItem alloc] initWithTitle:@"退出编辑" style:UIBarButtonItemStylePlain target:self action:@selector(back:)];
    item.tintColor=[UIColor whiteColor];
    self.navigationItem.leftBarButtonItem=item;
    
    UIBarButtonItem* item2= [[UIBarButtonItem alloc] initWithTitle:@"保存" style:UIBarButtonItemStylePlain target:self action:nil];
    item2.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=item2;
}

-(void)back:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)exit:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)exit2:(id)sender {
      [sender resignFirstResponder];
}

//隐藏键盘
- (void)resignKeyboard {
    [_text3 resignFirstResponder];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;//self.listArry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
     本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
     */
    TextCell * cell = nil;
    DealDataModel *data=self.listArry[indexPath.row];
    NSString* identifier=@"TextCell";
    cell =  [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[TextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.data = data;
    
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    
    cell.sd_tableView = tableView;
    cell.sd_indexPath = indexPath;
    
    ///////////////////////////////////////////////////////////////////////
    
    return cell;
    
}


@end
