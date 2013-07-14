//
//  JKNewCarViewController.h
//  xFuel
//
//  Created by Julian Kleine on 13.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKCar.h"
#import "JKPageController.h"

@interface JKNewCarViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *fuelType;
@property (weak, nonatomic) IBOutlet UIButton *createButton;

@property (strong, nonatomic) JKPageController *pageController;

@property (assign, nonatomic) int position;

- (id)initWithPosition:(NSInteger)position assignTo:(JKPageController*)pageController;
- (IBAction)createNewCar:(id)sender;
- (IBAction)dismissKeyboard:(UITextField*)textField;

@end
