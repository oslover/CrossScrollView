//
//  ItemAddNew.m
//  Pr2
//
//  Created by Qingxin Xuan on 9/10/12.
//  Copyright (c) 2012 Qingxin Xuan. All rights reserved.
//

#import "ItemAddNew.h"

@implementation ItemAddNew
- (id) init
{
    self = [super init];
    if (self) {
        self.title = @"Add New";
        self.thumbnail = [UIImage imageNamed: @"add_new_item.png"];
    }
    return self;
}
@end
