//
//  XMLParser.h
//  RSSProgram
//
//  Created by Maynard Tong on 6/3/13.
//  Copyright (c) 2013 Maynard Tong. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLParser : NSObject <NSXMLParserDelegate>
+ (NSArray *)feedItemsWithRSSData:(NSData *)rssData;
@end
