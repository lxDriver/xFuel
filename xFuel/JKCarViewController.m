//
//  JKCarViewController.m
//  xFuel
//
//  Created by Julian Kleine on 12.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import "JKCarViewController.h"
#import "JKAppDelegate.h"
@interface JKCarViewController ()

@end

@implementation JKCarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (id)initWithPosition:(NSInteger)position andCar:(JKCar*)car {
    if( self = [super init] ) {
        
        self = [super initWithNibName:@"JKCarViewController" bundle:nil];
        
        self.position = position;
        self.car = car;
        
        [self.view setFrame:CGRectMake(320 * self.position, 0, 320, 510)];
        
        [self update];
    }
    return self;
}
- (void) update {
    self.name.text = self.car.name;
    self.fuelType.text = self.car.fuelType;
}
    
@end
