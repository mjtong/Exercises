//
//  ViewController.h
//  RSSProgram
//
//  Created by Maynard Tong on 6/3/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (strong,nonatomic) NSArray *items;
@property (strong, nonatomic) NSMutableDictionary *feedInfo;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@end
