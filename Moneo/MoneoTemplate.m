//
//  MoneoTemplate.m
//  Moneo
//
//  Created by Matthew Mower on 18/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import "MoneoTemplate.h"

#import "MoneoASTNode.h"

@interface MoneoTemplate ()

@property MoneoTemplateNode *templateNode;

@end

@implementation MoneoTemplate

- (instancetype)initWithAST:(MoneoTemplateNode *)node {
  self = [self init];
  if( self ) {
    _templateNode = node;
  }
  return self;
}

- (NSString *)renderBlockNode:(MoneoBlockNode *)blockNode context:(id)context {
  NSMutableString *output = [NSMutableString string];
  for( MoneoASTNode *node in _templateNode.children ) {
    if( [node isKindOfClass:[MoneoEmitNode class]] ) {
      MoneoEmitNode *emitNode = (MoneoEmitNode *)node;
      [output appendString:emitNode.chunk];
    } else if( [node isKindOfClass:[MoneoEvalNode class]] ) {
      MoneoEvalNode *evalNode = (MoneoEvalNode *)node;
      NSString *keyPath = evalNode.keyPath;
      NSString *value = [context valueForKeyPath:keyPath];
      [output appendString:value];
    } else if( [node isKindOfClass:[MoneoIterNode class]] ) {
      MoneoIterNode *iterNode = (MoneoIterNode *)node;
      NSString *keyPath = iterNode.keyPath;
      id subcontext = [context valueForKeyPath:keyPath];
      [output appendString:[self renderBlockNode:iterNode context:subcontext]];
    } else if( [node isKindOfClass:[MoneoMissingNode class]] ) {
      MoneoMissingNode *missingNode = (MoneoMissingNode *)node;
      NSString *keyPath = missingNode.keyPath;
      if( ![context valueForKeyPath:keyPath] ) {
        [output appendString:[self renderBlockNode:missingNode context:context]];
      }
    } else {
      @throw [NSException exceptionWithName:@"Moneo template rendering error"
                                     reason:[NSString stringWithFormat:@"Encountered unexpected AST node class %@",[node className]]
                                   userInfo:nil];
    }
  }
  return output;
}

- (NSString *)render:(id)context {
  return [self renderBlockNode:_templateNode context:context];
}

@end
