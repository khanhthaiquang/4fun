//
//  StudentViewController.m
//  4Fun
//
//  Created by GMO on 11/21/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import "StudentViewController.h"

@interface StudentViewController ()

@end

@implementation StudentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initLayout];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initLayout {
    ListStudent *listStudent = [[ListStudent alloc] init];
    [self.view addSubview:listStudent];
}

@end
