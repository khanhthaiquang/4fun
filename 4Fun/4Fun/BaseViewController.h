//
//  FirstViewController.h
//  4Fun
//
//  Created by GMO on 11/15/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomBarButon.h"
#import "CustomLeftMenu.h"
#import "CustomImage.h"
#import "ListStudent.h"
@interface BaseViewController : UIViewController {
    CustomBarButon *leftBarItem;
    CustomBarButon *rightBarItem;
    CustomLeftMenu *menu;
}

@property (nonatomic,readonly, unsafe_unretained) enum NavigationButtonType leftButton;
@property (nonatomic, readonly, unsafe_unretained) enum NavigationButtonType rightButton;
@end
