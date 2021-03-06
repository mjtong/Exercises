//
//  ItemViewController.m
//  RSSLast
//
//  Created by Maynard Tong on 6/6/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import "ItemViewController.h"
#import "FullStoryViewController.h"
@interface ItemViewController ()
@end

@implementation ItemViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title= @"Item View";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *fullStory = [[UIBarButtonItem alloc] initWithTitle:@"Full Story" style:UIBarButtonItemStylePlain target:self action:@selector(viewFullStory:)];
  //  UIBarButtonItem *gotoLink = [[UIBarButtonItem alloc] initWithTitle:@"Visit Link" style:UIBarButtonItemStylePlain target:self action:@selector(gotoLink:)];
    self.navigationItem.rightBarButtonItem = fullStory;
   // [self.navigationItem.
    NSRange r;
    NSString *s = [_feeditem objectForKey:@"description"];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    _header.text = [_feeditem objectForKey:@"title"];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"EEE, d MMM yyyy HH:mm:ss z"];
    NSString *dateString = [formatter stringFromDate:[_feeditem objectForKey:@"pubDate"]];
    _date.text = dateString;
    _content.text = s;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTitle:nil];
    [self setDate:nil];
    [self setContent:nil];
    [self setContent:nil];
    [super viewDidUnload];
}

-(void) viewFullStory : (id)sender{
    FullStoryViewController *fullStoryViewController = [[FullStoryViewController alloc]initWithNibName:@"FullStoryViewController" bundle:nil];
    fullStoryViewController.url = [_feeditem objectForKey:@"link"];
    [self.navigationController pushViewController:fullStoryViewController animated:YES];
}
-(void) gotoLink : (id)sender{
    NSString *url = [_feeditem objectForKey:@"link"];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
}
@end
