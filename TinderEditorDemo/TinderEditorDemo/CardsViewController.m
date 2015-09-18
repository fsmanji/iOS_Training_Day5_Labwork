//
//  CardsViewController.m
//  TinderEditorDemo
//
//  Created by Cristan Zhang on 9/18/15.
//  Copyright (c) 2015 FastTrack. All rights reserved.
//

#import "CardsViewController.h"
#import "ProfileViewController.h"

@interface CardsViewController ()

@property CGPoint cardInitialCenter;
@property (weak, nonatomic) IBOutlet UIImageView *navBar;

@property (weak, nonatomic) IBOutlet UIImageView *bottomBar;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation CardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _imageView.userInteractionEnabled = YES;
}
- (IBAction)onPan:(UIPanGestureRecognizer *)sender {
    switch (sender.state) {
        case UIGestureRecognizerStateBegan:
        {
            _cardInitialCenter = _imageView.center;
        }
            break;
        case UIGestureRecognizerStateChanged:
        {
            CGPoint transition = [sender translationInView:_imageView];
            _imageView.center = CGPointMake(_cardInitialCenter.x/* +transition.x*/, _cardInitialCenter.y + transition.y);
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            
            _imageView.center = CGPointMake(_cardInitialCenter.x, _cardInitialCenter.y);
            
            [self presentProfileView];
        }
            break;
        default:
            break;
    }
    
}
- (void)presentProfileView {
    ProfileViewController* profile = [[ProfileViewController alloc] init];
    profile.image = [UIImage imageNamed:@"ryan"];;
    //profile.modalPresentationStyle = UIModalPresentationPopover;
    profile.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    [self presentViewController:profile animated:YES completion:nil];
}

@end
