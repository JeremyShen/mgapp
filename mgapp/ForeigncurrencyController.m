//
//  ForeigncurrencyController.m
//  mgapp
//
//  Created by 陆思 on 16/6/17.
//  Copyright © 2016年 liyue. All rights reserved.
//

#import "ForeigncurrencyController.h"
#import "PNChart.h"
@implementation ForeigncurrencyController

-(void)viewDidLoad{
    NSArray *items = @[[PNPieChartDataItem dataItemWithValue:10 color:PNLightGreen description:@"卢布"],
                       [PNPieChartDataItem dataItemWithValue:20 color:PNFreshGreen description:@"美元"],
                       [PNPieChartDataItem dataItemWithValue:40 color:PNDeepGreen description:@"日元"],
                       ];
    
    self.pieChart = [[PNPieChart alloc] initWithFrame:CGRectMake(SCREEN_WIDTH /2.0 - 100, 100, 200.0, 200.0) items:items];
    self.pieChart.descriptionTextColor = [UIColor whiteColor];
    self.pieChart.descriptionTextFont  = [UIFont fontWithName:@"Avenir-Medium" size:11.0];
    self.pieChart.descriptionTextShadowColor = [UIColor clearColor];
    self.pieChart.showAbsoluteValues = NO;
    self.pieChart.showOnlyValues = NO;
    [self.pieChart strokeChart];
    
    
    self.pieChart.legendStyle = PNLegendItemStyleStacked;
    self.pieChart.legendFont = [UIFont boldSystemFontOfSize:12.0f];
    
    UIView *legend = [self.pieChart getLegendWithMaxWidth:200];
    [legend setFrame:CGRectMake(130, 350, legend.frame.size.width, legend.frame.size.height)];
    [self.view addSubview:legend];
    
    [self.view addSubview:self.pieChart];
}
@end

