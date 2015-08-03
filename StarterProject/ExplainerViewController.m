//
//  ExplainerViewController.m
//  StarterProject
//
//  Created by BrainStation on 2015-07-29.
//  Copyright (c) 2015 shawn-simon-developer. All rights reserved.
//

#import "ExplainerViewController.h"
#import "ExplainerPageViewController.h"

@interface ExplainerViewController () <UIPageViewControllerDataSource>

@property (strong, nonatomic) UIPageViewController* pageVC;
@property (strong, nonatomic) NSMutableArray* explainerPageArray;
@property (strong, nonatomic) UIPageControl* pageControl;

@end

@implementation ExplainerViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
    self.explainerPageArray = [self setupPages];
    NSArray* startingVC = @[[self.explainerPageArray objectAtIndex:0]];
    
    self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height+37);
    self.pageVC.dataSource = self;
    
    [self.pageVC setViewControllers:startingVC direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    [self.pageVC didMoveToParentViewController:self];
    
    self.pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-37, self.view.frame.size.width, 37)];
    self.pageControl.backgroundColor = [UIColor clearColor];
    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    self.pageControl.numberOfPages = self.explainerPageArray.count;
    [self.pageVC.view addSubview:self.pageControl];
    [self.pageVC.view bringSubviewToFront:self.pageControl];
    [self.pageControl addTarget:self action:@selector(updatePage:) forControlEvents:UIControlEventTouchUpInside];
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSMutableArray *) setupPages
{
    NSMutableArray* pages = [[NSMutableArray alloc] init];
    
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    ExplainerPageViewController* page1 = [sb instantiateViewControllerWithIdentifier:@"explainerPageVC"];
    page1.view.backgroundColor = [UIColor redColor];
    page1.index = 0;
    [pages addObject:page1];
    
    ExplainerPageViewController* page2 = [sb instantiateViewControllerWithIdentifier:@"explainerPageVC"];
    page2.index = 1;
    page2.view.backgroundColor = [UIColor purpleColor];
    [pages addObject:page2];
    [page2.actionButton addTarget:self action:@selector(dismissPager:) forControlEvents:UIControlEventTouchUpInside];
    
    return pages;
}

#pragma PageVC

- (void) dismissPager:(UIButton *)button
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@{@"firstViewComplete": @"YES"} forKey:@"startupOptions"];
    [defaults synchronize];
    
    [self dismissViewControllerAnimated:YES completion:^{
    }];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
}

- (void) updatePage:(UIPageControl *)control
{
    NSUInteger index = control.currentPage;
    [self.pageVC setViewControllers:@[[self.explainerPageArray objectAtIndex:index]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (NSInteger) presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.explainerPageArray count];
}

- (NSInteger) presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}

- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ExplainerPageViewController *)viewController).index;
    [self.pageControl setCurrentPage:index];

    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;

    
    return [self.explainerPageArray objectAtIndex:index];
}

- (UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((ExplainerPageViewController *)viewController).index;
    [self.pageControl setCurrentPage:index];

    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;

    
    if (index == [self.explainerPageArray count]) {
        return nil;
    }
    return [self.explainerPageArray objectAtIndex:index];
}

#pragma - mark


@end
