//
//  Camera.h
//  Mars-Rover-ios-objc-mixed
//
//  Created by Conner on 10/9/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Camera : NSObject

- (instancetype)initWithId:(int)identifier roverId:(int)roverId name:(NSString *)name fullName:(NSString *)fullName;

@property int identifier;
@property int roverId;
@property NSString *name;
@property NSString *fullName;
@end

NS_ASSUME_NONNULL_END
