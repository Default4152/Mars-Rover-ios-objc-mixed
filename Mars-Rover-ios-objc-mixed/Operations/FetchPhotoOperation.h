//
//  FetchPhotoOperation.h
//  Mars-Rover-ios-objc-mixed
//
//  Created by Conner on 10/10/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MarsPhoto.h"

NS_ASSUME_NONNULL_BEGIN

@interface FetchPhotoOperation : NSOperation
- (instancetype) initWithImageFrom:(MarsPhoto *)marsPhoto;
@property MarsPhoto *marsPhoto;
@property UIImage *image;
@property NSURLSessionDataTask *dataTask;
@end

NS_ASSUME_NONNULL_END
