//
//  CustomLeftMenu.m
//  4Fun
//
//  Created by GMO on 11/16/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import "CustomLeftMenu.h"

@implementation CustomLeftMenu

- (void)initLayout {
//    set background menu
    self.backgroundColor = [UIColor clearColor];
    background = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width / 2 + 50, self.frame.size.height)];
    background.backgroundColor = [UIColor colorWithRed:46/255.0f green:204/255.0f blue:113/255.0f alpha:1.0];
//    background.backgroundColor =[UIColor redColor];
    [self addSubview:background];
    UITapGestureRecognizer *tappp = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singletap)];
    [self addGestureRecognizer:tappp];
    
    scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, self.window.bounds.size.width, self.window.bounds.size.height)];
    scrollView.contentSize = CGSizeMake(scrollView.frame.size.width, scrollView.frame.size.height);
    [background addSubview:scrollView];
    [self setHidden:YES];
//  set item menu
    
    UILabel *lableMenu = [[UILabel alloc]initWithFrame:CGRectMake(background.frame.size.width/2 - 20, 0, self.frame.size.width, 50)];
    lableMenu.text = @"MENU";
    lableMenu.font = [UIFont fontWithName:@"Helvetica-Bold" size:15.0];
    
    [background addSubview:lableMenu];
   
    UIView *darkView = [[UIView alloc] init];
    darkView.frame = CGRectMake(0, lableMenu.frame.origin.y + 20, background.frame.size.width, background.frame.size.height);
    
    
}

- (void) singletap {
    [self closeMenu];
}

- (void)showMenu {
//    if (scrollView.leftAnchor == 0) {
//        [self close_menu];
//        return;
//    }
    [self setHidden:NO];
    CGRect rec = background.frame;
    rec.origin.x = 0;
    [UIView animateWithDuration:1.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                         background.frame = rec;
                     } completion:^(BOOL finished) {
                     }];
}

-(void)closeMenu {
    [self setHidden:YES];
    [UIView animateWithDuration:1.0f
                          delay:1.0f options:UIViewAnimationOptionCurveEaseIn
                     animations:^{
                     } completion:^(BOOL finished) {
                     }];
}
@end
