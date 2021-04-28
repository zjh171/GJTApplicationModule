//
//  GJTAPPViewController.m
//  GJTApplicationModule
//
//  Created by zjh171 on 03/03/2021.
//  Copyright (c) 2021 zjh171. All rights reserved.
//

#import "GJTAPPViewController.h"

@interface GJTAPPViewController ()

@end

@implementation GJTAPPViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        static NSInteger index = 0;
        index++;
        self.title = [NSString stringWithFormat:@"标题%li",index];
    }
    return self;
}
- (void)viewDidLoad
{
    self.view.backgroundColor = UIColor.whiteColor;
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
