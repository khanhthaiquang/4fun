//
//  FirstViewController.m
//  4Fun
//
//  Created by GMO on 11/15/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    leftBarItem = [[CustomBarButon alloc] init:0 position:1];
    self.navigationItem.leftBarButtonItem = leftBarItem;
    [leftBarItem.btn addTarget:self action:@selector(move_page:) forControlEvents:UIControlEventTouchDown];
    
    [self initLayout];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) initLayout {
    UIImageView *slideView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    UIImage *image1 = [CustomImage imageWithLocal:@"student1"];
    UIImage *image2 = [CustomImage imageWithLocal:@"student2"];
    UIImage *image3 = [CustomImage imageWithLocal:@"student3"];
    UIImage *image4 = [CustomImage imageWithLocal:@"student4"];
    NSArray *arrImage = [[NSArray alloc] initWithObjects:image1, image2, image3, image4, nil];
    slideView.animationImages = arrImage;
    slideView.animationDuration = 10;
    slideView.animationRepeatCount = 0;
    [slideView startAnimating];
    [self.view addSubview:slideView];
    UIView *viewShowList = [[UIView alloc] initWithFrame:CGRectMake(15, slideView.frame.size.height + 50, self.view.frame.size.width - 30, 50)];
    UIButton *btn_listStudent = [[UIButton alloc]init];
    btn_listStudent.layer.cornerRadius = 3.0;
    btn_listStudent.layer.borderWidth = 2.0;
    btn_listStudent.layer.borderColor = [[UIColor clearColor] CGColor];
    btn_listStudent.layer.shadowColor = [UIColor colorWithRed:(100.0f/255.0f) green:0.0 blue:0.0 alpha:1.0].CGColor;
    btn_listStudent.layer.shadowOpacity = 1.0f;
    btn_listStudent.layer.shadowRadius = 1.0f;
    btn_listStudent.layer.shadowOffset = CGSizeMake(0, 3);
    
    UIImage *image = [CustomImage imageWithLocal:@"list"];
    btn_listStudent.frame = CGRectMake(15, slideView.frame.size.height + 50, self.view.frame.size.width, image.size.height);
    [btn_listStudent setImage:image forState:UIControlStateNormal];
    
    UILabel *lableShow = [[UILabel alloc] initWithFrame:CGRectMake(btn_listStudent.frame.origin.x + 20, btn_listStudent.frame.origin.y + btn_listStudent.frame.size.height + 10, viewShowList.frame.size.width, viewShowList.frame.size.height)];
    lableShow.text = @"Show List Student In Database";
    [viewShowList addSubview:btn_listStudent];
    [viewShowList addSubview:lableShow];
    [self.view addSubview:viewShowList];
    
//    [self.view addSubview:btn_listStudent];
}
- (void)move_page:(int)type {
    NSLog(@"menu");
    menu = [[CustomLeftMenu alloc] initWithFrame:CGRectMake(0, 0, self.view.window.bounds.size.width, self.view.window.bounds.size.height)];
    [menu initLayout];
    [self.view addSubview:menu];
    [menu showMenu];

}
@end
