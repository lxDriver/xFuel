//
//  JKFuelItem.m
//  xFuel
//
//  Created by Julian Kleine on 11.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import "JKFuelItem.h"

@implementation JKFuelItem
- (id)init
{
    // Dictionary containing the initiale data - object, key ..
    NSNumber *price = [NSNumber numberWithInt:0];
    NSNumber *volume = [NSNumber numberWithInt:0];
    NSNumber *distance = [NSNumber numberWithInt:0];
    CLLocation *location = nil;
    
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:price,@"price",volume,@"volume",distance,@"distance",location,@"location", nil];
    
    return [self initWithDictionary:dictionary];
}
- (id)initWithDictionary:(NSDictionary*)dictionary {
    self = [super init];
    if (self) {
        
        // Read and set the data from the dictionary
        self.price = [dictionary objectForKey:@"price"];
        self.volume = [dictionary objectForKey:@"volume"];
        self.distance = [dictionary objectForKey:@"distance"];
        self.date = [NSDate date];
        // @TODO: location
        //self.location = [dictionary objectForKey:@"location"];
        
        [self refreshData];
    }
    
    return self;
}
- (void)refreshData {
    // method to refresh the data
    
    // calculate the price/volume
    self.pricePerVolume = [NSNumber numberWithFloat:(self.price.floatValue / self.volume.floatValue)];
    
    // calculate the distance/volume
    self.distancePerVolume = [NSNumber numberWithFloat:(self.distance.floatValue / self.volume.floatValue)];
    
    // calculate the liter/hundred
    self.literPerHundred = [NSNumber numberWithFloat:(self.volume.floatValue / self.distance.floatValue)*100];
}
- (NSDictionary *)dictionary {
    return [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:self.price,self.volume,self.distance,self.date, nil] forKeys:[NSArray arrayWithObjects:@"price",@"volume",@"distance",@"date",nil]];
}
@end
