//
//  JKNewCarViewController.h
//  xFuel
//
//  Created by Julian Kleine on 13.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKCar.h"

@interface JKNewCarViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *fuelType;
@property (weak, nonatomic) IBOutlet UIButton *createButton;

@property (assign, nonatomic) int position;

- (id)initWithPosition:(NSInteger)position;
- (IBAction)createNewCar:(id)sender;
- (IBAction)dismissKeyboard:(UITextField*)textField;

@end
