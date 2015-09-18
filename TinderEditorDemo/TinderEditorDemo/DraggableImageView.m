//
//  DraggableImageView.m
//  TinderEditorDemo
//
//  Created by Cristan Zhang on 9/18/15.
//  Copyright (c) 2015 FastTrack. All rights reserved.
//

#import "DraggableImageView.h"

@implementation DraggableImageView



- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self ) {
    }
    return self;
}
- (id)awakeAfterUsingCoder:(NSCoder *)aDecoder
{
    if ([self.subviews count] == 0) { // (1)
        NSArray *elementsInNib = [[NSBundle mainBundle] loadNibNamed:@"DraggableImageView" owner:Nil options:nil]; // (2)
        DraggableImageView *realThing = [elementsInNib lastObject];
        realThing.frame = self.frame; // (3)
        realThing.autoresizingMask = self.autoresizingMask;
        return realThing;
    }
    return self;
}

- (void) awakeFromNib {
    self.userInteractionEnabled = YES;
}


- (IBAction)onDrag:(UIPanGestureRecognizer *)sender {
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
