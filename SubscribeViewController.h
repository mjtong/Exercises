//
//  SubscribeViewController.h
//  RSSLast
//
//  Created by Maynard Tong on 6/7/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SubscribeViewControllerDelegate;

@interface SubscribeViewController : UIViewController 
@property (nonatomic,weak) id<SubscribeViewControllerDelegate> delegate ;
@property (weak, nonatomic) IBOutlet UITableView *subscribeTable;
@end

@protocol SubscribeViewControllerDelegate <NSObject>

- (void)subscribeViewControllerDidFinish:(SubscribeViewController*)viewController;
- (void) subscribeViewControllerDone: (NSMutableArray *)listOfFeeds;
//- (void)childViewControllerDidFinish:(ChildViewController*)viewController;
@end