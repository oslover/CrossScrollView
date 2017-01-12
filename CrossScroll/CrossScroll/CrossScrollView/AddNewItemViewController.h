//
//  AddNewItemViewController.h
//  Pr2
//
//  Created by Qingxin Xuan on 9/20/12.
//  Copyright (c) 2012 Qingxin Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollableItem;

@protocol AddNewItemViewControllerDelegate <NSObject>
- (void) itemAdded: (ScrollableItem*) item;
@end

@interface AddNewItemViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property (nonatomic, strong) IBOutlet UITextField*     txtTitle;
@property (nonatomic, strong) IBOutlet UITextField*     txtDescription;
@property (nonatomic, strong) IBOutlet UITextField*     txtThumbnail;
@property (nonatomic, strong) IBOutlet UIButton*        btnThumbnail;
@property (nonatomic, strong) UIPopoverController*      popover;
@property (nonatomic, strong) id<AddNewItemViewControllerDelegate>  delegate;
@end
