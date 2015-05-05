//
//  UIViewController+FLMenuPresenter.h
//
//  Created by Anton Gaenko on 30.04.15.
//  Copyright (c) 2015 Futurelabs. All rights reserved.
//

@class FLMenuViewController;

@interface UIViewController (FLMenuPresenter)<UIViewControllerTransitioningDelegate>

/**
 *  Show you custom menu controller over current view controller
 *
 *  @param menuViewController Custrom menu controller subclass
 */
- (void)fl_showMenu:(FLMenuViewController*)menuViewController;

@end
