//
//  GOItemDetailViewController.m
//  DeepLinkingAttempt
//
//  Created by Samuel Goodwin on 7/24/11.
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

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    __block GOItemDetailViewController *weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationWillResignActiveNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        if([[weakSelf view] window] != nil){
            NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"deeplinking://tab1?item=%@", self.itemID]];
            [[NSUserDefaults standardUserDefaults] setURL:url forKey:@"launch-url"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            NSLog(@"commited launch url from details view");
        }
    }];
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
