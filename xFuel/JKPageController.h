//
//  JKViewController.h
//  xFuel
//
//  Created by Julian Kleine on 11.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JKPageController : UIViewController <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;

@end
