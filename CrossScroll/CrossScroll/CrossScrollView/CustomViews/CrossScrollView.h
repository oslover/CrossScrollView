//
//  CrossScrollView.h
//  Pr2
//
//  Created by Qingxin Xuan on 9/10/12.
//  Copyright (c) 2012 Qingxin Xuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ScrollableItem;
@class ItemView;

@protocol CrossScrollViewDelegate <NSObject>
@optional
- (void) itemSelected: (ScrollableItem*) item;
@end

@interface CrossScrollView : UIView
@property (nonatomic, strong) NSMutableArray*           items;

@property (nonatomic, strong) UIScrollView*    horzScrollView;
@property (nonatomic, strong) UIScrollView*    vertScrollView;

@property (nonatomic, assign) UIScrollView*    activeScrollView;
@property (nonatomic, assign) ItemView*        activeItemView;

@property (nonatomic, assign) UIScrollView*    inActiveScrollView;

@property (nonatomic, strong) UIImageView*          shadowView;

@property (nonatomic, assign) CGFloat     horzGap;
@property (nonatomic, assign) CGFloat     vertGap;

@property (nonatomic, assign) NSInteger     horzCount;
@property (nonatomic, assign) NSInteger     vertCount;

@property (nonatomic, assign) NSInteger     curPage;
@property (nonatomic, assign) NSInteger     numberOfPages;

@property (nonatomic, assign) BOOL          isEditing;

@property (nonatomic, strong) id<CrossScrollViewDelegate> delegate;

- (void) resetWithItems: (NSMutableArray*) aItems;
- (void) addItem: (ScrollableItem*) item;
@end
