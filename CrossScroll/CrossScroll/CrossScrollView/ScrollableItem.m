//
//  ScrollableItem.m
//  Pr2
//
//  Created by Qingxin Xuan on 9/10/12.
//  Copyright (c) 2012 Qingxin Xuan. All rights reserved.
//

#import "ScrollableItem.h"

@implementation ScrollableItem
@synthesize title;
@synthesize thumbnail;
@synthesize thumbnailURL;
@synthesize type;

- (id) init
{
    self = [super init];
    if (self) {
//        self.thumbnail = [UIImage imageNamed: @"no_image.png"];
    }
    return self;
}

@end
