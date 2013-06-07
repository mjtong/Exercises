//
//  SubscribeViewController.m
//  RSSLast
//
//  Created by Maynard Tong on 6/7/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import "SubscribeViewController.h"
#import "FeedListViewController.h"
@interface SubscribeViewController ()
- (IBAction)subscribeDone:(UIBarButtonItem *)sender;
- (IBAction)subscribeCancel:(UIBarButtonItem *)sender;
@property (nonatomic, strong) NSArray * feedList;
@end

@implementation SubscribeViewController

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
    NSMutableDictionary *feed1 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://news.yahoo.com/rss/entertainment",@"url",@"Yahoo Entertainment",@"title",@"NO",@"subscribed", nil];
    NSMutableDictionary *feed2 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://news.yahoo.com/rss/sports",@"url",@"Yahoo Sports",@"title",@"NO",@"subscribed", nil];
    NSMutableDictionary *feed3 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://rss.news.yahoo.com/rss/mostviewed",@"url",@"Yahoo News",@"title",@"NO",@"subscribed", nil];
    NSMutableDictionary *feed4 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://rss.news.yahoo.com/rss/mostviewed",@"url",@"Yahoo News",@"title",@"NO",@"subscribed", nil];
    NSMutableDictionary *feed5 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://rss.news.yahoo.com/rss/mostviewed",@"url",@"Yahoo News",@"title",@"NO",@"subscribed", nil];
    NSMutableDictionary *feed6 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://rss.news.yahoo.com/rss/mostviewed",@"url",@"Yahoo News",@"title",@"NO",@"subscribed", nil];
    NSMutableDictionary *feed7 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://rss.news.yahoo.com/rss/mostviewed",@"url",@"Yahoo News",@"title",@"NO",@"subscribed", nil];
    NSMutableDictionary *feed8 = [[NSMutableDictionary alloc]initWithObjectsAndKeys:@"http://rss.news.yahoo.com/rss/mostviewed",@"url",@"Yahoo News",@"title",@"NO",@"subscribed", nil];
    NSMutableArray *staticFeeds = [NSMutableArray arrayWithObjects:feed1,feed2,feed3,feed4,feed5,feed6,feed7,feed8, nil];
    _feedList = [[NSMutableArray alloc] initWithArray:staticFeeds];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    // Return the number of rows in the section.
    // Usually the number of items in your array (the one that holds your list)
    return [_feedList count];
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
    UISwitch *cellSwitch = [[UISwitch alloc] init];
    cellSwitch.tag = indexPath.row;
    cellSwitch.on = [[[_feedList objectAtIndex:indexPath.row] objectForKey:@"subscribed"] boolValue];
   // NSLog(@"%@",[[_feedList objectAtIndex:indexPath.row] objectForKey:@"subscribed"]);
    [cellSwitch addTarget:self action:@selector(toggleSwitch:) forControlEvents:UIControlEventValueChanged];
    cell.accessoryView = cellSwitch;
    cell.textLabel.text = [[_feedList objectAtIndex:indexPath.row] objectForKey:@"title"];
    return cell;
}

-(void) toggleSwitch : (UISwitch *)sender{
    if(sender.on){
        [((NSMutableDictionary *)_feedList[sender.tag]) setObject:@"YES" forKey:@"subscribed"] ;}
    else{
        [((NSMutableDictionary *)_feedList[sender.tag]) setObject:@"NO" forKey:@"subscribed"] ;}
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
 
}
- (void)viewDidUnload {
    [self setSubscribeTable:nil];
    [super viewDidUnload];
}
- (IBAction)subscribeDone:(UIBarButtonItem *)sender {
    NSMutableArray* toReturn = [NSMutableArray array];
    for(int i = 0; i < [_feedList count]; i++){
       if( [[((NSMutableDictionary*)[_feedList objectAtIndex:i]) objectForKey:@"subscribed"] boolValue] ){
            [toReturn addObject:_feedList[i]];
        }
    }
    //NSLog(@"%d",[toReturn count]);
    [self.delegate subscribeViewControllerDone:toReturn];
}

- (IBAction)subscribeCancel:(UIBarButtonItem *)sender {
    //[self.delegate subscribeViewControllerDidFinish:self];
    [self dismissModalViewControllerAnimated:YES];
}
@end

