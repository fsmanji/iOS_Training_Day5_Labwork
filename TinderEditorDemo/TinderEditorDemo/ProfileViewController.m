//
//  ProfileViewController.m
//  TinderEditorDemo
//
//  Created by Cristan Zhang on 9/18/15.
//  Copyright (c) 2015 FastTrack. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property CGFloat lastRotation;
@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if(_image)
        NSLog(@"image is loaded");
    
    //set image to image view
    _imageView.image = _image;
}

- (IBAction)onTapDone:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)onRotation:(UIRotationGestureRecognizer *)sender {
    UIRotationGestureRecognizer* rotationHandler = (UIRotationGestureRecognizer*)sender;
    
    if([rotationHandler state] == UIGestureRecognizerStateEnded) {
        _lastRotation = 0.0;
        self.imageView.transform = CGAffineTransformIdentity;
        return;
    }
    
    CGFloat rotation = 0.0 - (_lastRotation - [rotationHandler rotation]);
    
    CGAffineTransform currentTransform = _imageView.transform;
    CGAffineTransform newTransform = CGAffineTransformRotate(currentTransform,rotation);
    
    [_imageView setTransform:newTransform];
    
    _lastRotation = [rotationHandler rotation];
}

/*
 
 //instance variables
 
 //CGFloat lastScale;
 //CGPoint lastPoint;
 

- (void)handlePinchGesture:(UIPinchGestureRecognizer *)sender {
    if ([sender numberOfTouches] < 2)
        return;
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        lastScale = 1.0;
        lastPoint = [sender locationInView:self];
    }
    
    // Scale
    CGFloat scale = 1.0 - (lastScale - sender.scale);
    [self.layer setAffineTransform:
     CGAffineTransformScale([self.layer affineTransform],
                            scale,
                            scale)];
    lastScale = sender.scale;
    
    // Translate
    CGPoint point = [sender locationInView:self];
    [self.layer setAffineTransform:
     CGAffineTransformTranslate([self.layer affineTransform],
                                point.x - lastPoint.x,
                                point.y - lastPoint.y)];
    lastPoint = [sender locationInView:self];
}
 */

@end
