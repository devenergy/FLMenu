//
//  FLMenuViewController.m
//
//  Created by Anton Gaenko on 08.04.15.
//  Copyright (c) 2015 Futurelabs. All rights reserved.
//

#import "FLMenuViewController.h"

@implementation FLMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (!self.menu) {
        @throw [NSException exceptionWithName:@"You should connect menu outlet with xib table." reason:@"Failed to setup" userInfo:nil];
    }
        
    self.menu.contentInset = UIEdgeInsetsZero;
    self.menu.delegate = self;
    self.menu.dataSource = self;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.menu registerNib:[UINib nibWithNibName:self.cellNibName ? : @"FLMenuCell" bundle:nil] forCellReuseIdentifier:@"MenuCell"];
}

#pragma mark Abstract method to implement
- (NSInteger)numberOfRows {
    @throw [NSException exceptionWithName:[self abstractMehodException:NSStringFromSelector(_cmd)] reason:@"Abstract method" userInfo:nil];
}

- (void)didMenuSelectAtIndexPath:(NSIndexPath *)indexPath {
    @throw [NSException exceptionWithName:[self abstractMehodException:NSStringFromSelector(_cmd)] reason:@"Abstract method" userInfo:nil];
}

- (void)configureCell:(UITableViewCell*)cell atIndexPath:(NSIndexPath*)indexPath {
    @throw [NSException exceptionWithName:[self abstractMehodException:NSStringFromSelector(_cmd)] reason:@"Abstract method" userInfo:nil];
}

- (NSString*)abstractMehodException:(NSString*)methodName {
    return [NSString stringWithFormat:@"Menu abstract method %@ should be overrided!", methodName];
}

#pragma mark Table view delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.numberOfRows;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self didMenuSelectAtIndexPath:indexPath];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    cell.selectionStyle = UITableViewCellSelectionStyleGray;
    
    // add custom selection background
    UIView *bgColorView = [[UIView alloc] init];
    bgColorView.backgroundColor = self.selectionColor ? : [UIColor lightGrayColor];
    [cell setSelectedBackgroundView:bgColorView];
    
    [self configureCell:cell atIndexPath:indexPath];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.transform = CGAffineTransformMakeScale(0, 0);
    
    // cell animations live here
    [UIView animateWithDuration:0.25
                          delay:(0.25 + 0.1 * indexPath.row)
         usingSpringWithDamping:0.7
          initialSpringVelocity:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^{
                         cell.textLabel.transform = CGAffineTransformIdentity;
                     }
                     completion:nil];
    
}


@end
