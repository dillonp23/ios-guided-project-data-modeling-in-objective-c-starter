//
//  FirstResponder.m
//  Quakes-Objc
//
//  Created by Dillon P on 4/13/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "FirstResponder.h"

@implementation FirstResponder

- (void)setName:(NSString *)name // if you override the setter then you;re responsible for dong everything - nno super class for setter
{
    // willSet
    
    
    _name = name.copy; // [name copy]; - if giving you something/behaving like read only then you can use the property "dot" syntax
    
    // didSet
    
}

@end
