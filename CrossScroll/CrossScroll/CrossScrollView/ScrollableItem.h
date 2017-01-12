//
//  ScrollableItem.h
//  Pr2
//
//  Created by Qingxin Xuan on 9/10/12.
//  Copyright (c) 2012 Qingxin Xuan. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum eItemType
{
    BOOK,
    LESSON,
    TEACHER,
    STUDENT,
} ITEM_TYPE;

@interface ScrollableItem : NSObject
@property (nonatomic, strong) NSString*     title;
@property (nonatomic, strong) NSString*     thumbnailURL;
@property (nonatomic, strong) UIImage*      thumbnail;
@property (nonatomic, assign) NSInteger     type;
@end
