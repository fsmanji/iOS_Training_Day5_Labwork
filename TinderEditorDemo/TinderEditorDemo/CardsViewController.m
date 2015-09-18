//
//  CardsViewController.m
//  TinderEditorDemo
//
//  Created by Cristan Zhang on 9/18/15.
//  Copyright (c) 2015 FastTrack. All rights reserved.
//

#import "CardsViewController.h"

@interface CardsViewController ()

@property CGPoint cardInitialCenter;
@property (weak, nonatomic) IBOutlet UIImageView *navBar;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *bottomBar;

@end

@implementation CardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _imageView.userInteractionEnabled = YES;
}

- (IBAction)onPanImage:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            _cardInitialCenter = _imageView.center;
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint transition = [sender translationInView:_imageView];
            _imageView.center = CGPointMake(_cardInitialCenter.x +transition.x, _cardInitialCenter.y + transition.y);
        }
            break;
        default:
            break;
    }
}


@end
