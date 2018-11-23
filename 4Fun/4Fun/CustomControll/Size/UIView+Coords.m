//
//  coor.m
//  4Fun
//
//  Created by GMO on 11/21/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import "UIView+Coords.h"

@implementation UIView (Coords)

- (CGFloat)left {
    return self.frame.origin.x;
}
- (void)setLeft:(CGFloat)x {
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}
-(CGFloat)top {
    return self.frame.origin.y;
}
- (void)setTop:(CGFloat)y {
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}


- (CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}


- (void)setRight:(CGFloat)right {
    CGRect frame = self.frame;
    frame.origin.x = right-self.width;
    self.frame = frame;
}

- (CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom {
    CGRect frame = self.frame;
    frame.origin.y = bottom-self.height;
    self.frame = frame;
}


- (CGFloat)width {
    return self.frame.size.width;
}


- (void)setWidth:(CGFloat)width {
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}


- (CGFloat)height {
    return self.frame.size.height;
}


- (void)setHeight:(CGFloat)height {
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}


- (void) bounce
{
    [UIView animateWithDuration:0.1
                          delay:0.0
                        options:UIViewAnimationOptionCurveLinear//UIViewAnimationCurveLinear
                     animations:^{
                         
                         self.transform = CGAffineTransformMakeScale(0.9, 0.9);
                     }
     
                     completion:^(BOOL finished) {
                         [UIView animateWithDuration:0.1
                                               delay:0.0
                                             options:UIViewAnimationOptionCurveLinear//UIViewAnimationCurveLinear
                                          animations:^{
                                              //                                              self.transform = CGAffineTransformMakeScale(0.95, 0.95);
                                              self.transform = CGAffineTransformIdentity;
                                          }
                                          completion:^(BOOL finished) {
                                              //                                              [UIView animateWithDuration:0.1
                                              //                                                               animations:^{self.transform = CGAffineTransformIdentity;}
                                              //                                               ];
                                          }
                          ];
                     }
     
     ];
}

- (void) fadeFromScale
{
    self.transform = CGAffineTransformMakeScale(0.01, 0.01);
    self.alpha = 0;
    
    [UIView animateWithDuration:0.3
                          delay:0.0
                        options:UIViewAnimationOptionCurveEaseOut//UIViewAnimationCurveEaseOut
                     animations:^{
                         
                         self.transform = CGAffineTransformIdentity;
                         self.alpha = 1;
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}
@end
