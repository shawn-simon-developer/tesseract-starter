//
//  ExplainerPageViewController.m
//  StarterProject
//
//  Created by BrainStation on 2015-07-29.
//  Copyright (c) 2015 shawn-simon-developer. All rights reserved.
//

#import "ExplainerPageViewController.h"

@interface ExplainerPageViewController ()

@end

@implementation ExplainerPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) showButton:(BOOL)show
{
    if (!show) {
        [self.actionButton removeFromSuperview];
    }
}

@end
