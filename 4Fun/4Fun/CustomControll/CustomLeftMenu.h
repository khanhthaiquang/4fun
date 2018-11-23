//
//  CustomLeftMenu.h
//  4Fun
//
//  Created by GMO on 11/16/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomLeftMenuDelegate <NSObject>
- (void)move_page:(int)type;
@end

@interface CustomLeftMenu : UIView {
    UIView *background;
    UIScrollView *scrollView;
}
@property (strong, nonatomic) id <CustomLeftMenuDelegate> delegate;
- (void)initLayout;
- (void)showMenu;
- (void)closeMenu;
@end
