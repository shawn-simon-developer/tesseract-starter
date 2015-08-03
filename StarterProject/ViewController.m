//
//  ViewController.m
//  StarterProject
//
//  Created by BrainStation on 2015-07-29.
//  Copyright (c) 2015 shawn-simon-developer. All rights reserved.
//

#import "ViewController.h"
#import "ExplainerViewController.h"

@interface ViewController ()

@property (strong, nonatomic) ExplainerViewController* explainerVC;

@end

@implementation ViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary* startup = [defaults objectForKey:@"startupOptions"];
    
    if (![startup[@"firstViewComplete"] isEqualToString:@"YES"])
    {
        self.explainerVC = [[ExplainerViewController alloc] init];
        self.explainerVC.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
        [self presentViewController:self.explainerVC animated:YES completion:nil];
    }
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
