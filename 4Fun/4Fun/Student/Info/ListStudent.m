//
//  ListStudent.m
//  4Fun
//
//  Created by GMO on 11/21/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import "ListStudent.h"

@implementation ListStudent

- (id) init{
    self = [super init];
    if(self) {
        [self initLayout];
    }
    return self;
}

- (void)initLayout {
    UILabel *lableStudent = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    lableStudent.text = @"List Student In Database";
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDelay:0.5];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
}
@end
