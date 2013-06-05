//
//  FeedListViewController.m
//  RSSLast
//
//  Created by Maynard Tong on 6/5/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import "FeedListViewController.h"

@interface FeedListViewController ()

@end

@implementation FeedListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.t
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTableView:nil];
    [super viewDidUnload];
}
@end
