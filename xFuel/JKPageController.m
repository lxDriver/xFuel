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
    
    self.carController = [NSMutableArray arrayWithCapacity:numberOfCars];
    self.pageControl = [[JKPageControl alloc] init];
    
    self.pageControl.numberOfPages = numberOfCars+1;
    self.pageControl.frame = CGRectMake(0,512,320,36);
    
    [self.view addSubview:self.pageControl];
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * (numberOfCars + 1), self.scrollView.frame.size.height);
    
    // Iterate through all cars and display them
    
    if (numberOfCars == 0) {
        
        JKCar *firstCar = [[JKCar alloc] initWithName:@"Dein Auto"];

        [appDelegate.allCars addObject:firstCar];
        
        //[appDelegate.allCars addObject:firstCar];
        //[self.carController addObject:firstCarController];
        //firstCarController.view.tag = 20;
        //[self.scrollView addSubview:firstCarController.view];
        
    }
    
    [self refreshScrollView];
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
- (void)addCar:(JKCar*)car {
    JKAppDelegate *appDelegate = (JKAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // add the new car
    [appDelegate.allCars addObject:car];
    
    // save plist
    [appDelegate savePlist];
    
    // refresh the scroll view
    [self refreshScrollView];
}
- (void)refreshScrollView {
    JKAppDelegate *appDelegate = (JKAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    // the number of cars in appDelegate.allCars
    int numberOfCars = appDelegate.allCars.count;
    
    // refresh carController array
    self.carController = [NSMutableArray arrayWithCapacity:numberOfCars+1];
    
    // reset page Control
    self.pageControl.numberOfPages = numberOfCars+1;
    
    // reset scrollView size 
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * (numberOfCars + 1), self.scrollView.frame.size.height);
    
    // iterate through all views with tag "20" in scrollView and delete those
    for (UIView * view in self.scrollView.subviews) {
        if (view.tag == 20) {
            // delete the view
            [view removeFromSuperview];
        }
    }
    
    // add new views to scrollView
    for (int i = 0; i < numberOfCars;i++) {
        // create a new current car 
        JKCar *aCar = appDelegate.allCars[i];
        
        // a new car controller for the view
        JKCarViewController *aCarController = [[JKCarViewController alloc] initWithPosition:i andCar:aCar];
        
        // add the new car controller to an array to keep the reference count
        [self.carController addObject:aCarController];
        // add a tag to the view for delete purpose (see above)
        aCarController.view.tag = 20;
        // add the view to the scroll view
        [self.scrollView addSubview:aCarController.view];
    }
    
    // last add the new car controller
    JKNewCarViewController *newCarController = [[JKNewCarViewController alloc] initWithPosition:numberOfCars assignTo:self];
    // add the new car controller to an array to keep the reference count
    [self.carController addObject:newCarController];
    // add a tag to the view for delete purpose (see above)
    newCarController.view.tag = 20;
    // add the view to the scroll view
    [self.scrollView addSubview:newCarController.view];
    
    // modifiy pageControl
    [self.pageControl setImage:[UIImage imageNamed:@"plus"] forPage:numberOfCars];
    [self.pageControl setCurrentImage:[UIImage imageNamed:@"plus"] forPage:numberOfCars];
    // display the scrollView again
    [self.scrollView setNeedsDisplay];
}
@end
