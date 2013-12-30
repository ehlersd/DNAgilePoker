//
//  DesktopViewController.m
//  Application
//
//  Created by Darren Ehlers on 12/13/2013.
//  Copyright (c) 2013 DoubleNode, LLC. All rights reserved.
//

#import "UIStoryboard+StoryboardInitializer.h"

#import "DesktopViewController.h"

#import "LOGWelcomeViewController.h"
#import "iPhoneRootViewController.h"
#import "iPadRootViewController.h"

#import "AppDelegate.h"

@interface DesktopViewController ()

@end

@implementation DesktopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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

- (void)viewDidAppear:(BOOL)animated
{
#if CREATING_SCREENSHOTS
    return;
#endif

    if ([AppDelegate isRunningUnitTests] == YES)
    {
    }
    else
    {
        if (self.welcomeVC == nil)
        {
            __block UIStoryboard*       storyboard          = self.storyboard;
            __block UIViewController*   parentController    = self;

            self.welcomeVC   = [[LOGWelcomeViewController alloc] initWithNibName:nil bundle:nil];
            self.welcomeVC.loginBlock   = ^(LOGWelcomeViewController* viewController)
            {
                UIViewController*   newController;

                if ([DNUtilities isDeviceIPad] == YES)
                {
                    newController   = [storyboard instanceWithClass:[iPadRootViewController class]];
                }
                else
                {
                    newController   = [storyboard instanceWithClass:[iPhoneRootViewController class]];
                }
                
                [parentController presentViewController:newController
                                               animated:YES
                                             completion:nil];
            };

            // for clear color or you can easily adjust the alpha here
            self.welcomeVC.view.backgroundColor = [UIColor clearColor];
            self.modalPresentationStyle = UIModalPresentationCurrentContext;

            [self presentViewController:self.welcomeVC
                               animated:NO
                             completion:nil];
        }
    }
}

@end
