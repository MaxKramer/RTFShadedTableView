//
//  UITableView+RTFShadedTableView.m
//  Sample
//
//  Created by Max Kramer on 24/06/2015.
//  Copyright (c) 2015 Max Kramer. All rights reserved.
//

#import "UITableView+RTFShadedTableView.h"
#import <objc/runtime.h>

@implementation UITableView (RTFShadedTableView)

#pragma mark - Getters

- (UIColor *)cellFromBackgroundColor {
    return objc_getAssociatedObject(self, @selector(cellFromBackgroundColor));
}

- (UIColor *)cellToBackgroundColor {
    return objc_getAssociatedObject(self, @selector(cellToBackgroundColor));
}

- (NSMutableDictionary *)cachedColors {
    id obj = objc_getAssociatedObject(self, @selector(cachedColors));
    if (obj == nil) {
        obj = [NSMutableDictionary dictionary];
        objc_setAssociatedObject(self, @selector(cachedColors), obj, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
    }
    return obj;
}

#pragma mark - Setters

- (void)setCellFromBackgroundColor:(UIColor *)cellFromBackgroundColor {
    
    UIColor *currFromColor = self.cellFromBackgroundColor;
    
    if (![currFromColor isEqual:cellFromBackgroundColor]) {
        objc_setAssociatedObject(self, @selector(cellFromBackgroundColor), cellFromBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self reloadData];
        [self.cachedColors removeAllObjects];
    }
}

- (void)setCellToBackgroundColor:(UIColor *)cellToBackgroundColor {
    
    UIColor *currFromColor = self.cellToBackgroundColor;
    if (![currFromColor isEqual:cellToBackgroundColor]) {
        
        objc_setAssociatedObject(self, @selector(cellToBackgroundColor), cellToBackgroundColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [self.cachedColors removeAllObjects];
        [self reloadData];
    }
}

#pragma mark - Background Calculation

- (UIColor *)backgroundForCellAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *key = [NSString stringWithFormat:@"%ld,%ld", (long)indexPath.section, (long)indexPath.row];
    UIColor *color = self.cachedColors[key];
    
    if (color == nil) {
        CGFloat fromH, fromS, fromB, fromA;
        [self.cellFromBackgroundColor getHue:&fromH saturation:&fromS brightness:&fromB alpha:&fromA];
        
        CGFloat toH, toS, toB, toA;
        [self.cellToBackgroundColor getHue:&toH saturation:&toS brightness:&toB alpha:&toA];
        
        float distanceH = toH - fromH;
        float distanceS = toS - fromS;
        float distanceB = toB - fromB;
        float distanceA = toA - fromA;
        
        NSUInteger count = [self.dataSource tableView:self numberOfRowsInSection:indexPath.section];
        
        if (count > 2) {
            float h, s, b, a;
            h = fromH + indexPath.row * (distanceH / count);
            s = fromS + indexPath.row * (distanceS / count);
            b = fromB + indexPath.row * (distanceB / count);
            a = fromA + indexPath.row * (distanceA / count);
            
            color = [UIColor colorWithHue:h saturation:s brightness:b alpha:a];
        }
        else {
            color = self.cellToBackgroundColor;
        }
        self.cachedColors[key] = color;
    }
    return color;
}

@end
