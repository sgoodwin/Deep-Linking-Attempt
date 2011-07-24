//
//  NSDictionary+QueryHAndling.m
//  DeepLinkingAttempt
//
//  Created by Samuel Goodwin on 7/24/11.
//  Copyright 2011 SNAP Interactive. All rights reserved.
//

#import "NSDictionary+QueryHAndling.h"

@implementation NSDictionary (NSDictionary_QueryHandling)

+ (NSDictionary *)dictionaryFromQueryString:(NSString *)query{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] initWithCapacity:6];
    NSArray *pairs = [query componentsSeparatedByString:@"&"];
    
    for (NSString *pair in pairs) {
        NSArray *elements = [pair componentsSeparatedByString:@"="];
        NSString *key = [[elements objectAtIndex:0] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSString *val = [[elements objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        [dict setObject:val forKey:key];
    }
    return dict;
}

@end
