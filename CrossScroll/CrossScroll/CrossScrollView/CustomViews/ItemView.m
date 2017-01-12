//
//  ItemView.m
//  Pr2
//
//  Created by Qingxin Xuan on 9/10/12.
//  Copyright (c) 2012 Qingxin Xuan. All rights reserved.
//

#import "ItemView.h"
#import "ScrollableItem.h"

@implementation ItemView
@synthesize imgThumbnail;
@synthesize lblTitle;
@synthesize activity;
@synthesize item;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) resetWithItem: (ScrollableItem*) sItem
{
    self.item = sItem;
    self.lblTitle.text = self.item.title;
    
    if (self.item.thumbnail) {
        self.imgThumbnail.image = self.item.thumbnail;
    }
//    else {
//        if (self.item.thumbnailURL != nil) {
//            [self.activity startAnimating];
//            [NSThread detachNewThreadSelector: @selector(loadImage:) toTarget:self withObject: self.item.thumbnailURL];
//        }
//    }
}

- (void) loadImage: (NSString*) url
{
    @autoreleasepool {
        NSData* data = [NSData dataWithContentsOfURL: [NSURL URLWithString: url]];
        UIImage* image = [UIImage imageWithData: data];
        if (image == nil) {
            image = [UIImage imageNamed: @"no_image.png"];
        }
        
        [self.imgThumbnail performSelectorOnMainThread: @selector(setImage:) withObject:image waitUntilDone: NO];
        [self.activity performSelectorOnMainThread: @selector(stopAnimating) withObject:nil waitUntilDone: NO];
    }
}



@end
