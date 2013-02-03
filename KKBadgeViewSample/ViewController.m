//
//  ViewController.m
//  KKBadgeViewSample
//
//  Created by Kemal Kocabiyik on 2/3/13.
//  Copyright (c) 2013 Kemal Kocabiyik. All rights reserved.
//

#import "ViewController.h"
#import "KKBadgeView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    
    KKBadgeView *badgeView = [[KKBadgeView alloc] initWithFrame:CGRectMake(10, 10, 50, 100) andBadgeValue:@"15000023"];
    badgeView.gradientStartColor = [UIColor blueColor];
    badgeView.gradientEndColor = [UIColor blackColor];
    badgeView.isShadowHidden = NO;
    badgeView.textColor = [UIColor yellowColor];
    badgeView.textFont = [UIFont fontWithName:@"Helvetica-Bold" size:20];
    [self.view addSubview:badgeView];
    
    
    badgeView = [[KKBadgeView alloc] initWithFrame:CGRectMake(10, 70, 50, 100) andBadgeValue:@"2042"];
    badgeView.gradientStartColor = [UIColor redColor];
    badgeView.gradientEndColor = [UIColor blackColor];
    badgeView.isShadowHidden = NO;
    badgeView.textColor = [UIColor whiteColor];
    badgeView.textFont = [UIFont fontWithName:@"Helvetica-Bold" size:14];
    [self.view addSubview:badgeView];
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
