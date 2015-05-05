//
//  FLMenuAnimatedTransition.m
//
//  Created by Anton Gaenko on 30.04.15.
//  Copyright (c) 2015 Futurelabs. All rights reserved.
//

#import "FLMenuAnimatedTransition.h"
#import <objc/runtime.h>

#pragma mark Category to work with overlay

@implementation UIViewController (ModalOverlay)

const NSInteger kFLMenuOverlayTag = 10004321;

- (void)fl_showOverlayInView:(UIView *)view {
    [self fl_overlayInView:view].alpha = 0.6f;
}

// return overlay by specific tag
- (UIView*)fl_overlayInView:(UIView*)view {
    UIView* overlay;
    
    for (UIView* ch in view.subviews) {
        if (ch.tag == kFLMenuOverlayTag) overlay = ch;
    }
    
    if (!overlay) {
        overlay = [UIView new];
        overlay.tag = kFLMenuOverlayTag;
        overlay.frame = view.bounds;
        overlay.backgroundColor = [UIColor blackColor];
    }
    
    return overlay;
}

- (void)fl_hideOverlayInView:(UIView *)view {
    [self fl_overlayInView:view].alpha = 0.0f;
}

- (void)fl_removeOverlayInView:(UIView *)view {
    [[self fl_overlayInView:view] removeFromSuperview];
}

// add touch handler for overlay
- (void)fl_handleOverlayTapInSuperview:(UIView*)view {
    UITapGestureRecognizer *singleFingerTap =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTap:)];
    [[self fl_overlayInView:view] addGestureRecognizer:singleFingerTap];
}

- (void)handleSingleTap:(id)recognizer {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end


#pragma mark Animated transition implementation

@implementation FLMenuAnimatedTransition

-(NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    return 0.35f;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    // grab objects from context
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    UIView* toView = toViewController.view;
    UIView* fromView = fromViewController.view;
    UIView *containerView = [transitionContext containerView];
    
    
    CGRect slice, menuRect;
    
    // special actions if presented
    if (self.isPresenting) {
        [containerView addSubview:[toViewController fl_overlayInView:containerView]];
        // hide because will show animated
        [toViewController fl_hideOverlayInView:containerView];
        
        [containerView addSubview:toView];
        
        NSInteger menuHeight = CGRectGetHeight(toView.bounds);
        CGRectDivide(containerView.frame, &menuRect, &slice, menuHeight, CGRectMaxYEdge);
        toView.frame = CGRectOffset(menuRect, 0, menuHeight);
        
        // move menu under the bottom
        toView.frame = CGRectOffset(toView.frame, 0, CGRectGetHeight(containerView.bounds));
        
        [toViewController fl_handleOverlayTapInSuperview:containerView];
    }
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext]
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         if (self.isPresenting) {
                             toView.frame = menuRect;
                             [toViewController fl_showOverlayInView:containerView];
                         } else {
                             [toViewController fl_hideOverlayInView:containerView];
                             fromView.frame = CGRectOffset(fromView.frame, 0, CGRectGetHeight(fromView.frame));
                         }
                     } completion:^(BOOL finished) {
                         if (!self.isPresenting) {
                             [fromView removeFromSuperview];
                             [toViewController fl_removeOverlayInView:containerView];
                         }
                         
                         [transitionContext completeTransition:finished];
                     }];
}

@end



