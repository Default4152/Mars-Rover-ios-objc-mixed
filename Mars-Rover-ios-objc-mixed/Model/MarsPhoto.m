//
//  MarsPhoto.m
//  Mars-Rover-ios-objc-mixed
//
//  Created by Conner on 10/9/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "MarsPhoto.h"
#import "Camera.h"

@implementation MarsPhoto

- (instancetype)initWithIdentifier:(int)identifier sol:(int)sol camera:(Camera *)camera earthDate:(NSDate *)earthDate imageURL:(NSURL *)imageURL {
    self = [super init];
    if (self) {
        _identifier = identifier;
        _sol = sol;
        _camera = camera;
        _earthDate = [earthDate copy];
        _imageURL = [imageURL copy];
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    // 1. get values for camera
    NSDictionary *cameraDictionary = dictionary[@"camera"];
    int cameraId = [[cameraDictionary objectForKey:@"id"] intValue];
    int roverId = [[cameraDictionary objectForKey:@"rover_id"] intValue];
    NSString *cameraName = cameraDictionary[@"name"];
    NSString *cameraFullName = cameraDictionary[@"full_name"];
    // 2. init camera with values
    Camera *camera = [[Camera alloc] initWithId:cameraId roverId:roverId name:cameraName fullName:cameraFullName];
    
    // 3. get values for MarsPhoto
    int identifier = [[dictionary objectForKey:@"id"] intValue];
    int sol = [[dictionary objectForKey:@"sol"] intValue];
    NSDate *earthDate = dictionary[@"earth_date"];
    NSURL *imageURL = dictionary[@"img_src"];
    
    // 4. init MarsPhoto with values and camera
    return [self initWithIdentifier:identifier sol:sol camera:camera earthDate:earthDate imageURL:imageURL];
}

@end
