//
//  DealModel.h
//  mgapp
//
//  Created by 陆思 on 16/9/23.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ThreeModel.h"
@interface DealModel : NSObject

@property (nonatomic,copy) NSString *bizCode;

@property (nonatomic,copy) NSString *bizName;

@property (nonatomic,copy) NSArray *data;

@property (nonatomic,copy) NSString *src;


@end
