# FLMenu
Create customized menu with you app style easily. 

# Demo
All below menu were built using this component.

![ChannelMenu](https://raw.githubusercontent.com/Just-/demo/master/channel_selector_menu_demo.gif)
![ShareMenu](https://raw.githubusercontent.com/Just-/demo/master/share_menu_demo.gif)
![ProfileMenu](https://raw.githubusercontent.com/Just-/demo/4fa40aeebc22bee2fa137d9c716e1a7d3e58327e/profile_menu_demo.gif)
![MoreMenu](https://raw.githubusercontent.com/Just-/demo/4fa40aeebc22bee2fa137d9c716e1a7d3e58327e/more_menu_demo.gif)

# How to use

- Add to your Podfile `pod 'FLMenu', :git => 'https://github.com/devenergy/FLMenu'` or copy all files to project.
- Create a new view controller with xib as **FLMenuViewController** subclass. In **Simulated metrics** set **Freeform** for *Size* menu list. *Size which you set for xib top view will be using as end size of menu*. 
- Add **UITableView** to your xib and customize xib as you want. I recommend to disable table scrolling.
- Connect this table from xib with `IBOutlet UITableView* menu` in **FLMenuViewController**
- Layout xib with autolayout as you want
- Implement abstract methods in **FLMenuViewController** subclass
```
- (NSInteger)numberOfRows;
- (void)didMenuSelectAtIndexPath:(NSIndexPath*)indexPath;
- (void)configureCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath;
```
- Import **UIViewController+FLMenuPresenter.h** category.
- Load your custom menu controller when you want and show it like in below example.

```
FLCardMoreMenuController* moreMenu = [[FLCardMoreMenuController alloc] initWithNibName:@"FLCardMoreMenuViewController" bundle:nil];
moreMenu.shouldStopNotifications = shouldStopNotifications;
moreMenu.roomId = roomId;
[self fl_showMenu:moreMenu];
```

Well, all done! 

Optionally, you can create custom cell and set `cellNibName` and change selection color with `selectionColor`. Place this customization in `viewDidLoad` of you subclass.


