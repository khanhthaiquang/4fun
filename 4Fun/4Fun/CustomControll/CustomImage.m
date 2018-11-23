//
//  CustomImage.m
//  4Fun
//
//  Created by GMO on 11/16/18.
//  Copyright © 2018 GMO. All rights reserved.
//

#import "CustomImage.h"

@implementation CustomImage

+ (UIImage *)imageWithLocal:(NSString *)name {
    UIImage *image = [[UIImage alloc] init];
    image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",name]];
    if(!image) {
        image = [self settingLinkImage:name];
    }
    if(!image) {
        image = [self imageWithJPG:name];
    }
    return image;
}

+ (UIImage *) settingLinkImage: (NSString *)name {
    NSString *path;
    UIImage *image;
    float DEVICE_HEIGHT = [[UIScreen mainScreen] bounds].size.height;
    if (DEVICE_HEIGHT == 568.f) {
        path = [NSString stringWithFormat:@"%@_%.f.png",name,568.f];
    }
    else if(DEVICE_HEIGHT == 667.f) {
        path = [NSString stringWithFormat:@"%@_%.f.png",name,667.f];

    }
    else if (DEVICE_HEIGHT == 736.f) {
        path = [NSString stringWithFormat:@"%@_%.f.png",name,736.f];

    }
    else if (DEVICE_HEIGHT == 812.f) {
        path = [NSString stringWithFormat:@"%@_%.f.png",name,812.f];
    }
    image = [UIImage imageNamed:path];
    return image;
}

+ (UIImage *) imageWithJPG:(NSString *)name {
    NSString *path;
    UIImage *image;
    float DEVICE_HEIGHT = [[UIScreen mainScreen] bounds].size.height;
    if (DEVICE_HEIGHT == 568.f) {
        path = [NSString stringWithFormat:@"%@.jpg",name];
    }
    else if(DEVICE_HEIGHT == 667.f) {
        path = [NSString stringWithFormat:@"%@.jpg",name];
        
    }
    else if (DEVICE_HEIGHT == 736.f) {
        path = [NSString stringWithFormat:@"%@.jpg",name];
        
    }
    else if (DEVICE_HEIGHT == 812.f) {
        path = [NSString stringWithFormat:@"%@.jpg",name];
    }
    image = [UIImage imageNamed:path];
    return image;
}
@end
