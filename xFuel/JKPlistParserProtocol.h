//
//  JKPlistParserProtocol.h
//  xFuel
//
//  Created by Julian Kleine on 12.07.13.
//  Copyright (c) 2013 Julian Kleine. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol JKPlistParserProtocol <NSObject>

- (NSArray *)parseFileByPath:(NSString *)path;
@end
