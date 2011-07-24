//
//  GOItemDetailViewController.m
//  DeepLinkingAttempt
//
//  Created by Samuel Goodwin on 7/24/11.
//  Copyright 2011 SNAP Interactive. All rights reserved.
//

#import "GOItemDetailViewController.h"

@implementation GOItemDetailViewController
@synthesize itemID = _itemID, itemLabel = _itemLabel;

- (id)initWithItemID:(NSString*)itemID{
    self = [super initWithNibName:@"GOItemDetailViewController" bundle:nil];
    if(self){
        self.itemID = itemID;
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.itemLabel.text = self.itemID;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
