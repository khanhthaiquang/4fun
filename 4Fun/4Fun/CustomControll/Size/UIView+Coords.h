//
//  coor.h
//  4Fun
//
//  Created by GMO on 11/21/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Coords)


@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;


- (void) bounce;
- (void) fadeFromScale;

@end
