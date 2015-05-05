//
//  FLMenuAnimatedTransition.h
//
//  Created by Anton Gaenko on 30.04.15.
//  Copyright (c) 2015 Futurelabs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FLMenuAnimatedTransition : NSObject<UIViewControllerAnimatedTransitioning>

// mark if this transition for presenting or dismissing menu controller
@property (assign, nonatomic) BOOL isPresenting;

@end
