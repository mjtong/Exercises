//
//  FeedListViewController.m
//  RSSLast
//
//  Created by Maynard Tong on 6/6/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import "ViewController.h"
#import "FeedListViewController.h"
#import "SubscribeViewController.h"
@interface FeedListViewController (){
    NSMutableArray* feedlist;
    SubscribeViewController *subController;
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
   
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    feedlist = [[NSUserDefaults standardUserDefaults]objectForKey:@"subscribed"];
    
    
    [_feedlisttable reloadData];
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

-(void)subscribeToFeed : (UIBarButtonItem *) sender{
    if(!subController){
        subController = [[SubscribeViewController alloc]initWithNibName:@"SubscribeViewController" bundle:nil];
        subController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        subController.delegate = self;
        }
    [self.navigationController presentModalViewController:subController animated:YES];
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

-(void) subscribeViewControllerDidFinish:(SubscribeViewController *)viewController{
    [self dismissModalViewControllerAnimated:YES];
    
}

-(void)subscribeViewControllerDone:(NSMutableArray *)listOfFeeds{
    feedlist = listOfFeeds;
    [self dismissModalViewControllerAnimated:YES];
}
@end
