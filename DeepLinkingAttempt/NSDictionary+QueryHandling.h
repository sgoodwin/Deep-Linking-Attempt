//
//  NSDictionary+QueryHAndling.h
//  DeepLinkingAttempt
//
//  Created by Samuel Goodwin on 7/24/11.
//  Copyright 2011 SNAP Interactive. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NSDictionary_QueryHandling)
+ (NSDictionary *)dictionaryFromQueryString:(NSString *)query;
@end
