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

- (instancetype)initWithAST:(MoneoTemplateNode *)node;

- (NSString *)render:(id)context;

@end
