//
//  ViewController.m
//  Animations
//
//  Created by Diego Mazzone on 5/5/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import "ViewController.h"
#import "GameBehavior.h"

@interface ViewController () <UIDynamicAnimatorDelegate>

@property (weak, nonatomic) IBOutlet UIView *gameView;

@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (strong, nonatomic) GameBehavior *gameBehavior;

@end

@implementation ViewController

static const CGSize DROP_SIZE = { 40, 40 };

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    
    [self.gameView addGestureRecognizer:tap];
}

- (void)tapHandler:(UITapGestureRecognizer *)sender
{
    [self drop];
}

- (void)drop
{
    CGRect frame;
    frame.origin = CGPointZero;
    frame.size = DROP_SIZE;
    int x = (arc4random()%(int)self.gameView.bounds.size.width) / DROP_SIZE.width;
    frame.origin.x = x * DROP_SIZE.width;
    
    UIView *squareView = [[UIView alloc] initWithFrame:frame];
    squareView.backgroundColor = [self randomColor];
    
    [self.gameView addSubview:squareView];
    [self.gameBehavior addItem:squareView];
}

- (GameBehavior *)gameBehavior
{
    if (!_gameBehavior) {
        _gameBehavior = [GameBehavior new];
        [self.animator addBehavior:_gameBehavior];
    }
    
    return _gameBehavior;
}

- (UIDynamicAnimator *)animator
{
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.gameView];
        _animator.delegate = self;
    }
    
    return _animator;
}

- (UIColor *)randomColor
{
    switch (arc4random()%5) {
        case 0: return [UIColor greenColor];
        case 1: return [UIColor blueColor];
        case 2: return [UIColor orangeColor];
        case 3: return [UIColor redColor];
        case 4: return [UIColor purpleColor];
    }
    return [UIColor blackColor];
}

@end
