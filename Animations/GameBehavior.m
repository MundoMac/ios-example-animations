//
//  GameBehavior.m
//  Animations
//
//  Created by Diego Mazzone on 5/5/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import "GameBehavior.h"

@interface GameBehavior ()

@property (strong, nonatomic) UIGravityBehavior *gravity;
@property (strong, nonatomic) UICollisionBehavior *collider;
@property (strong, nonatomic) UIDynamicItemBehavior *itemBehavoir;

@end

@implementation GameBehavior

- (instancetype)init
{
    self = [super init];
    [self addChildBehavior:self.gravity];
    [self addChildBehavior:self.collider];
    [self addChildBehavior:self.itemBehavoir];
    return self;
}

- (UIDynamicItemBehavior *)itemBehavoir
{
    if (!_itemBehavoir) {
        _itemBehavoir = [UIDynamicItemBehavior new];
        _itemBehavoir.elasticity = 0.5;
        _itemBehavoir.allowsRotation = NO;
    }
    
    return _itemBehavoir;
}

// Lazy instantiation
- (UIGravityBehavior *)gravity
{
    if (!_gravity) {
        _gravity = [UIGravityBehavior new];
        _gravity.magnitude = 0.9;
    }
    
    return _gravity;
}

// Lazy instantiation
- (UICollisionBehavior *)collider
{
    if (!_collider) {
        _collider = [UICollisionBehavior new];
        _collider.translatesReferenceBoundsIntoBoundary = YES;
    }
    
    return _collider;
}

- (void)addItem:(id<UIDynamicItem>)item
{
    [self.gravity addItem:item];
    [self.collider addItem:item];
    [self.itemBehavoir addItem:item];
}

- (void)removeItem:(id<UIDynamicItem>)item
{
    [self.gravity removeItem:item];
    [self.collider removeItem:item];
    [self.itemBehavoir removeItem:item];
}

@end
