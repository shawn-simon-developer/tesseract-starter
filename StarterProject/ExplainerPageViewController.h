//
//  ExplainerPageViewController.h
//  StarterProject
//
//  Created by BrainStation on 2015-07-29.
//  Copyright (c) 2015 shawn-simon-developer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExplainerPageViewController : UIViewController

@property (nonatomic) NSUInteger index;

@property (strong, nonatomic) IBOutlet UIButton *actionButton;
@property (strong, nonatomic) IBOutlet UIImageView *pageImage;

- (void) showButton:(BOOL)show;

@end
