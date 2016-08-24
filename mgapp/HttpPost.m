//
//  HttpPost.m
//  mgapp
//
//  Created by 陆思 on 16/8/15.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "HttpPost.h"
#import "AFNetworking.h"
#import "XYString.h"
@implementation HttpPost

+(void)post:(NSString *)URLString
            parameters:(id)parameters
            success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success{

    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    NSDictionary *paramBase=@{@"token":@"11111",@"sourceId":@"00001",@"interfaceVersion":@"1.0",
                          @"equipUid":@"11111",@"equipTpye":@"00",@"osVersion":@"ios-9.0.1",
                          @"contentType":@"00",@"userUID":@"11111",@"location":@"11111"};
    
    NSMutableDictionary *params=[[NSMutableDictionary alloc] initWithDictionary:paramBase];
    [params addEntriesFromDictionary:parameters];
//    [params setObject:@"10" forKey:@"pageSize"];
//     [params setObject:@"1" forKey:@"pageIndex"];
    [manager POST:URLString parameters:params success:success failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"请求失败:%@",error);
        
    }];
    
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
//        //        //..下拉刷新
//        //        if (self.myRefreshView == _tv.header) {
//        ////            self.listArry = arrayM;
//        ////            _tv.footer.hidden = self.listArry.count==0?YES:NO;
//        //
//        //        }else if(self.myRefreshView == _tv.footer){
//        ////            [self.listArry addObjectsFromArray:arrayM];
//        //        }
//        
//        
//        //        [self doneWithView:self.myRefreshView];
//        
//        
//    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//        
//        NSLog(@"请求失败");
//        [_myRefreshView endRefreshing];
//    }];
}

@end
