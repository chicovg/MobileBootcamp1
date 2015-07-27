//
//  AppHistoryViewController.m
//  MobileBootcamp1
//
//  Created by Victor Guthrie on 7/20/15.
//  Copyright (c) 2015 Victor Guthrie. All rights reserved.
//

#import "AppHistoryViewController.h"
#import "Constants.h"

@interface AppHistoryViewController ()

@end

@implementation AppHistoryViewController

@synthesize tableData;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSArray *datesArray = [[NSUserDefaults standardUserDefaults] arrayForKey:APP_HISTORY_KEY];
    tableData = [datesArray sortedArrayUsingComparator: ^(NSDate *d1, NSDate *d2) {
        return [d1 compare:d2];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView delegate methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return (NSInteger)tableData.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"appHistoryCell"];
    
    NSDate* date = [tableData objectAtIndex:indexPath.row];
    cell.textLabel.text = [NSDateFormatter localizedStringFromDate:date
                                                         dateStyle:NSDateFormatterLongStyle
                                                         timeStyle:NSDateFormatterLongStyle];
    return cell;
}

@end
