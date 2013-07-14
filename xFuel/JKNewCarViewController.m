//
//  JKNewCarViewController.m
//  xFuel
//
//  Created by Julian Kleine on 13.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import "JKNewCarViewController.h"
#import "JKAppDelegate.h"

@interface JKNewCarViewController ()

@end

@implementation JKNewCarViewController

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
- (IBAction)dismissKeyboard:(UITextField*)textField
{
    [textField resignFirstResponder];
    //[self.fuelType resignFirstResponder];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithPosition:(NSInteger)position {
    if( self = [super init] ) {
        
        self = [super initWithNibName:@"JKNewCarViewController" bundle:nil];
        
        self.position = position;
        
        [self.view setFrame:CGRectMake(320 * self.position, 0, 320, 510)];
        //[self.createButton addTarget:self action:@selector(createNewCar:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (IBAction)createNewCar:(id)sender {
    /*
    JKAppDelegate *appDelegate = (JKAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    JKCar *car = [[JKCar alloc] initWithName:self.name.text];
    car.fuelType = self.fuelType.text;
    
    [appDelegate.allCars addObject:car];*/
    NSLog(@"create new car");
}

@end
