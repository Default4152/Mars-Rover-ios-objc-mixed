//
//  MarsRoverClient.m
//  Mars-Rover-ios-objc-mixed
//
//  Created by Conner on 10/9/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "MarsRoverClient.h"

@interface MarsRoverClient ()
@property (readonly) NSString *baseURL;
@property (readonly) NSString *apiKey;
@end

@implementation MarsRoverClient
- (instancetype)init
{
    self = [super init];
    if (self) {
        _baseURL = @"https://api.nasa.gov/mars-photos/api/v1/rovers";
        _apiKey = @"G9HgGdT3T7IlawucXVdTPlyzRG3R1ovL9A1GuOg0";
    }
    return self;
}

- (NSURL *)urlForPhotosFromRover:(NSString *)roverName sol:(int)sol {
    NSString *endURL = [NSString stringWithFormat:@"/%@/photos", roverName];
    NSString *baseURLWithRover = [[self baseURL] stringByAppendingString:endURL];
    NSURL *baseURL = [NSURL URLWithString:baseURLWithRover];
    NSURLComponents *components = [NSURLComponents componentsWithURL:baseURL resolvingAgainstBaseURL:YES];
    NSURLQueryItem *solQueryItem = [NSURLQueryItem queryItemWithName:@"sol" value:[NSString stringWithFormat:@"%i", sol]];
    NSURLQueryItem *apiKeyQueryItem = [NSURLQueryItem queryItemWithName:@"api_key" value:[self apiKey]];
    [components setQueryItems:@[solQueryItem, apiKeyQueryItem]];
    
    return [components URL];
}
@end
