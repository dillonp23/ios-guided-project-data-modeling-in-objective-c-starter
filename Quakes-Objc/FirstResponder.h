//
//  FirstResponder.h
//  Quakes-Objc
//
//  Created by Dillon P on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstResponder : NSObject

@property (nonatomic, copy) NSString *name;

/*
  Property will create 3 things:
 
 1. Setter:
 - (void)setName:(NSString *)aName;
 
 2. Getter:
 - (NSString *)name;
 
 3. Instance variable (in the class's @interface):
 NSString *_name;
 
 */

@end

NS_ASSUME_NONNULL_END
