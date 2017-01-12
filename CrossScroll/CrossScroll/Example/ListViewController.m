//
//  ListViewController.m
//  Pr2
//
//  Created by Qingxin Xuan on 9/10/12.
//  Copyright (c) 2012 Qingxin Xuan. All rights reserved.
//

#import "ListViewController.h"
#import "ScrollableItem.h"
#import "CrossScrollView.h"
#import "Group.h"
#import "ItemAddNew.h"

@interface ListViewController ()

@end

@implementation ListViewController
@synthesize scrollView;
@synthesize btnOrganize;
@synthesize imagePicker;

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
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.scrollView.delegate = self;
 
    NSMutableArray* urls = [NSMutableArray arrayWithObjects: 
                             @"http://t1.baidu.com/it/u=4077980072,1067408357&fm=15&gp=0.jpg",
                             @"http://search.bibf.net/img_ebibf_product/680fbd98-b7a4-44e2-9632-e284296b1044.jpg",
                             @"http://edu.sina.com.cn/en/2002-09-05/3_42-31-915-318_20020905133632.jpg",
                             @"http://t2.baidu.com/it/u=2566853133,1377633016&fm=15&gp=0.jpg",
                             @"http://t2.baidu.com/it/u=749339782,3559082053&fm=15&gp=0.jpg",
                             @"http://www.bigapple1.info/file/9781414301587.jpg",
                             @"http://images.owneriq.net/download/images/9/97c18054-68e6-4be6-83cd-eb74a368acc9-000001.png",
                             @"http://www.bigapple1.info/file/0006172474.jpg",
                             @"http://www.bigapple1.info/file/9780753468135.jpg",
                             @"http://t1.baidu.com/it/u=1103548642,3214434129&fm=15&gp=0.jpg",
                             @"http://t2.baidu.com/it/u=694138152,2019044686&fm=15&gp=0.jpg",
                             @"http://t1.baidu.com/it/u=4077980072,1067408357&fm=15&gp=0.jpg",
                             @"http://www.bigapple1.info/file/01240007B14538.jpg",
                             @"http://t1.baidu.com/it/u=3909196203,4147801471&fm=15&gp=0.jpg",
                             @"http://news.xinhuanet.com/book/2003-09/27/xinsrc_e1de8cdb505b439a9d618796b851c004.jpg",
                             @"http://t1.baidu.com/it/u=2287264904,52663072&fm=15&gp=0.jpg",
                             @"http://img.bimg.126.net/photo/DE49Ikhkgr8GbG2XSqVljw==/2032530806828154134.jpg",
                             @"http://ec4.images-amazon.com/images/I/51sNJApVTUL._SS500_.jpg",
                             @"http://www.reader8.cn/data/uploadfile/book/uploadfile/201004/20100421072318356.jpg",
                             @"http://www.bigapple1.info/file/9781843583608.jpg",
                             @"http://www.bigapple1.info/file/0571224733.jpg",
                             @"http://www.bigapple1.info/file/9781926607085.jpg",
                             @"http://www.bigapple1.info/file/04560010B34577.jpg",
                             @"http://t3.baidu.com/it/u=2094099892,2748246158&fm=15&gp=0.jpg",
                             @"http://www.bigapple1.info/file/9781414301563.jpg",
                             @"http://www.bigapple1.info/file/00110908B30039.jpg",
                             @"http://t1.baidu.com/it/u=828898761,1929088320&fm=15&gp=0.jpg",
                             @"http://www.bigapple1.info/file/02351511b45477.jpg",
                             @"http://t1.baidu.com/it/u=890952113,2676733327&fm=15&gp=0.jpg",
                             @"http://t1.baidu.com/it/u=2853922144,2479943646&fm=15&gp=0.jpg", nil];
    
    int urlCount = [urls count];
    
    NSMutableArray* array = [NSMutableArray array];
    for (int i=0; i<50; i++) {
        ScrollableItem* item; 
        if (i%2 == 0) {
            item = [Group new];
        }
        else {
            item = [ScrollableItem new];
        }

        item.title = [NSString stringWithFormat: @"Program %d", i];
        item.thumbnailURL = [urls objectAtIndex: i%urlCount];
        [array addObject: item];
    }
    self.scrollView.userInteractionEnabled = YES;
    [self.scrollView resetWithItems: array];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

#pragma mark CrossScrollViewDelegate
- (void) itemSelected:(ScrollableItem *)item
{
    if ( UIInterfaceOrientationIsPortrait([UIApplication sharedApplication].statusBarOrientation)) {
        [[UIApplication sharedApplication] setStatusBarOrientation: UIInterfaceOrientationLandscapeLeft animated: NO];
    }
    
    if ([item isKindOfClass: [Group class]]) {
        ListViewController* pController = [ListViewController new];
        [self.navigationController pushViewController: pController animated: YES];
    }
    else if ([item isKindOfClass: [ItemAddNew class]])
    {
        [self performSelectorOnMainThread: @selector(onAddItem) withObject:nil waitUntilDone: YES];
    }
    else {
        NSLog(@"Item selected - %@", item.title);
    }
}

- (void) onAddItem
{
    AddNewItemViewController* pController = [AddNewItemViewController new];
    pController.delegate = self;
    pController.title = @"Add New";
    [self.navigationController pushViewController: pController animated: YES];
}

- (IBAction) onGoUp:(id)sender
{
    [self.navigationController popViewControllerAnimated: YES];
}

- (IBAction) onGoHome:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated: YES];
}

- (IBAction) onOrganize:(id)sender
{
    self.scrollView.isEditing = !self.scrollView.isEditing;
    if (self.scrollView.isEditing == YES) {
        [btnOrganize setTitle: @"Done"];
    }
    else {
        [btnOrganize setTitle: @"Organize"];
    }
}

#pragma AddNewItemViewControllerDelegate

- (void) itemAdded:(ScrollableItem *)item
{
    [self.scrollView addItem: item];
    [self.scrollView setNeedsLayout];
}
@end
