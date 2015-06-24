//
//  UITableView+RTFShadedTableView.h
//  Sample
//
//  Created by Max Kramer on 24/06/2015.
//  Copyright (c) 2015 Max Kramer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (RTFShadedTableView)

- (UIColor *)backgroundForCellAtIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, strong) UIColor *cellFromBackgroundColor, *cellToBackgroundColor;
@property (nonatomic, strong, readonly) NSMutableDictionary *cachedColors;

@end
