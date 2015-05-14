//
//  FrameByFrameVC.m
//  Animations
//
//  Created by Diego Mazzone on 14/5/15.
//  Copyright (c) 2015 Mundo Mac. All rights reserved.
//

#import "FrameByFrameVC.h"

@interface FrameByFrameVC ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation FrameByFrameVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *images = [@[] mutableCopy];
    
    for (int i = 1; i <=10 ; i++) {
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"image-%d", i] ]];
    }
    
    self.imageView.animationImages = images;
    self.imageView.animationDuration = 0.25;
    [self.imageView startAnimating];
    
}

@end
