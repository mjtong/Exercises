//
//  ViewController.m
//  RSSProgram
//
//  Created by Maynard Tong on 6/3/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//
#import "CustomTableViewCell.h"
#import "ViewController.h"
#import "XMLParser.h"
#import "NSURLConnection+NSURLConnectionSendRequestAdditions.h"
//@synthesize
@interface ViewController()
@end
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *url = [self.feedInfo objectForKey:@"url"];
    NSString *title = [self.feedInfo objectForKey:@"title"];
    self.title = title;
    NSData *xmlFile = [NSURLConnection sendSynchronousRequestWithString:url error:nil];
    _items = [XMLParser feedItemsWithRSSData:xmlFile];
    //[_tableView reloadData];
    //_items = [[NSArray alloc] initWithObjects:@"Item No. 1", @"Item No. 2", @"Item No. 3", @"Item No. 4", @"Item No. 5", @"Item No. 6", nil];
    //NSLog(@"test %d", [_items count]);
    
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
    return [_items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //Where we configure the cell in each row
    
  static NSString *CellIdentifier = @"CustomTableViewCell";
    CustomTableViewCell *cell;
    
    cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CustomTableView" owner:self options:nil];
        for (id currentObject in nib) {
            if ([currentObject isKindOfClass:[CustomTableViewCell class]])  {
                cell = (CustomTableViewCell *) currentObject;
                break;
            }
        }
    }
    // Configure the cell... setting the text of our cell's label
    NSURL *url = [NSURL URLWithString:[[_items objectAtIndex:indexPath.row]objectForKey:@"url" ]];
    NSData *data = [NSData dataWithContentsOfURL:url];
      cell.feedImage.image = [[UIImage alloc] initWithData:data];
     cell.title.text = [[_items objectAtIndex:indexPath.row] objectForKey:@"title"];
     cell.date.text = [[_items objectAtIndex:indexPath.row] objectForKey:@"pubDate"];
    
   
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
    // Navigation logic may go here. Create and push another view controller.
    // If you want to push another view upon tapping one of the cells on your table.
    
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSMutableString *text =[[[_items objectAtIndex:indexPath.row] objectForKey:@"title"] copy];
    CGSize constraint = CGSizeMake( 204.0f - (10.0f * 2), 20000.0f);
    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    
    CGFloat height = MAX(size.height, 44.0f);
    
    return height + (10.0f * 2);
}
@end
