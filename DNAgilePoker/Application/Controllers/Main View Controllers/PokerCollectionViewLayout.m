//
//  PokerCollectionViewLayout.m
//  Application
//
//  Created by Darren Ehlers on 12/24/13.
//  Copyright (c) 2013 Table Project. All rights reserved.
//

#import "PokerCollectionViewLayout.h"

@implementation PokerCollectionViewLayout

-(id)init
{
    if (!(self = [super init])) return nil;

    self.itemSize = CGSizeMake(200.0f, 306.0f);
    self.sectionInset = UIEdgeInsetsMake(0, 60, 0, 60);
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.itemSize = CGSizeMake(200.0f, 306.0f);
        self.sectionInset = UIEdgeInsetsMake(0, 60, 0, 60);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return self;
}

@end
