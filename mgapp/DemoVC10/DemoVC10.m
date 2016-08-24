//
//  DemoVC10.m
//  SDAutoLayoutDemo
//
//  Created by gsd on 16/1/20.
//  Copyright © 2016年 gsd. All rights reserved.
//


/*
 本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
 */

#import "DemoVC10.h"

#import "UITableView+SDAutoTableViewCellHeight.h"
#import "AFNetworking.h"
#import "MJRefresh.h"
#import "MJExtension.h"
#import "XYString.h"

#import "ThreeBaseCell.h"
#import "ThreeFirstCell.h"
#import "ThreeSecondCell.h"
#import "ThreeThirdCell.h"
#import "ThreeFourthCell.h"
#import "HttpPost.h"
#import "YSLContainerViewController.h"
#import "NewsDetailController.h"
/*
 本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
 */

@interface DemoVC10 () <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic ,strong) UITableView *tv;
@property(nonatomic ,strong) NSMutableArray *listArry;

@property (nonatomic, assign) NSInteger page;
@property (nonatomic, strong) MJRefreshComponent *myRefreshView;

@end

@implementation DemoVC10

- (void)viewDidLoad {
    
    /*
     本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
     */
    
    [super viewDidLoad];
    
    /*
     本demo日夜间主题切换由SDAutoLayout库的使用者“LEE”提供，感谢“LEE”对本库的关注与支持！
     */
    
    //LEETheme 分为两种模式 , 独立设置模式 JSON设置模式 , 朋友圈demo展示的是独立设置模式的使用 , 微信聊天demo 展示的是JSON模式的使用
    
//    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"日间" style:UIBarButtonItemStyleDone target:self action:@selector(rightBarButtonItemAction:)];
//    
//    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
//    
//    rightBarButtonItem.lee_theme
//    .LeeAddCustomConfig(DAY , ^(UIBarButtonItem *item){
//        
//        item.title = @"夜间";
//        
//    }).LeeAddCustomConfig(NIGHT , ^(UIBarButtonItem *item){
//        
//        item.title = @"日间";
//    });

    
    self.view.lee_theme.LeeConfigBackgroundColor(@"demovc10_backgroundcolor");
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    
    [self.view addSubview:self.tv];
    
    self.tv.sd_layout.spaceToSuperView(UIEdgeInsetsMake(150, 0, 0, 0));
    
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.title = @"最新";
    
    UIViewController * vc2= [[UIViewController alloc] init];
    vc2.title = @"北京";
    
    UIViewController * vc3= [[UIViewController alloc] init];
    vc3.title = @"上海";
    
    UIViewController * vc4= [[UIViewController alloc] init];
    vc4.title = @"南京";
    
    UIViewController * vc5= [[UIViewController alloc] init];
    vc5.title = @"香港";
    
    // ContainerView
    float statusHeight = [[UIApplication sharedApplication] statusBarFrame].size.height;
    float navigationHeight = self.navigationController.navigationBar.frame.size.height;
    
    YSLContainerViewController *containerVC = [[YSLContainerViewController alloc]initWithControllers:@[vc1,vc2,vc3,vc4,vc5]
                                                                                        topBarHeight:statusHeight + navigationHeight+44               parentViewController:self];
    containerVC.delegate = self;
    containerVC.menuItemFont = [UIFont fontWithName:@"Futura-Medium" size:16];
    
    [self.view addSubview:containerVC.view];
    [self.view bringSubviewToFront:self.tv];
}

// 右栏目按钮点击事件

