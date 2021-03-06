//
//  JKViewController.h
//  xFuel
//
//  Created by Julian Kleine on 11.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JKCar.h"
#import "JKPageControl.h"

@interface JKPageController : UIViewController <UIScrollViewDelegate>

/**
 the scroll view displaying the cars
 */
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

/**
 the page control showing where you are
 */
@property (strong, nonatomic) IBOutlet JKPageControl *pageControl;

@property (strong, nonatomic) NSMutableArray *carController;

- (void)addCar:(JKCar*)car;
@end
