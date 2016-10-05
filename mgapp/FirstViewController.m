//
//  FirstViewController.m
//  mgapp
//
//  Created by 陆思 on 16/6/6.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "FirstViewController.h"
#import "NeedDealCell.h"

#import "UITableView+SDAutoTableViewCellHeight.h"
#import "AFNetworking.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "XYString.h"
#import "ApplicantFormController.h"
#import "ThreeBaseCell.h"
#import "ThreeFirstCell.h"
#import "ThreeSecondCell.h"
#import "ThreeThirdCell.h"
#import "ThreeFourthCell.h"
#import "HttpPost.h"

#import "DealDataModel.h"
@interface FirstViewController ()<UISearchBarDelegate>
@property(nonatomic ,strong) UITableView *tv;

@property(nonatomic ,strong) NSMutableArray *listArry;

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) MJRefreshComponent *myRefreshView;
@end

@implementation FirstViewController

-(void)viewWillAppear:(BOOL)animated{
   
//   _nvbar.backgroundColor=UIColorFromHex(0x25b6ed);
    
}

-(NSMutableArray *)listArry{
    
    if (!_listArry) {
        _listArry = [[NSMutableArray alloc] init];
    }
    return _listArry;
}
#pragma mark -  回调刷新
-(void)doneWithView:(MJRefreshComponent*)refreshView{
    [_tv reloadData];
    [_myRefreshView  endRefreshing];
}


#pragma mark - 请求数据
-(void)loadData{
    NSDictionary* params=@{@"pageSize":@"10",@"pageIndex":[NSString stringWithFormat:@"%ld",_page]};
    [HttpPost post:BIZ parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [XYString getObjectFromJsonString:operation.responseString];
        //..keyEnumerator 获取字典里面所有键  objectEnumerator得到里面的对象  keyEnumerator得到里面的键值
        //                NSString *key = [dict.keyEnumerator nextObject];//.取键值
        NSArray *temArray = dict[@"data"];
        
        // 数组>>model数组
        NSMutableArray *arrayM = [NSMutableArray arrayWithArray:[DealModel mj_objectArrayWithKeyValuesArray:temArray]];
        
        //..下拉刷新
        if (self.myRefreshView == _tv.header) {
            self.listArry = arrayM;
            _tv.footer.hidden = self.listArry.count==0?YES:NO;
            
        }else if(self.myRefreshView == _tv.footer){
            [self.listArry addObjectsFromArray:arrayM];
        }
        
        
        [self doneWithView:self.myRefreshView];
    } ];
   
}


- (void)viewDidLoad {
      [super viewDidLoad];
    self.view.lee_theme.LeeConfigBackgroundColor(@"demovc10_backgroundcolor");
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    [self.view addSubview:self.tv];
    
    self.tv.sd_layout.spaceToSuperView(UIEdgeInsetsMake(40, 0, 0, 0));
    
    [self loadData];
    _search.delegate=self;
    UIImage *rightImage = [UIImage imageNamed:@"添加"];
    UIBarButtonItem* item= [[UIBarButtonItem alloc] initWithImage:rightImage style:UIBarButtonItemStylePlain target:self action:@selector(add:)];
    item.tintColor=[UIColor whiteColor];
    self.navigationItem.rightBarButtonItem=item;
    
    
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
        
        
        __weak typeof(self) weakSelf = self;
        
        //..下拉刷新
        _tv.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            weakSelf.myRefreshView = weakSelf.tv.header;
            weakSelf.page = 0;
            [weakSelf loadData];
        }];
        
        // 马上进入刷新状态
        [_tv.header beginRefreshing];
        
        //..上拉刷新
        _tv.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
            weakSelf.myRefreshView = weakSelf.tv.footer;
            weakSelf.page = weakSelf.page + 1;
            [weakSelf loadData];
        }];
        
        _tv.footer.hidden = YES;
        
        
    }
    return _tv;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (UIStatusBarStyle)preferredStatusBarStyle;{
    return UIStatusBarStyleLightContent;
}
//
//- (BOOL)slideNavigationControllerShouldDisplayLeftMenu
//{
//    return YES;
//}
//
//- (BOOL)slideNavigationControllerShouldDisplayRightMenu
//{
//    return NO;
//}

-(void)add:(id)sender{
    FirstViewController *vc=[[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"form"];
    vc.navigationItem.title=@"申请单";
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    FirstViewController *vc=[[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"form"];
    vc.navigationItem.title=@"审批单";
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)hsearchBar
{
    _search.showsCancelButton = YES;
    for(id cc in [_search subviews])
    {
        if([cc isKindOfClass:[UIButton class]])
        {
            UIButton *btn = (UIButton *)cc;
            [btn setTitle:@"取消" forState:UIControlStateNormal];
        }
    }
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar __TVOS_PROHIBITED{

    [_search resignFirstResponder];
        _search.showsCancelButton = NO;
}   // called when cancel button pressed


#pragma mark - 表的协议方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.listArry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
     本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
     */
    ThreeBaseCell * cell = nil;
    DealModel *dealmodel=self.listArry[indexPath.row];
    ThreeModel * threeModel = [[ThreeModel alloc] init];
    threeModel.title=dealmodel.bizName;
    threeModel.content=@"没有内容给出没有内容给出没有内容给出没有内容给出没有内容给出";
    threeModel.imgUrl=dealmodel.src;
    //    threeModel.hasHead=[[NSNumber alloc] initWithInt:1];
    NSString * identifier = [ThreeBaseCell cellIdentifierForRow:threeModel];
    Class mClass =  NSClassFromString(identifier);
    
    cell =  [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[mClass alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.threeModel = threeModel;
    
    ////// 此步设置用于实现cell的frame缓存，可以让tableview滑动更加流畅 //////
    
    cell.sd_tableView = tableView;
    cell.sd_indexPath = indexPath;
    
    ///////////////////////////////////////////////////////////////////////
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // cell自适应设置
//    ThreeModel * threeModel = self.listArry[indexPath.row];
    DealModel *dealmodel=self.listArry[indexPath.row];
    ThreeModel * threeModel = [[ThreeModel alloc] init];
    threeModel.title=dealmodel.bizName;
    threeModel.subtitle=@"没有内容给出没有内容给出没有内容给出没有内容给出没有内容给出";
    threeModel.imgUrl=dealmodel.src;
    NSString * identifier = [ThreeBaseCell cellIdentifierForRow:threeModel];
    Class mClass =  NSClassFromString(identifier);
    
    // 返回计算出的cell高度（普通简化版方法，同样只需一步设置即可完成）
    return [self.tv cellHeightForIndexPath:indexPath model:threeModel keyPath:@"threeModel" cellClass:mClass contentViewWidth:[self cellContentViewWith]];
    
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    ApplicantFormController *vc=[[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"form"];
//    //    vc.navigmationItem.title=@"审批单";
//    
//    vc.model=threeModel;
//    [self.navigationController pushViewController:vc animated:YES];
//    
//}
//
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}


- (CGFloat)cellContentViewWith
{
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    // 适配ios7横屏
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = [UIScreen mainScreen].bounds.size.height;
    }
    return width;
}


@end
