//
//  Group.m
//  Pr2
//
//  Created by Qingxin Xuan on 9/18/12.
//  Copyright (c) 2012 Qingxin Xuan. All rights reserved.
//

#import "Group.h"

@implementation Group
@synthesize items;

- (id) init
{
    self = [super init];
    if (self) {
        self.items = [NSMutableArray new];
    }
    return self;
}
@end
