//
//  CustomBarButon.h
//  4Fun
//
//  Created by GMO on 11/15/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomLeftMenu.h"

typedef NS_ENUM(NSInteger, NavigationButtonType){
    NavigationButtonTypeNone = -1,
    NavigationButtonTypeMenu = 0,
    NavigationButtonTypeBack = 1,
    NavigationButtonTypeClose = 2
};
enum ACTION_TYPE {
    ACTION_MENU,
    ACTION_CLOSE,
    ACTION_BACK
};

@interface CustomBarButon : UIBarButtonItem {
//    CustomLeftMenu *leftMenu;
}

@property (strong,nonatomic) UIButton *btn;
@property (nonatomic,unsafe_unretained)int type;

- (id) init:(int)type position:(int)position;
@end
