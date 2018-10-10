//
//  CGARoverPhotoCollectionViewCell.m
//  Mars-Rover-ios-objc-mixed
//
//  Created by Conner on 10/9/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "CGARoverPhotoCollectionViewCell.h"

@interface CGARoverPhotoCollectionViewCell ()
@end

@implementation CGARoverPhotoCollectionViewCell

- (void)prepareForReuse {
    [super prepareForReuse];
    [[self marsRoverPhotoImageView] setImage:[UIImage imageNamed:@"MarsPhoto-Placeholder"]];
}

@end
