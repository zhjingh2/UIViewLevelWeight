//
//  ViewController.m
//  UIViewLevelWeight
//
//  Created by 张竞豪 on 2020/2/15.
//  Copyright © 2020 张竞豪. All rights reserved.
//

#import "ViewController.h"
#import "UIView+LevelWeight.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 100, 100)];
    view1.backgroundColor = [UIColor redColor];

    UIView *view2 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view2.backgroundColor = [UIColor yellowColor];
    
    UIView *view3 = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
    view3.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:view3 levelWeight:3];
    [self.view addSubview:view1 levelWeight:1];
    [self.view addSubview:view2 levelWeight:2];
}


@end
