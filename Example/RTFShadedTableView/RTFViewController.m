//
//  RTFViewController.m
//  RTFShadedTableView
//
//  Created by Max Kramer on 06/24/2015.
//  Copyright (c) 2014 Max Kramer. All rights reserved.
//

#import "RTFViewController.h"
#import "UITableView+RTFShadedTableView.h"

@interface RTFViewController ()

@end

@implementation RTFViewController

- (void)viewDidLoad {
    [self.tableView setSeparatorColor:[UIColor clearColor]];
    [self.tableView setCellToBackgroundColor:[UIColor greenColor]];
    [self.tableView setCellFromBackgroundColor:[UIColor orangeColor]];
    [super viewDidLoad];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    UIColor *color = [self.tableView backgroundForCellAtIndexPath:indexPath];
    [cell setBackgroundColor:color];
    [cell.textLabel setText:[NSString stringWithFormat:@"Row %ld", indexPath.row]];
    
    return cell;
}

@end
