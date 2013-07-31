//
//  JKFuelItem.h
//  xFuel
//
//  Created by Julian Kleine on 11.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface JKFuelItem : NSObject

/**
 the volume in Liters of the tank
 */
@property (nonatomic, retain) NSNumber *volume;
/**
 the total price
 */
@property (nonatomic, retain) NSNumber *price;
/**
 the price per volume - €/l
 */
@property (nonatomic, retain) NSNumber *pricePerVolume;
/**
 the distance for this tank - km
 */
@property (nonatomic, retain) NSNumber *distance;
/**
 the distance per volume - km/l
 */
@property (nonatomic, retain) NSNumber *distancePerVolume;
/**
 the distance per volume - km/l
 */
@property (nonatomic, retain) NSNumber *literPerHundred;
/**
 the date
 */
@property (nonatomic, retain) NSDate *date;
/**
 the location you fuel
 */
@property (nonatomic, retain) CLLocation *location;

/** 
 init method with dictionary must(!) contain
    NSNumber price,volume,distance
    CLLocation location
 */
- (id)initWithDictionary:(NSDictionary*)dictionary;
/** 
 return a dictionary with the data
 */
- (NSDictionary *)dictionary;
@end
