//
//  MainViewController.m
//  Application
//
//  Created by Darren Ehlers on 12/13/2013.
//  Copyright (c) 2013 DoubleNode, LLC. All rights reserved.
//

#import "MainViewController.h"

#import "NavigationViewController.h"
#import "LOGWelcomeViewController.h"

#import "DNUtilities.h"
#import "AppDelegate.h"

#import "UIScrollView+ScrollDirection.h"
#import "RVCollectionViewLayout.h"
#import "RVCollectionViewCell.h"

@interface MainViewController ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate>
{
    UIStatusBarStyle    statusBarStyle;

    double  navBarHeight;
    double  navBarPosition;
    double  navBarOffset;

    CGPoint lastContentOffset;
}

@property (weak, nonatomic) IBOutlet UICollectionView*  colCards;

@property (nonatomic, strong) NSMutableArray*           imagesArray;
@property (nonatomic, strong) NSMutableArray*           imageNamesArray;
@property (nonatomic, strong) RVCollectionViewLayout*   collectionViewLayout;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        // Custom initialization
    }
    return self;
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return statusBarStyle;
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    statusBarStyle  = UIStatusBarStyleDefault;

    navBarHeight    = 64.0f;
    navBarPosition  = 42.0f;
    navBarOffset    = 0.0f;

    self.automaticallyAdjustsScrollViewInsets   = YES;

    [self setNeedsStatusBarAppearanceUpdate];

    UIBarButtonItem*    menuBarItem = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"btnNavBarMenu"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                                       style:UIBarButtonItemStylePlain
                                                                      target:self
                                                                      action:@selector(menuButtonAction:)];
    [self.navigationItem setLeftBarButtonItem:menuBarItem];

    [self initImages];

    [self.colCards registerClass:[RVCollectionViewCell class] forCellWithReuseIdentifier:@"ItemIdentifier"];
    self.colCards.indicatorStyle                    = UIScrollViewIndicatorStyleWhite;
    self.colCards.showsHorizontalScrollIndicator    = NO;
    self.colCards.showsVerticalScrollIndicator      = NO;
    self.colCards.autoresizingMask                  = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
}

- (void)initImages
{
    self.imagesArray        = [NSMutableArray array];
    self.imageNamesArray    = [NSMutableArray array];

    self.imageNamesArray[0]     = @"0";
    self.imageNamesArray[1]     = @"05";
    self.imageNamesArray[2]     = @"1";
    self.imageNamesArray[3]     = @"2";
    self.imageNamesArray[4]     = @"3";
    self.imageNamesArray[5]     = @"5";
    self.imageNamesArray[6]     = @"8";
    self.imageNamesArray[7]     = @"13";
    self.imageNamesArray[8]     = @"20";
    self.imageNamesArray[9]     = @"40";
    self.imageNamesArray[10]    = @"infinity";
    self.imageNamesArray[11]    = @"unknown";
    self.imageNamesArray[12]    = @"break";

    [self.imageNamesArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop)
     {
         NSString*      imageName   = [NSString stringWithFormat:@"Cards_%@", obj];
         UIImageView*   image       = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];

         [self.imagesArray addObject:image];
     }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    [((AppDelegate*)[DNUtilities appDelegate]) addBugButton:self.view];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [((AppDelegate*)[DNUtilities appDelegate]) removeBugButton:self.view];

    [super viewWillDisappear:animated];
}

- (void)updateNavigationBarStyle
{
    statusBarStyle = UIStatusBarStyleLightContent;
    [self.navigationController setNeedsStatusBarAppearanceUpdate];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return [self.imagesArray count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView*)collectionView
                cellForItemAtIndexPath:(NSIndexPath*)indexPath
{
    RVCollectionViewCell*   cell = (RVCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"ItemIdentifier" forIndexPath:indexPath];
    cell.imageView  = self.imagesArray[indexPath.item];
    cell.imageName  = self.imageNamesArray[indexPath.item];
    return cell;
}

#pragma mark - UICollectionViewDelegate

- (void)    collectionView:(UICollectionView*)collectionView
  didSelectItemAtIndexPath:(NSIndexPath*)indexPath
{
    // implement your cell selected logic here
    UIImageView*    selectedImageView = self.imagesArray[indexPath.item];
    NSLog(@"selected image: %@", selectedImageView);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView*)scrollView
{
    NSLog(@"scrollViewDidEndDecelerating...");
    [self printCurrentCard];
}

- (void)scrollViewDidEndDragging:(UIScrollView*)scrollView
                  willDecelerate:(BOOL)decelerate
{
    if (!decelerate)
    {
        NSLog(@"scrollViewDidEndDragging...");
        [self printCurrentCard];
    }
}

- (void)printCurrentCard
{
    NSArray*    visibleCards = self.colCards.visibleCells;

    [visibleCards enumerateObjectsUsingBlock:^(RVCollectionViewCell* visibleCell, NSUInteger idx, BOOL* stop)
     {
         NSLog(@"visible cell: %@", visibleCell.imageName);
     }];
}

#pragma mark - Actions

- (void)menuButtonAction:(id)sender
{
    NavigationViewController*   navController   = (NavigationViewController*)self.navigationController;

    [navController presentMenuViewController];
}

- (IBAction)testBtn:(id)sender
{
}

@end
