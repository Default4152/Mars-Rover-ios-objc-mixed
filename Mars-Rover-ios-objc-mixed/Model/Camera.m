//
//  Camera.m
//  Mars-Rover-ios-objc-mixed
//
//  Created by Conner on 10/9/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "Camera.h"

@implementation Camera
- (instancetype)initWithId:(int)identifier roverId:(int)roverId name:(NSString *)name fullName:(NSString *)fullName {
    self = [super init];
    if (self) {
        _identifier = identifier;
        _roverId = roverId;
        _name = [name copy];
        _fullName = [fullName copy];
    }
    return self;
}
@end
