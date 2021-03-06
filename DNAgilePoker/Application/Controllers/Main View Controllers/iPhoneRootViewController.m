//
//  iPhoneRootViewController.m
//  Application
//
//  Created by Darren Ehlers on 12/13/2013.
//  Copyright (c) 2013 DoubleNode, LLC. All rights reserved.
//

#import "UIStoryboard+StoryboardInitializer.h"

#import "MenuViewController.h"
#import "iPhoneRootViewController.h"

#import "NavigationViewController.h"

@interface iPhoneRootViewController ()

@end

@implementation iPhoneRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)awakeFromNib
{
    NavigationViewController*   navViewController  = [self.storyboard instanceWithClass:[NavigationViewController class]];
    navViewController.rootViewController    = self;

    self.contentViewController  = navViewController;
    self.menuViewController     = [self.storyboard instanceWithClass:[MenuViewController class]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
