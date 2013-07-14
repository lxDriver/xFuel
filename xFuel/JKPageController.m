//
//  JKViewController.m
//  xFuel
//
//  Created by Julian Kleine on 11.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import "JKPageController.h"
#import "JKCarViewController.h"
#import "JKNewCarViewController.h"
#import "JKCar.h"
#import "JKAppDelegate.h"

@interface JKPageController ()
@end

@implementation JKPageController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
   /* UIApplication *myApp = [UIApplication sharedApplication];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(applicationDidEnterBackground:)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:myApp];
*/
}
- (void)viewDidAppear:(BOOL)animated {
    JKAppDelegate *appDelegate = (JKAppDelegate *)[[UIApplication sharedApplication] delegate];
    int numberOfCars = appDelegate.allCars.count;
    
    self.pageControl.numberOfPages = numberOfCars;
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * (numberOfCars + 1), self.scrollView.frame.size.height);
    
    // Iterate through all cars and display them
    
    if (numberOfCars == 0) {
        
        JKCar *firstCar = [[JKCar alloc] initWithName:@"Dein Auto"];

        JKCarViewController *firstCarController = [[JKCarViewController alloc] initWithPosition:0 andCar:firstCar];
        
        //[appDelegate.allCars addObject:firstCar];
        
        [self.scrollView addSubview:firstCarController.view];
    } else {
        
        for(int i = 0; i < numberOfCars; i++) {
            JKCar *aCar = appDelegate.allCars[i];
        
            JKCarViewController *aCarController = [[JKCarViewController alloc] initWithPosition:i andCar:aCar];
        
            [self.scrollView addSubview:aCarController.view];
        }
        
        JKNewCarViewController *newCarController = [[JKNewCarViewController alloc] initWithPosition:numberOfCars];
        [self.scrollView addSubview:newCarController.view];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pageControl.currentPage = page;
}
- (IBAction)changePage:(id)sender
{
    int page = self.pageControl.currentPage;
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
     
    NSLog(@"scrolled");
}
@end
