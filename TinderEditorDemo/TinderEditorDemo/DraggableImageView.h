//
//  DraggableImageView.h
//  TinderEditorDemo
//
//  Created by Cristan Zhang on 9/18/15.
//  Copyright (c) 2015 FastTrack. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DraggableImageView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property CGPoint cardInitialCenter;
@end
