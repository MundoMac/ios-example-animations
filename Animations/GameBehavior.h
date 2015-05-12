//
//  GameBehavior.h
//  Animations
//
//  Created by Diego Mazzone on 5/5/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameBehavior : UIDynamicBehavior

- (void)addItem:(id <UIDynamicItem>)item;
- (void)removeItem:(id <UIDynamicItem>)item;

@end
