//
//  TestInterface.m
//  ysjLib
//
//  Created by ysj on 2018/3/19.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import "TestInterface.h"

@implementation TestInterface

- (void)testPrintName:(NSString *)name {
    NSLog(@"name: %@", name);
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.name = @"it's name";
        self.age = @"it's age";
        self.address = @"it's address";
    }
    return self;
}

@end
