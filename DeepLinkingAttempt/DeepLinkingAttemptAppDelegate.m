//
//  DeepLinkingAttemptAppDelegate.m
//  DeepLinkingAttempt
//
//  Created by Samuel Goodwin on 7/24/11.

//

#import "DeepLinkingAttemptAppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "GOItemDetailViewController.h"
#import "NSDictionary+QueryHandling.h"

@implementation DeepLinkingAttemptAppDelegate

@synthesize window = _window;
@synthesize tabBarController = _tabBarController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSURL *url = [[NSUserDefaults standardUserDefaults] URLForKey:@"launch-url"];
    NSLog(@"URL: %@",url);
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    UIViewController *viewController1 = [[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
    UINavigationController *navigration1 = [[UINavigationController alloc] initWithRootViewController:viewController1];
    
    UIViewController *viewController2 = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
    UINavigationController *navigration2 = [[UINavigationController alloc] initWithRootViewController:viewController2];
    
    self.tabBarController = [[UITabBarController alloc] init];
    self.tabBarController.viewControllers = [NSArray arrayWithObjects:navigration1, navigration2, nil];
    self.window.rootViewController = self.tabBarController;
    [self.window makeKeyAndVisible];
    
    if(url){
        [[UIApplication sharedApplication] openURL:url];
    }
    return YES;
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    NSDictionary *params = [NSDictionary dictionaryFromQueryString:[url query]];
    if([[url host] isEqualToString:@"tab1"]){
        self.tabBarController.selectedIndex = 0;
        if([params objectForKey:@"item"]){
            GOItemDetailViewController *detailController = [[GOItemDetailViewController alloc] initWithItemID:[params objectForKey:@"item"]];
            UINavigationController *navi = (UINavigationController*)[self.tabBarController selectedViewController];
            [navi pushViewController:detailController animated:YES];
        }
    }
    if([[url host] isEqualToString:@"tab2"]){
        self.tabBarController.selectedIndex = 1;
    }
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
}
*/

/*
// Optional UITabBarControllerDelegate method.
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed
{
}
*/

@end
