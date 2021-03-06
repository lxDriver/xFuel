//
//  JKCar.h
//  xFuel
//
//  Created by Julian Kleine on 11.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JKFuelItem.h"

@interface JKCar : NSObject
/**
 the custom name
 */
@property (nonatomic, retain) NSString *name;
/**
 the fuel type
 */
@property (nonatomic, retain) NSString *fuelType;
/**
 an image you can take to see your car
 */
@property (nonatomic, retain) UIImage *image;
/**
 an array representing all the fuel items
 */
@property (nonatomic, retain) NSMutableArray *fuelItems;

/** 
 class method to create fuel Items
 */
+ (NSArray *)createItemsByArray:(NSArray *)array;
/**
 class method to return an dictionary from an array
 */
+ (NSArray *)getItemsByArray:(NSMutableArray *)aArray;
/**
 init with name
 */
- (id)initWithName:(NSString *)aName;
/**
 return average fuel
 */
- (NSNumber *)averageFuel;
/**
 return average distance
 */
- (NSNumber *)averageDistance;

@end
