//
//  FullStoryViewController.m
//  RSSLast
//
//  Created by Maynard Tong on 6/6/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import "FullStoryViewController.h"
#import "MBProgressHUD.h"
@interface FullStoryViewController ()

@end

@implementation FullStoryViewController

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
    NSURL *link = [[NSURL alloc]initWithString:_url];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:link];
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:_webView animated:YES];
    hud.labelText = @"Loading";
    [_webView loadRequest:request];
        
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setWebView:nil];
    [super viewDidUnload];
}
-(void) webViewDidFinishLoad:(UIWebView *)webView{
     [MBProgressHUD hideHUDForView:_webView animated:YES];
}
@end
