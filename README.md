# RTFShadedTableView

Like Clear, the to-do list manager for iOS, RTFShadedTableView creates consecutively shaded UITableViewCell background colors.

![](https://raw.githubusercontent.com/MaxKramer/RTFShadedTableView/master/Screenshot.png)

### Installation

Install via Cocoapods:

    pod 'RTFShadedTableView'

### Usage

	// Import the category:
	#import "UITableView+RTFShadedTableView.h"
	
	...
	
	// Set the to and from background colours
	[self.tableView setCellToBackgroundColor:[UIColor greenColor]];
    [self.tableView setCellFromBackgroundColor:[UIColor orangeColor]];
    
    // Set the cell's background colours to the shade
    - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        ...

        UIColor *color = [self.tableView ackgroundForCellAtIndexPath:indexPath];
        [cell setBackgroundColor:color];

        ...
    }