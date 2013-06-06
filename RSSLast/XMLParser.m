//
//  XMLParser.m
//  RSSProgram
//
//  Created by Maynard Tong on 6/3/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import "XMLParser.h"
@interface XMLParser ()

@property (nonatomic,strong)    NSMutableArray* articles;
@property (nonatomic,strong)    NSString *currentElement;
@property (nonatomic,strong)    NSMutableString *elementValue;
@property (nonatomic,strong)  NSMutableDictionary* item;

-(NSArray *) arrayWithData:(NSData*)data;
@end

@implementation XMLParser
+(NSArray *) feedItemsWithRSSData:(NSData *)rssData{
    XMLParser *parser = [[XMLParser alloc] init];
    NSArray *toReturn = [parser arrayWithData:rssData];
    return toReturn;
}

- (NSArray *) arrayWithData:(NSData *)data{
    _articles = [[NSMutableArray alloc] init];
    _item = [[NSMutableDictionary alloc] init];
    //NSLog(@"%d",[_articles count]);
    NSXMLParser *parser = [[NSXMLParser alloc] initWithData:data];
    parser.delegate = self;
    BOOL success = [parser parse];
    
    if (success)
    {
        NSLog(@"%d",[_articles count]);
        return [_articles copy];
        //return nil;
    }
    
    return nil;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict{
    _elementValue = [[NSMutableString alloc] init];
    if([elementName isEqualToString:@"media:content"]){
        [(NSMutableDictionary *)[_articles lastObject] setObject:[attributeDict objectForKey:@"url"] forKey:@"url"];

       // [_item setObject:[attributeDict objectForKey:@"url"] forKey:@"url"];
       // NSLog(@"%@",[attributeDict objectForKey:@"url"]);
    }
   }

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    NSLog(@"%@",string);
    [_elementValue appendString:string];}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    NSLog(@"%@",elementName);
    if ([elementName isEqualToString:@"title"]) {
        [_item setObject:_elementValue forKey:elementName];
    }
    else if ([elementName isEqualToString:@"link"]) {
        [_item setObject:_elementValue forKey:elementName];
    }
    else if ([elementName isEqualToString:@"description"]) {
        [_item setObject:_elementValue forKey:elementName];
    }
    else if ([elementName isEqualToString:@"pubDate"]) {
        [_item setObject:_elementValue forKey:elementName];
         [ _articles addObject:_item];
          _item = [NSMutableDictionary dictionary];
           }
    else {
        _elementValue = [[NSMutableString alloc] init];
    }
}


@end

