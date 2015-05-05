//
//  FLMenuViewController.h
//
//  Created by Anton Gaenko on 08.04.15.
//  Copyright (c) 2015 Futurelabs. All rights reserved.
//

@interface FLMenuViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView* menu; // !!! you should connect this outlet

@property (strong, nonatomic) NSString* cellNibName; // without extension, default is FLMenuCell
@property (strong, nonatomic) UIColor* selectionColor; // default is light gray


#pragma mark Abstract methods

/**
 *  Return number of menu items
 * 
 *  @note you should provide implementation
 */
- (NSInteger)numberOfRows;

/**
 *  Handle here when user taps one of menu items. 
 *  A big chance that you want to place here code to run user selected options and dismiss menu controller.
 *
 *  @param indexPath Index of menu item
 *
 *  @note you should provide implementation
 */
- (void)didMenuSelectAtIndexPath:(NSIndexPath*)indexPath;

/**
 *  Place here code to setup menu cell. 
 *
 *  For example cell.textLabel.text = self.data[indexPath.row];
 *
 *  @param cell Will pass menu cell which you could setup
 *  @param indexPath Index of menu item
 *
 *  @note you should provide implementation
 */
- (void)configureCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath;

@end
