//
//  UIViewController+FLMenuPresenter.m
//
//  Created by Anton Gaenko on 30.04.15.
//  Copyright (c) 2015 Futurelabs. All rights reserved.
//

#import "UIViewController+FLMenuPresenter.h"
#import "FLMenuViewController.h"
#import "FLMenuAnimatedTransition.h"

@implementation UIViewController (FLMenuPresenter)

- (void)fl_showMenu:(FLMenuViewController*)menuViewController {
    menuViewController.transitioningDelegate = self;
    menuViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:menuViewController animated:YES completion:nil];
}

#pragma mark Transition delegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source {
    
    FLMenuAnimatedTransition* animator = [FLMenuAnimatedTransition new];
    animator.isPresenting = YES;
    return animator;
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed {
    FLMenuAnimatedTransition* animator = [FLMenuAnimatedTransition new];
    return animator;
}

@end
