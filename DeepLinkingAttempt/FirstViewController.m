//
//  FirstViewController.m
//  DeepLinkingAttempt
//
//  Created by Samuel Goodwin on 7/24/11.
//  Copyright 2011 SNAP Interactive. All rights reserved.
//

#import "FirstViewController.h"
#import "GOItemDetailViewController.h"

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"First", @"First");
        self.tabBarItem.image = [UIImage imageNamed:@"first"];
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    __block FirstViewController *weakSelf = self;
    [[NSNotificationCenter defaultCenter] addObserverForName:UIApplicationWillResignActiveNotification object:nil queue:nil usingBlock:^(NSNotification *note) {
        if([[weakSelf view] window] != nil){
            NSURL *url = [NSURL URLWithString:@"deeplinking://tab1"];
            [[NSUserDefaults standardUserDefaults] setURL:url forKey:@"launch-url"];
            [[NSUserDefaults standardUserDefaults] synchronize];
            NSLog(@"commited launch url from first view");
        }
    }];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


#pragma mark -
#pragma mark UITableView Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 32;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *idenfitifer = @"poop";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:idenfitifer];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:idenfitifer];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Item number %i", indexPath.row];
    cell.detailTextLabel.text = @"Cool huh?";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *itemID = [NSString stringWithFormat:@"%i", indexPath.row];
    GOItemDetailViewController *detail = [[GOItemDetailViewController alloc] initWithItemID:itemID];
    [self.navigationController pushViewController:detail animated:YES];
}
@end
