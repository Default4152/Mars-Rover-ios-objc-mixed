//
//  FetchPhotoOperation.m
//  Mars-Rover-ios-objc-mixed
//
//  Created by Conner on 10/10/18.
//  Copyright © 2018 Conner. All rights reserved.
//

#import "FetchPhotoOperation.h"

@implementation FetchPhotoOperation
@synthesize executing = _executing;
@synthesize finished = _finished;

- (BOOL)isAsynchronous {
    return YES;
}

- (instancetype)initWithImageFrom:(MarsPhoto *)marsPhoto {
    self = [super init];
    if (self) {
        _marsPhoto = marsPhoto;
        _image = [UIImage imageNamed:@"MarsPhoto-Placeholder"];
        _dataTask = [NSURLSessionDataTask new];
    }
    return self;
}

- (void)start {
    _executing = YES;
    [self willChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isExecuting"];
    
    NSURL *url = [NSURL URLWithString:[[self marsPhoto] imageURL]];
    NSURLComponents *components = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    components.scheme = @"https";
    NSURLSession *session = NSURLSession.sharedSession;
    NSURLSessionDataTask *task = [session dataTaskWithURL:[components URL] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            NSLog(@"Error fetching image: %@", error);
            return;
        }
        if (data) {
            self.image = [UIImage imageWithData:data];
        }
        [self finish];
    }];
    [task resume];
    self.dataTask = task;
}

- (void)cancel {
    [[self dataTask] cancel];
    [super cancel];
}

- (void)finish
{
    [self willChangeValueForKey:@"isExecuting"];
    [self willChangeValueForKey:@"isFinished"];
    
    _executing = NO;
    _finished = YES;
    
    [self didChangeValueForKey:@"isExecuting"];
    [self didChangeValueForKey:@"isFinished"];
}
@end
