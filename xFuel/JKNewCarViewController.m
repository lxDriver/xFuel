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
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
    [tap setCancelsTouchesInView:NO];
    
    self.name.delegate = self;
    self.fuelType.delegate = self;
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

- (id)initWithPosition:(NSInteger)position assignTo:(JKPageController*)pageController {
    if( self = [super init] ) {
        
        self = [super initWithNibName:@"JKNewCarViewController" bundle:nil];
        
        self.position = position;
        self.pageController = pageController;
        
        [self.view setFrame:CGRectMake(320 * self.position, 0, 320, 510)];
        //[self.createButton addTarget:self action:@selector(createNewCar:) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (IBAction)createNewCar:(id)sender {
    // create car
    JKCar *car = [[JKCar alloc] initWithName:self.name.text];
    car.fuelType = self.fuelType.text;
    
    // add car
    [self.pageController addCar:car];
}
-(void)dismissKeyboard
{
    [self.name resignFirstResponder];
    [self.fuelType resignFirstResponder];
}
@end
