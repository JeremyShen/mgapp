//
//  BigClientChartController.h
//  mgapp
//
//  Created by 陆思 on 16/6/17.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PNChart.h"
#import "PNChartDelegate.h"
@interface BigClientChartController : UIViewController<PNChartDelegate>

@property (nonatomic) PNBarChart * barChart;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (nonatomic) PNLineChart * lineChart;
@end
