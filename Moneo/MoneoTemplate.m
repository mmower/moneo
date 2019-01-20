//
//  MoneoTemplate.m
//  Moneo
//
//  Created by Matthew Mower on 18/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import "MoneoTemplate.h"

#import "MoneoASTNode.h"

NSString * const kOpEmit = @"EMIT";
NSString * const kOpEval = @"EVAL";
NSString * const kOpIter = @"ITER";
NSString * const kOpMiss = @"MISS";

@implementation MoneoTemplate

- (instancetype)initWithAST:(MoneoTemplateNode *)templateNode {
  self = [self init];
  if( self ) {
    NSMutableArray *keyPaths = [NSMutableArray array];
    _compiled = [self compileBlockNode:templateNode keyPathsOut:keyPaths];
    _keyPaths = [keyPaths copy];
  }
  return self;
}

- (NSArray *)compileBlockNode:(MoneoBlockNode *)node keyPathsOut:(NSMutableArray *)keyPaths {
  NSMutableArray *compiled = [NSMutableArray arrayWithCapacity:node.children.count];

  for( MoneoASTNode *child in node.children ) {
    NSArray *ops;
    if( [child isKindOfClass:[MoneoEmitNode class]] ) {
      ops = @[kOpEmit,((MoneoEmitNode*)child).chunk];
    } else if( [child isKindOfClass:[MoneoEvalNode class]] ) {
      NSString *keyPath = ((MoneoEvalNode *)child).keyPath;
      ops = @[kOpEval,keyPath];
      [keyPaths addObject:keyPath];
    } else if( [child isKindOfClass:[MoneoIterNode class]] ) {
      NSString *keyPath = ((MoneoIterNode *)child).keyPath;
      ops = @[kOpIter,keyPath,[self compileBlockNode:(MoneoIterNode *)child keyPathsOut:keyPaths]];
      [keyPaths addObject:keyPath];
    } else if( [child isKindOfClass:[MoneoMissingNode class]] ) {
      NSString *keyPath = ((MoneoMissingNode *)child).keyPath;
      ops = @[kOpMiss,keyPath,[self compileBlockNode:(MoneoMissingNode *)child keyPathsOut:keyPaths]];
      [keyPaths addObject:keyPath];
    }
    [compiled addObject:ops];
  }

  return [compiled copy];
}

- (NSString *)renderTree:(NSArray *)tree context:(id)context {
  NSMutableString *output = [NSMutableString string];

  for( NSArray *op in tree ) {
    NSString *opCode = [op objectAtIndex:0];
    if( opCode == kOpEmit ) {
      [output appendString:[op objectAtIndex:1]];
    } else if( opCode == kOpEval ) {
      [output appendString:[context valueForKeyPath:[op objectAtIndex:1]]];
    } else if( opCode == kOpIter ) {
      [output appendString:[self renderTree:[op objectAtIndex:2] context:[context valueForKeyPath:[op objectAtIndex:1]]]];
    } else {
      if( ![context valueForKeyPath:[op objectAtIndex:1]] ) {
        [output appendString:[self renderTree:[op objectAtIndex:2] context:context]];
      }
    }
  }

  return output;
}

- (NSString *)render:(id)context {
  return [self renderTree:_compiled context:context];
}

@end
