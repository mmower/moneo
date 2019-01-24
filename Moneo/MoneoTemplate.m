//
//  MoneoTemplate.m
//  Moneo
//
//  Created by Matthew Mower on 18/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import "MoneoTemplate.h"

#import "MoneoASTNode.h"

typedef void (^OpBlock)( NSMutableString *output, id context );

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
    if( [child isKindOfClass:[MoneoEmitNode class]] ) {
      [compiled addObject:^( NSMutableString *output, id context ) {
        [output appendString:((MoneoEmitNode*)child).chunk];
      }];
    } else if( [child isKindOfClass:[MoneoEvalNode class]] ) {
      NSString *keyPath = ((MoneoEvalNode *)child).keyPath;
      [compiled addObject:^( NSMutableString *output, id context ) {
        [output appendString:[context valueForKeyPath:keyPath]];
      }];
      [keyPaths addObject:keyPath];
    } else if( [child isKindOfClass:[MoneoIterNode class]] ) {
      NSString *keyPath = ((MoneoIterNode *)child).keyPath;
      [keyPaths addObject:keyPath];
      NSArray *compiledChildren = [self compileBlockNode:((MoneoIterNode *)child) keyPathsOut:keyPaths];
      [compiled addObject:^( NSMutableString *output, id context ) {
        id obj = [context valueForKeyPath:keyPath];
        if( [obj conformsToProtocol:@protocol(NSFastEnumeration)] ) {
          for( id item in obj ) {
            [output appendString:[self renderTree:compiledChildren context:item]];
          }
        } else {
          [output appendString:[self renderTree:compiledChildren context:obj]];
        }
      }];
    } else if( [child isKindOfClass:[MoneoMissingNode class]] ) {
      NSString *keyPath = ((MoneoMissingNode *)child).keyPath;
      [keyPaths addObject:keyPath];
      NSArray *compiledChildren = [self compileBlockNode:((MoneoIterNode *)child) keyPathsOut:keyPaths];
      [compiled addObject:^( NSMutableString *output, id context ) {
        id obj = [context valueForKeyPath:keyPath];
        if( !obj ) {
          [output appendString:[self renderTree:compiledChildren context:context]];
        }
      }];
    }
  }

  return [compiled copy];
}

- (NSString *)renderTree:(NSArray *)tree context:(id)context {
  NSMutableString *output = [NSMutableString string];

  for( OpBlock op in tree ) {
    op( output, context );
  }

  return output;
}

- (NSString *)render:(id)context {
  return [self renderTree:_compiled context:context];
}

@end
