//
//  Quake.h
//  Quakes-Objc
//
//  Created by Dillon P on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Quake : NSObject

- (instancetype)initWithMagnitude:(double)magnitude
                            place:(NSString *)place
                             time:(NSDate *)time
                         latitude:(double)latitude
                        longitude:(double)longitude
                            type:(NSString *)type
                            alert:(NSString *)alert NS_DESIGNATED_INITIALIZER;

- (nullable instancetype)initWithDictionary:(NSDictionary *)dictionary; // nullable = this initializer can return nil

// since these are marked read only we're going to need a custom initializer to set these properties
@property (nonatomic, readonly) double magnitude;
@property (nonatomic, readonly, copy) NSString *place; // use * when it is an objective-c object
@property (nonatomic) NSDate *time;
@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

@property (nonatomic, readonly, copy) NSString *type;
@property (nonatomic, readonly, copy, nullable) NSString *alert;

@end

NS_ASSUME_NONNULL_END
