//
//  UIView+Capture.m
//  Pr2
//
//  Created by Qingxin Xuan on 9/18/12.
//  Copyright (c) 2012 Qingxin Xuan. All rights reserved.
//

#import "UIView+Capture.h"
#import "QuartzCore/QuartzCore.h"

@implementation UIView (Capture)

+ (UIImage *) imageWithView:(UIView *)view
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.opaque, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

- (UIImage*) captureImage
{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;    
}
@end
