//
//  JKCar.h
//  xFuel
//
//  Created by Julian Kleine on 11.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JKFuelItem;

@interface JKCar : NSObject
/**
 the custom name
 */
@property (nonatomic, retain) NSString *name;
/**
 an image you can take to see your car
 */
@property (nonatomic, retain) UIImage *image;
/**
 an array representing all the fuel items
 */
@property (nonatomic, retain) NSArray *fuelItems;

@end
