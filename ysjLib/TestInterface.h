//
//  TestInterface.h
//  ysjLib
//
//  Created by ysj on 2018/3/19.
//  Copyright © 2018年 Harry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestInterface : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *age;
@property (nonatomic, copy) NSString *address;

- (void)testPrintName:(NSString *)name;

@end
