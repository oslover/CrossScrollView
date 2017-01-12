//
//  UIView+Capture.h
//  Pr2
//
//  Created by Qingxin Xuan on 9/18/12.
//  Copyright (c) 2012 Qingxin Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Capture)

+ (UIImage *) imageWithView:(UIView *)view;
- (UIImage*) captureImage;

@end
