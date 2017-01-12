//
//  ListViewController.h
//  Pr2
//
//  Created by Qingxin Xuan on 9/10/12.
//  Copyright (c) 2012 Qingxin Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CrossScrollView.h"
#import "AddNewItemViewController.h"

@interface ListViewController : UIViewController <CrossScrollViewDelegate, AddNewItemViewControllerDelegate>
@property (nonatomic, strong) IBOutlet CrossScrollView* scrollView;
@property (nonatomic, strong) IBOutlet UIBarButtonItem* btnOrganize;

@property (nonatomic, strong) UIPopoverController*      imagePicker;
@end
