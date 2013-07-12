//
//  JKViewController.m
//  xFuel
//
//  Created by Julian Kleine on 11.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import "JKPageController.h"
#import "JKCarViewController.h"
#import "JKCar.h"
#import "JKAppDelegate.h"

@interface JKPageController ()
@end

@implementation JKPageController

@synthesize scrollView;
@synthesize pageControl;

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
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * 2, self.scrollView.frame.size.height);
    
    // @TODO: Iterate through all cars and display them
    JKAppDelegate *appDelegate = (JKAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    int numberOfCars = appDelegate.allCars.count;
    
    for(int i = 0; i < numberOfCars; i++) {
        JKCar *aCar = appDelegate.allCars[i];
        
        JKCarViewController *firstCarController = [[JKCarViewController alloc] initWithPosition:i andCar:aCar];
        
        [self.scrollView addSubview:firstCarController.view];
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
    /*
    int page = self.pageControlHelp.currentPage;
    CGRect frame = self.scrollViewHelp.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    //[self.scrollViewHelp scrollRectToVisible:frame animated:YES];
     */
    NSLog(@"scrolled");
}
@end
