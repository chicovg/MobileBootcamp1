//
//  ViewController.m
//  MobileBootcamp1
//
//  Created by Victor Guthrie on 7/9/15.
//  Copyright (c) 2015 Victor Guthrie. All rights reserved.
//

#import "ViewController.h"
#import "Constants.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSMutableArray *appHistArray = [defaults mutableArrayValueForKey:APP_HISTORY_KEY];
    if(nil == appHistArray) {
        appHistArray = [[NSMutableArray alloc] init];
    }
    [appHistArray addObject:[[NSDate alloc] init]];
    [defaults setObject:[[NSArray alloc] initWithArray:appHistArray] forKey:APP_HISTORY_KEY];
    [defaults synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
