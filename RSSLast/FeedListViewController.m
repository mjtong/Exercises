//
//  FeedListViewController.m
//  RSSLast
//
//  Created by Maynard Tong on 6/6/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import "ViewController.h"
#import "FeedListViewController.h"

@interface FeedListViewController (){
    NSMutableArray* feedlist;
    }
@end

@implementation FeedListViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    self.title = @"Feed List";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIBarButtonItem *subscribeButton = [[UIBarButtonItem alloc] initWithTitle:@"Subscribe" style:UIBarButtonItemStylePlain target:self action:@selector(subscribeToFeed:)];
    self.navigationItem.rightBarButtonItem = subscribeButton;
    NSMutableDictionary *feed1 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://news.yahoo.com/rss/entertainment",@"url",@"Yahoo Entertainment",@"title", nil];
     NSMutableDictionary *feed2 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://news.yahoo.com/rss/sports",@"url",@"Yahoo Sports",@"title", nil];
     NSMutableDictionary *feed3 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://rss.news.yahoo.com/rss/mostviewed",@"url",@"Yahoo News",@"title", nil];
    NSMutableArray *staticFeeds = [NSMutableArray arrayWithObjects:feed1,feed2,feed3, nil];
    feedlist = [[NSMutableArray alloc] initWithArray:staticFeeds];
    NSLog(@"%d",[feedlist count]);

    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setFeedlisttable:nil];
    [super viewDidUnload];
}

-(void)subscribeToFeed : (id) sender{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"RSS Feed" message:@"\n\n\n" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok", nil];
    UITextField *title = [[UITextField alloc] init];
    [title setBackgroundColor:[UIColor whiteColor]];
    title.borderStyle = UITextBorderStyleLine;
    title.frame = CGRectMake(15, 45, 255, 30);
    title.font = [UIFont fontWithName:@"ArialMT" size:20];
    title.placeholder = @"Enter Title Here:";
    title.textAlignment = UITextAlignmentCenter;
    title.keyboardAppearance = UIKeyboardAppearanceAlert;
    
    UITextField *url = [[UITextField alloc] init];
    [url setBackgroundColor:[UIColor whiteColor]];
    url.borderStyle = UITextBorderStyleLine;
    url.frame = CGRectMake(15, 75, 255, 30);
    url.font = [UIFont fontWithName:@"ArialMT" size:20];
    url.placeholder = @"Enter RSS Url Here:";
    url.textAlignment = UITextAlignmentCenter;
    url.keyboardAppearance = UIKeyboardAppearanceAlert;
    [alert addSubview:title];
    [alert addSubview:url];
    [alert show];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    // Usually the number of items in your array (the one that holds your list)
    return [feedlist count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Where we configure the cell in each row
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell... setting the text of our cell's label

    cell.textLabel.text = [[feedlist objectAtIndex:indexPath.row] objectForKey:@"title"];
    return cell;
    
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     ViewController *viewController =  [[ViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil];
    viewController.feedInfo = [feedlist objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:viewController animated:YES];
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
  //  NSLog(@"%d",[[alertView subviews] count]);
    NSString* title = ((UITextField*)[[alertView subviews] objectAtIndex:5]).text;
    NSString* url = ((UITextField*)[[alertView subviews] objectAtIndex:6]).text;
    if ([url length] <= 0 || buttonIndex == 0 || [title length] <= 0){
        return;     }
    if (buttonIndex == 1) {
        if (!feedlist) {
            feedlist = [[NSMutableArray alloc] init];
        }
        NSMutableDictionary *feed = [[NSMutableDictionary alloc]initWithObjectsAndKeys:url,@"url",title,@"title",nil];
        [feedlist insertObject:feed atIndex:0];
        //NSLog(@"%d",[feedlist count]);
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.feedlisttable insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}
@end
