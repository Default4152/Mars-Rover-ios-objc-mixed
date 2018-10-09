//
//  CGARoverPhotoCollectionViewCell.m
//  Mars-Rover-ios-objc-mixed
//
//  Created by Conner on 10/9/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "CGARoverPhotoCollectionViewCell.h"

@interface CGARoverPhotoCollectionViewCell ()
@property (strong, nonatomic) IBOutlet UIImageView *roverPhotoImageView;
@end

@implementation CGARoverPhotoCollectionViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    [[self roverPhotoImageView] setImage:[UIImage imageNamed:@"MarsPhoto-Placeholder"]];
}

@end
