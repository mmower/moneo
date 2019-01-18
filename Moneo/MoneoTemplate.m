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
    _compiled = [self compileBlockNode:templateNode];
  }
  return self;
}

- (NSArray *)compileBlockNode:(MoneoBlockNode *)node {
  NSMutableArray *compiled = [NSMutableArray arrayWithCapacity:node.children.count];

  for( MoneoASTNode *child in node.children ) {
    NSArray *ops;
    if( [child isKindOfClass:[MoneoEmitNode class]] ) {
      ops = @[kOpEmit,((MoneoEmitNode*)child).chunk];
    } else if( [child isKindOfClass:[MoneoEvalNode class]] ) {
      ops = @[kOpEval,((MoneoEvalNode *)child).keyPath];
    } else if( [child isKindOfClass:[MoneoIterNode class]] ) {
      ops = @[kOpIter,((MoneoIterNode *)child).keyPath,[self compileBlockNode:(MoneoIterNode *)child]];
    } else if( [child isKindOfClass:[MoneoMissingNode class]] ) {
      ops = @[kOpMiss,((MoneoMissingNode *)child).keyPath,[self compileBlockNode:(MoneoMissingNode *)child]];
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
