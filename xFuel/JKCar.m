//
//  JKCar.m
//  xFuel
//
//  Created by Julian Kleine on 11.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import "JKCar.h"

@implementation JKCar
- (id)init
{
    return [self initWithName:@"Car"];
}
- (id)initWithName:(NSString *)aName
{
    self = [super init];
    if (self) {
        self.name = aName;
        self.fuelType = @"Kraftstoff";
        self.image = nil;
        self.fuelItems = [[NSMutableArray alloc] init];
    }
    return self;
}
+ (NSArray *)createItemsByArray:(NSArray *)array {
    NSLog(@"started parsing");
    // result array
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[array count]];
    NSLog(@"result-count: %i",array.count);
    // loop to go through the array
    for (NSDictionary *dic in array) {
        
        // create a new car and init with name
        JKCar *car = [[JKCar alloc] initWithName:[dic objectForKey:@"name"]];
        car.fuelType = [dic objectForKey:@"fuelType"];
        //@TODO: Implement images
        //car.image = [dic objectForKey:@"image"];
        
        NSLog(@"Car: %@",car.name);
        
        // array containing the found fuel items
        NSArray *foundFuelItems = [NSArray arrayWithArray:[dic objectForKey:@"fuelItems"]];
        
        // array that will contain the parsed fuel items
        NSMutableArray *parsedFuelItems = [[NSMutableArray alloc] initWithCapacity:[foundFuelItems count]];
        
        for (NSDictionary *carDic in foundFuelItems) {
            /** 
                JKFuelItem:
                    - price
                    - volume
                    - distance
                    - location
             **/
            
            // create the values
            NSNumber *price = [carDic objectForKey:@"price"];
            NSNumber *volume = [carDic objectForKey:@"volume"];
            NSNumber *distance = [carDic objectForKey:@"distance"];
            NSDate *date = [carDic objectForKey:@"date"];
            // @TODO: locations
            //CLLocation *location = [carDic objectForKey:@"location"];
            
            // save as dictionary
            NSDictionary* fuelDictionary = [NSDictionary dictionaryWithObjectsAndKeys:price,@"price",volume,@"volume",distance,@"distance",date,@"date", nil];
            
            // init a fuel item with the dictionary
            JKFuelItem *aFuelItem = [[JKFuelItem alloc] initWithDictionary:fuelDictionary];
            
            // add the fuel item to the parsed fuel items array
            [parsedFuelItems addObject:aFuelItem];
            
            NSLog(@"%@",aFuelItem);
        }
        
        car.fuelItems = [parsedFuelItems copy];
        [result addObject:car];
    }
    
    return [result copy];
}
+ (NSArray *)getItemsByArray:(NSMutableArray *)aArray {
    // copied array containing the results
    NSArray *result = [aArray copy];
    // the dicionary that will contain the parsed results
    NSMutableArray *results = [NSMutableArray arrayWithCapacity:aArray.count];
    
    for (int i = 0; i < aArray.count; i++) {
        
        NSMutableDictionary *aCarDic = [[NSMutableDictionary alloc] initWithCapacity:2];
        // mutable array that will be filled with car dictionarys
        NSMutableArray *fuelDataArray = [[NSMutableArray alloc] init];
        
        // the current car
        JKCar *currentCar = (JKCar*)result[i];
        
        NSLog(@"current car: %@",currentCar.name);
        
        for (int j = 0; j < currentCar.fuelItems.count; j++) {
            
            // the current fuel item
            JKFuelItem *currentFuelItem = currentCar.fuelItems[j];
            
            // add a dictionary of the current fuel item to the fuel data array
            [fuelDataArray addObject:[currentFuelItem dictionary]];
        }
        
        // add the parsed fuel items as array to the result dictionary
        [aCarDic setObject:currentCar.name forKey:@"name"];
        [aCarDic setObject:fuelDataArray forKey:@"fuelItems"];
        [aCarDic setObject:currentCar.fuelType forKey:@"fuelType"];
        [results addObject:aCarDic];
    }
    
    // return a copy of the results
    return [results copy];
}
- (NSNumber *)averageFuel {
    float avgFuel = 0.0;
    int count = 0;
    
    for (JKFuelItem *currentFuelItem in self.fuelItems) {
        avgFuel += [currentFuelItem.literPerHundred floatValue];
        count++;
    }
    return [NSNumber numberWithFloat:(avgFuel/count)];
}
- (NSNumber *)averageDistance {
    float avgDistance = 0.0;
    int count = 0;
    
    for (JKFuelItem *currentFuelItem in self.fuelItems) {
        avgDistance += [currentFuelItem.distance floatValue];
        count++;
    }
    return [NSNumber numberWithFloat:(avgDistance/count)];
}
@end
