//
//  MenuViewController.m
//  SlideMenu
//
//  Created by Aryan Gh on 4/24/13.
//  Copyright (c) 2013 Aryan Ghassemi. All rights reserved.
//

#import "LeftMenuViewController.h"
#import "SlideNavigationContorllerAnimatorFade.h"
#import "SlideNavigationContorllerAnimatorSlide.h"
#import "SlideNavigationContorllerAnimatorScale.h"
#import "SlideNavigationContorllerAnimatorScaleAndFade.h"
#import "SlideNavigationContorllerAnimatorSlideAndFade.h"
#import "FSMediaPicker.h"

@implementation LeftMenuViewController

#pragma mark - UIViewController Methods -

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self.slideOutAnimationEnabled = YES;
	
	return [super initWithCoder:aDecoder];
}

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	self.tableView1.separatorColor = [UIColor lightGrayColor];
    self.tableView1.delegate=self;
    self.tableView1.dataSource=self;
    self.head.layer.masksToBounds=YES;
    [self.head setUserInteractionEnabled:YES];
    self.head.layer.cornerRadius= self.head.frame.size.width/2;
    UITapGestureRecognizer *labelTapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(showClicked:)];
    [self.head addGestureRecognizer:labelTapGestureRecognizer];
//	UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.jpg"]];

}

#pragma mark - UITableView Delegate & Datasrouce -

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return 4;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
	UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView1.frame.size.width, 20)];
	view.backgroundColor = [UIColor clearColor];
	return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
	return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"leftMenuCell"];
	
	switch (indexPath.row)
	{
		case 0:
			cell.textLabel.text = @"个人信息";
			break;
			
		case 1:
			cell.textLabel.text = @"资产情况";
			break;
			
		case 2:
			cell.textLabel.text = @"债务情况";
			break;
			
		case 3:
			cell.textLabel.text = @"信用评价";
			break;
	}
	
	cell.backgroundColor = [UIColor clearColor];
	
	return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//	UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"MainStoryboard_iPhone"
//															 bundle: nil];
//	
//	UIViewController *vc ;
//	
	switch (indexPath.row)
	{
		case 0:
			
            break;
			
		case 1:
			
			break;
			
		case 2:
			
			break;
			
		case 3:
			
			return;
			break;
	}
//
//	[[SlideNavigationController sharedInstance] popToRootAndSwitchToViewController:vc
//															 withSlideOutAnimation:self.slideOutAnimationEnabled
//																	 andCompletion:nil];
}
- (void)showClicked:(id)sender
{
    FSMediaPicker *mediaPicker = [[FSMediaPicker alloc] init];
    mediaPicker.mediaType = 0;
    mediaPicker.editMode = 0;
    mediaPicker.delegate = self;
    [mediaPicker showFromView:self.view];
}
- (void)mediaPicker:(FSMediaPicker *)mediaPicker didFinishWithMediaInfo:(NSDictionary *)mediaInfo
{
    //    if (mediaInfo.mediaType == FSMediaTypeVideo) {
    //        self.player.contentURL = mediaInfo.mediaURL;
    //        [self.player play];
    //    } else {
    //        [self.headView setTitle:nil ];
    if (mediaPicker.editMode == FSEditModeNone) {
        [self.head setImage:mediaInfo.originalImage ];
    } else {
        [self.head setImage:mediaPicker.editMode == FSEditModeCircular? mediaInfo.circularEditedImage:mediaInfo.editedImage];
    }
    //    }
}

- (void)mediaPickerDidCancel:(FSMediaPicker *)mediaPicker
{
    NSLog(@"%s",__FUNCTION__);
}


@end
