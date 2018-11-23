//
//  CustomBarButon.m
//  4Fun
//
//  Created by GMO on 11/15/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import "CustomBarButon.h"
#import "CustomImage.h"

@implementation CustomBarButon

- (id) init: (int)type position:(int) position {
    self = [super init];
    if(self) {
        [self initLayout:type position:position];
    }
    return self;
}

- (void) initLayout: (int)type position:(int) position {
    self.type = type;
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image;
    NSString *imageName;
    switch (type) {
        case NavigationButtonTypeMenu:
            imageName = @"menu";
            _btn.tag = NavigationButtonTypeMenu;
            break;
        case NavigationButtonTypeBack:
            imageName = @"back";
            break;
        case NavigationButtonTypeClose:
            imageName = @"close";
            break;
        default:
            break;
    }
    image = [CustomImage imageWithLocal:imageName];
    [_btn setBackgroundImage:image forState:UIControlStateNormal];
    _btn.frame = CGRectMake(0, 0, 35, 35);
    UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 35, 35)];
    btnView.backgroundColor = [UIColor clearColor];
    [btnView addSubview:_btn];
    [self setCustomView:btnView];
}
@end
