//
//  FullStoryViewController.h
//  RSSLast
//
//  Created by Maynard Tong on 6/6/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface FullStoryViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong,nonatomic) NSString *url;
@end
