//
//  HttpPost.h
//  mgapp
//
//  Created by 陆思 on 16/8/15.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface HttpPost : NSObject

+(void)post:(NSString *)URLString
 parameters:(id)parameters
    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success;

@end
