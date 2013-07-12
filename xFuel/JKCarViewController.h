//
//  JKCarViewController.h
//  xFuel
//
//  Created by Julian Kleine on 12.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKCar.h"

@interface JKCarViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *fuelType;
@property (assign, nonatomic) int position;

@property (retain, nonatomic) JKCar *car;

- (id)initWithPosition:(NSInteger)position andCar:(JKCar*)car;
@end
