//
//  JKAppDelegate.m
//  xFuel
//
//  Created by Julian Kleine on 11.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import "JKAppDelegate.h"
#import "JKPlistParser.h"

@interface JKAppDelegate ()

@property (strong, atomic) JKPlistParser *parser;
@property (strong, nonatomic) NSArray *data;

@end

@implementation JKAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // create a parser
    if (self.parser == nil) {
        self.parser = [[JKPlistParser alloc] init];
        NSLog(@"created parser");
    }
    
    // Start parsing
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"fuelData.plist"];
    
    // parse data
    self.data = [self.parser parseFileByPath:plistPath];
    
    // save the parsed data to allCars array
    self.allCars = [[NSMutableArray alloc] initWithCapacity:[self.data count]];
    [self.allCars addObjectsFromArray:[self.data copy]];
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [self savePlist];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self savePlist];
}
- (JKCar*)carAtIndex:(NSUInteger)index {
    // return the car at index
    return (JKCar*)self.allCars[index];
}
- (void) savePlist {
    // get paths from root direcory
    NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
    // get documents path
    NSString *documentsPath = [paths objectAtIndex:0];
    // get the path to our Data/plist file
    NSString *plistPath = [documentsPath stringByAppendingPathComponent:@"fuelData.plist"];
    
    NSError *error = nil;
    
    // create NSData from dictionary
    //NSData *plistData = [NSPropertyListSerialization dataFromPropertyList:[JKCar getItemsByArray:self.allCars] format:NSPropertyListXMLFormat_v1_0 errorDescription:&error];
    
    NSData *plistData = [NSPropertyListSerialization dataWithPropertyList:[JKCar getItemsByArray:self.allCars] format:NSPropertyListXMLFormat_v1_0 options:NSPropertyListMutableContainersAndLeaves error:&error];
    
    // check if plistData exists
    if(plistData)
    {
        // write plistData to plist file
        [plistData writeToFile:plistPath atomically:YES];
        NSLog(@"saved plist");
    }
    else
    {
        NSLog(@"Error in saveData: %@", error);
    }
}
@end
