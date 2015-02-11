//
//  PopViewController.m
//  OCDemo
//
//  Created by WuNan on 14/12/2.
//  Copyright (c) 2014年 信通惠德. All rights reserved.
//

#import "PopViewController.h"
#import <pop/POP.h>

@interface PopViewController ()
{
    BOOL _isMoved;
}
@end

@implementation PopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIView * v1 = [[UIView alloc]initWithFrame:CGRectMake(200, 200, 50, 50)];
    v1.tag = 100;
    [v1 setBackgroundColor:[UIColor redColor]];
    [self.view addSubview:v1];
    
    UITapGestureRecognizer * gestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    [self.view addGestureRecognizer:gestureRecognizer];
}
-(void)tap:(NSObject*)sender
{
    _isMoved = !_isMoved;
    POPSpringAnimation * frameAnimation = [POPSpringAnimation animationWithPropertyNamed:kPOPLayerPosition];
    frameAnimation.springBounciness = 15;
    frameAnimation.springSpeed = 20;
    
    POPBasicAnimation * colorAnimation = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];

    colorAnimation.duration = 0.5;
    
    if (_isMoved) {
        colorAnimation.fromValue = [UIColor redColor];
        colorAnimation.toValue = [UIColor blueColor];
        frameAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    }
    else{
        colorAnimation.toValue = [UIColor redColor];
        colorAnimation.fromValue = [UIColor blueColor];
        frameAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    }
    UIView * view = [self.view viewWithTag:100];
    [view pop_addAnimation:frameAnimation forKey:@"frame"];
    [view pop_addAnimation:colorAnimation forKey:@"color"];
}
@end
