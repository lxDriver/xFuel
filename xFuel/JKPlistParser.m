//
//  JKPlistParser.m
//  xFuel
//
//  Created by Julian Kleine on 12.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import "JKPlistParser.h"

@implementation JKPlistParser
- (NSArray *)parseFileByPath:(NSString *)path {
    NSArray *aArray = [NSArray arrayWithContentsOfFile:path];
    return [JKCar createItemsByArray:aArray];
}
@end
