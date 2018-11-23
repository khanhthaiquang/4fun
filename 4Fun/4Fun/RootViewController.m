//
//  ViewController.m
//  4Fun
//
//  Created by GMO on 11/15/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTopNavigation];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
 
}
- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initTopNavigation {
    BaseViewController *Frs = [[BaseViewController alloc] init];
    navController = [[UINavigationController alloc] initWithRootViewController:Frs];
    navController.navigationBar.barTintColor = [UIColor colorWithRed:46/255.0f green:204/255.0f blue:113/255.0f alpha:1.0];
    navController.navigationBar.translucent = NO;
    navController.navigationBar.topItem.title = @"App Cuar Khanhs";
    [self.view addSubview:navController.view];
}
- (BOOL)prefersStatusBarHidden {
    return YES;
}
@end
