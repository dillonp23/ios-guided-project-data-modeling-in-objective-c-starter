//
//  Quake.m
//  Quakes-Objc
//
//  Created by Dillon P on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "Quake.h"

@implementation Quake

- (instancetype)initWithMagnitude:(double)magnitude place:(NSString *)place time:(NSDate *)time latitude:(double)latitude longitude:(double)longitude type:(NSString *)type alert:(NSString *)alert
{
    if (self = [super init]) {
        _magnitude = magnitude;
        _place = place.copy;
        _time = time;
        _latitude = latitude;
        _longitude = longitude;
        _type = _type.copy;
        _alert = _alert.copy;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *properties = [dictionary objectForKey:@"properties"];
    if (![properties isKindOfClass:[NSDictionary class]]) return nil;
    
    NSNumber *magnitudeNumber = [properties objectForKey:@"mag"];
    if ([magnitudeNumber isKindOfClass:[NSNull class]]) {
        magnitudeNumber = nil;
    } else if (![magnitudeNumber isKindOfClass:[NSNumber class]]) return nil;
    
    NSString *place = [properties objectForKey:@"place"];
    if (![place isKindOfClass:[NSString class]]) return nil;
    
    NSNumber *timeInMilliseconds = [properties objectForKey:@"time"];
    if (![timeInMilliseconds isKindOfClass:[NSNumber class]]) return nil;
    
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:timeInMilliseconds.longValue/1000.];
    NSString *type = [properties objectForKey:@"type"];
    
    if (![type isKindOfClass:[NSString class]]) return nil;
    NSString *alert = [properties objectForKey:@"alert"];
    
    if ([alert isKindOfClass:[NSNull class]]) {
        alert = nil;
    } else if (![alert isKindOfClass:[NSString class]]) return nil;
    
    
    NSDictionary *geometry = [dictionary objectForKey:@"geometry"];
    if (![geometry isKindOfClass:[NSDictionary class]]) return nil;
    
    NSArray *coordinates = [geometry objectForKey:@"coordinates"];
    if (![coordinates isKindOfClass:[NSArray class]]) return nil;
    
    NSNumber *latitudeNumber = nil;
    NSNumber *longitudeNumber = nil;
    
    if (coordinates.count >= 2) {
        latitudeNumber = [coordinates objectAtIndex:1];
        longitudeNumber = [coordinates objectAtIndex:0];
        if (![latitudeNumber isKindOfClass:[NSNumber class]]) return nil;
        if (![longitudeNumber isKindOfClass:[NSNumber class]]) return nil;
    }
    return [self initWithMagnitude:magnitudeNumber.doubleValue
                             place:place
                              time:time
                          latitude:latitudeNumber.doubleValue
                         longitude:longitudeNumber.doubleValue
                              type:type
                             alert:alert];
}

@end
