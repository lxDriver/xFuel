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
        self.image = nil;
        self.fuelItems = [[NSMutableArray alloc] init];
    }
    return self;
}
+ (NSArray *)createItemsByArray:(NSArray *)array {
    NSLog(@"started parsing");
    // result array
    NSMutableArray *result = [[NSMutableArray alloc] initWithCapacity:[array count]];
    
    // loop to go through the array
    for (NSDictionary *dic in array) {
        
        // create a new car and init with name
        JKCar *car = [[JKCar alloc] initWithName:[dic objectForKey:@"name"]];
        
        NSLog(@"%@",car);
        
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
            CLLocation *location = [carDic objectForKey:@"location"];
            
            // save as dictionary
            NSDictionary* fuelDictionary = [NSDictionary dictionaryWithObjectsAndKeys:price,@"price",volume,@"volume",distance,@"distance",location,@"location", nil];
            
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
@end
