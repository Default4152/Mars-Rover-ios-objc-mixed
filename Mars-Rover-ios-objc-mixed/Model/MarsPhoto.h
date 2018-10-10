//
//  MarsPhoto.h
//  Mars-Rover-ios-objc-mixed
//
//  Created by Conner on 10/9/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Camera.h"

NS_ASSUME_NONNULL_BEGIN

@interface MarsPhoto : NSObject

- (instancetype)initWithIdentifier:(int)identifier
                               sol:(int)sol
                            camera:(Camera *)camera
                         earthDate:(NSDate *)earthDate
                          imageURL:(NSURL *)imageURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@property int identifier;
@property int sol;
@property Camera *camera;
@property NSDate *earthDate;
@property NSURL *imageURL;
@end

NS_ASSUME_NONNULL_END
