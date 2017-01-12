//
//  AddNewItemViewController.m
//  Pr2
//
//  Created by Qingxin Xuan on 9/20/12.
//  Copyright (c) 2012 Qingxin Xuan. All rights reserved.
//

#import "AddNewItemViewController.h"
#import "ScrollableItem.h"

@interface AddNewItemViewController ()

@end

@implementation AddNewItemViewController
@synthesize txtTitle;
@synthesize txtDescription;
@synthesize txtThumbnail;
@synthesize btnThumbnail;
@synthesize popover;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear: animated];
    self.navigationController.navigationBarHidden = NO;
}

- (void) viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear: animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction) onThumbnail:(id)sender
{
    UIImagePickerController* pController = [UIImagePickerController new];
    pController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pController.delegate = self;
    
    self.popover = [[UIPopoverController alloc] initWithContentViewController: pController];
    [self.popover presentPopoverFromRect: self.btnThumbnail.frame inView: self.view permittedArrowDirections: UIPopoverArrowDirectionAny animated: YES];
}

- (IBAction) onBack:(id)sender
{
    [self.navigationController popViewControllerAnimated: YES];
}

- (IBAction) onAdd:(id)sender
{
    if ([self.popover isPopoverVisible]) {
        [self.popover dismissPopoverAnimated: NO];
    }
    
    if ([self.txtTitle.text length] == 0 || [self.txtDescription.text length] == 0) {
        UIAlertView* alert = [[UIAlertView alloc] initWithTitle: @"Error" message: @"Please fill the required fields." delegate: self cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
        return;
    }

    ScrollableItem* item = [ScrollableItem new];    
    item.title = self.txtTitle.text;
    item.thumbnailURL = self.txtThumbnail.text;
    item.thumbnail = [self.btnThumbnail imageForState: UIControlStateNormal];    

    if (self.delegate && [self.delegate respondsToSelector: @selector(itemAdded:)]) {
        [self.delegate itemAdded: item];
    }    
    [self.navigationController popViewControllerAnimated: YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(NSDictionary *)editingInfo
{    
    if ([self.popover isPopoverVisible]) {
        [self.popover dismissPopoverAnimated: NO];
    }
    [self.btnThumbnail setImage: image forState: UIControlStateNormal];
}

@end