- (void)rightBarButtonItemAction:(UIBarButtonItem *)sender{
    
    if ([[LEETheme currentThemeTag] isEqualToString:DAY]) {
        
        [LEETheme startTheme:NIGHT];
        
    } else {
        
        [LEETheme startTheme:DAY];
        
    }
    
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

-(NSMutableArray *)listArry{
    
    if (!_listArry) {
        _listArry = [[NSMutableArray alloc] init];
    }
    return _listArry;
}

#pragma mark - 请求数据
-(void)loadData{
    NSString * urlString = @"http://182.92.129.168:8080/cyt/news/list";
    NSDictionary* params=@{@"pageSize":@"10",@"pageIndex":[NSString stringWithFormat:@"%ld",_page]};
    [HttpPost post:urlString parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *dict = [XYString getObjectFromJsonString:operation.responseString];
                //..keyEnumerator 获取字典里面所有键  objectEnumerator得到里面的对象  keyEnumerator得到里面的键值
//                NSString *key = [dict.keyEnumerator nextObject];//.取键值
                NSArray *temArray = dict[@"data"];
        
                // 数组>>model数组
                NSMutableArray *arrayM = [NSMutableArray arrayWithArray:[ThreeModel mj_objectArrayWithKeyValuesArray:temArray]];
        
                //..下拉刷新
                if (self.myRefreshView == _tv.header) {
                    self.listArry = arrayM;
                    _tv.footer.hidden = self.listArry.count==0?YES:NO;
        
                }else if(self.myRefreshView == _tv.footer){
                    [self.listArry addObjectsFromArray:arrayM];
                }
                
                
                [self doneWithView:self.myRefreshView];
    } ];
    /*
     本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
     */
//    NSString * urlString = [NSString stringWithFormat:@"http://c.m.163.com/nc/article/%@/%ld-20.html",@"headline/T1348647853363",self.page];
//    NSLog(@"______%@",urlString);
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    manager.requestSerializer = [AFJSONRequestSerializer serializer];
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
//    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//        
//        NSDictionary *dict = [XYString getObjectFromJsonString:operation.responseString];
//        //..keyEnumerator 获取字典里面所有键  objectEnumerator得到里面的对象  keyEnumerator得到里面的键值
//        NSString *key = [dict.keyEnumerator nextObject];//.取键值
//        NSArray *temArray = dict[key];
//        
//        // 数组>>model数组
//        NSMutableArray *arrayM = [NSMutableArray arrayWithArray:[ThreeModel mj_objectArrayWithKeyValuesArray:temArray]];
//        
//        //..下拉刷新
//        if (self.myRefreshView == _tv.header) {
//            self.listArry = arrayM;
//            _tv.footer.hidden = self.listArry.count==0?YES:NO;
//            
//        }else if(self.myRefreshView == _tv.footer){
//            [self.listArry addObjectsFromArray:arrayM];
//        }
//        
//        
//        [self doneWithView:self.myRefreshView];
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"请求失败");
//        [_myRefreshView endRefreshing];
//    }];
}

#pragma mark -  回调刷新
-(void)doneWithView:(MJRefreshComponent*)refreshView{
    [_tv reloadData];
    [_myRefreshView  endRefreshing];
}

#pragma mark - 表的协议方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.listArry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*
     本demo由SDAutoLayout库的使用者“李西亚”提供，感谢“李西亚”对本库的关注与支持！
     */
    ThreeBaseCell * cell = nil;
    ThreeModel * threeModel = self.listArry[indexPath.row];
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
    ThreeModel * threeModel = self.listArry[indexPath.row];
    
    NSString * identifier = [ThreeBaseCell cellIdentifierForRow:threeModel];
    Class mClass =  NSClassFromString(identifier);
    
    // 返回计算出的cell高度（普通简化版方法，同样只需一步设置即可完成）
    return [self.tv cellHeightForIndexPath:indexPath model:threeModel keyPath:@"threeModel" cellClass:mClass contentViewWidth:[self cellContentViewWith]];
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NewsDetailController *vc=[[UIStoryboard storyboardWithName:@"Main"bundle:nil] instantiateViewControllerWithIdentifier:@"NewsDetailController"];
//    vc.navigmationItem.title=@"审批单";
       ThreeModel * threeModel = self.listArry[indexPath.row];
    vc.model=threeModel;
    [self.navigationController pushViewController:vc animated:YES];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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
