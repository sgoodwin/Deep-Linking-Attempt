//
//  GOItemDetailViewController.h
//  DeepLinkingAttempt
//
//  Created by Samuel Goodwin on 7/24/11.
//  Copyright 2011 SNAP Interactive. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GOItemDetailViewController : UIViewController
@property(nonatomic, retain) IBOutlet UILabel *itemLabel;
@property(nonatomic, copy) NSString *itemID;

- (id)initWithItemID:(NSString*)itemID;
@end
