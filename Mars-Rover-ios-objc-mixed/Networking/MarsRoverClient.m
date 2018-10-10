//
//  MarsRoverClient.m
//  Mars-Rover-ios-objc-mixed
//
//  Created by Conner on 10/9/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "MarsRoverClient.h"
#import "MarsPhoto.h"

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

- (void)fetchRoverPhotosWithRover:(NSString *)marsRover sol:(int)sol completion:(void (^)(NSArray <MarsPhoto *>*, NSError *))completion {
    NSURL *url = [self urlForPhotosFromRover:marsRover sol:sol];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [[[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching data: %@", error);
            completion(nil, error);
            return;
        }
        
        NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
        if (![dictionary isKindOfClass:[NSDictionary class]]) {
            NSLog(@"JSON was not a dictionary");
            completion(nil, [[NSError alloc] init]);
            return;
        }
        NSArray *photosDictionary = dictionary[@"photos"];
        NSMutableArray *photos = [[NSMutableArray<MarsPhoto *> alloc] init];
        for (NSDictionary *photo in photosDictionary) {
            MarsPhoto *marsPhoto = [[MarsPhoto alloc] initWithDictionary:photo];
            [photos addObject:marsPhoto];
        }
        completion(photos, nil);
    }] resume];
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
