//
//  NSDictionary+QueryHAndling.h
//  DeepLinkingAttempt
//
//  Created by Samuel Goodwin on 7/24/11.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (NSDictionary_QueryHandling)
+ (NSDictionary *)dictionaryFromQueryString:(NSString *)query;
@end
