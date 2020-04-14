//
//  ViewController.m
//  Quakes-Objc
//
//  Created by Paul Solt on 2/19/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "LSILog.h"
#import "FirstResponder.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    NSLog(@"Hey Quakes!");
    
    FirstResponder *firstResponder = [[FirstResponder alloc] init];
    
    NSLog(@"firstResponder: %@", firstResponder);
    firstResponder.name = @"Dillon";
    NSLog(@"firstResponder.name: %@", firstResponder.name); // use the getter to do something every time this accessed
    
    // Objective-C : nil
    // C: NULL
    // Primitive (int, double, etc): 0
    
    
}


@end
