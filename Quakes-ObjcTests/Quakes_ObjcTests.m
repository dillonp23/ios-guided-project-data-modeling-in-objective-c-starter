//
//  Quakes_ObjcTests.m
//  Quakes-ObjcTests
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "../Quakes-Objc/LambdaSDK/LSIFileHelper.h"
#import "LSILog.h"
#import "Quake.h"

@interface Quakes_ObjcTests : XCTestCase

@end

@implementation Quakes_ObjcTests

- (void)testQuakeParsing
{
    NSData *quakeData = loadFile(@"Quake.json", [Quakes_ObjcTests class]);
    
    
    NSString *quakeJSONString = [[NSString alloc] initWithData:quakeData encoding:NSUTF8StringEncoding];
    
    NSLog(@"quake (as string): %@", quakeJSONString);
    
    NSError *jsonError = nil;
    // the error object returned is an in out so we define an error and use that. Anytime you see 2 *'s then its in out
    NSDictionary *quakeDictionary = [NSJSONSerialization JSONObjectWithData:quakeData options:0 error:&jsonError];
    if (!quakeDictionary) {
        // if there is no dictionary i.e. nil, then handle error here
        NSLog(@"We've got an error: %@", jsonError);
    }
    
    NSLog(@"quake as a dictionary: %@", quakeDictionary);
    
    // we need to make sure it is a dictionary as it could return an array, so if not catch it and stop it
    if (![quakeDictionary isKindOfClass:[NSDictionary class]]) {
        NSLog(@"Quake dictionary is not a dictionary!");
        return;
    }
    
    Quake *quake = [[Quake alloc] initWithDictionary:quakeDictionary];
    NSLog(@"quake is: %@", quake);
    
    NSDate *time = [NSDate dateWithTimeIntervalSince1970:1388620296020 / 1000.0];
    XCTAssertEqualWithAccuracy(1.29, quake.magnitude, 0.0001);
    XCTAssertEqualObjects(@"10km SSW of Idyllwild, CA", quake.place);
    XCTAssertEqualObjects(time, quake.time);
    // For now we'll just set the alert to nil, you may want to use @"" instead
    XCTAssertNil(quake.alert);
    XCTAssertEqualObjects(@"earthquake", quake.type);
    XCTAssertEqualWithAccuracy(33.663333299999998, quake.latitude, 0.0001);
    XCTAssertEqualWithAccuracy(-116.7776667, quake.longitude, 0.0001);
    
}

@end
