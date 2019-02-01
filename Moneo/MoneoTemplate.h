//
//  MoneoTemplate.h
//  Moneo
//
//  Created by Matthew Mower on 18/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MoneoTemplateNode;

@interface MoneoTemplate : NSObject

@property NSArray *compiled;
@property NSArray *keyPaths;
@property NSUInteger bufferSize;

- (instancetype)initWithAST:(MoneoTemplateNode *)templateNode;

- (NSString *)render:(id)context;

@end
