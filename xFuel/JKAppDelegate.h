//
//  JKAppDelegate.h
//  xFuel
//
//  Created by Julian Kleine on 11.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKCar.h"

@interface JKAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) NSMutableArray *allCars;

- (JKCar*)carAtIndex:(NSUInteger)index;
- (void)savePlist;
@end
