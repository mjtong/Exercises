//
//  FeedListViewController.h
//  RSSLast
//
//  Created by Maynard Tong on 6/6/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SubscribeViewController.h"
@interface FeedListViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, UIAlertViewDelegate, SubscribeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *feedlisttable;

@end
