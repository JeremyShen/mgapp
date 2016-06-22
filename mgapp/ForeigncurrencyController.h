//
//  ForeigncurrencyController.h
//  mgapp
//
//  Created by 陆思 on 16/6/17.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChart.h"
#import "PNChartDelegate.h"
@interface ForeigncurrencyController : UIViewController<PNChartDelegate>

@property (nonatomic) PNPieChart *pieChart;

@end
