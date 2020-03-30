//
//  MoneoASTNode.m
//  Moneo
//
//  Created by Matthew Mower on 16/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import "MoneoASTNode.h"

/*
 * The MoneoASTNode is the root node for all AST node types.
 */
@implementation MoneoASTNode

- (instancetype)initWithParent:(MoneoBlockNode *)parent {
  self = [super init];
  if( self ) {
    _parent = parent;
  }
  return self;
}

@end

/*
 * The MoneoEmitNode describes a static chunk of text that the template will
 * emit during rendering.
 */
@implementation MoneoEmitNode

- (instancetype)initWithParent:(MoneoBlockNode *)parent chunk:(NSString *)chunk {
  self = [self initWithParent:parent];
  if( self ) {
    _chunk = chunk;
  }
  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"EMIT[%@]", self.chunk];
}

@end

/*
 * The MoneoEvalNode describes a key path that the template will use to find
 * a value from the context that gets emitted during rendering
 */
@implementation MoneoEvalNode

- (instancetype)initWithParent:(MoneoBlockNode *)parent keyPath:(NSString *)keyPath {
  self = [self initWithParent:parent];
  if( self ) {
    _keyPath = keyPath;
  }
  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"EVAL[%@]", self.keyPath];
}


@end

/*
 * A MoneoBlockNode is the root node of types that represent a block with a child
 * block that can be rendered zero or more times.
 */
@implementation MoneoBlockNode

- (instancetype)initWithParent:(MoneoBlockNode *)parent {
  self = [super initWithParent:parent];
  if( self ) {
    _children = [NSMutableArray array];
  }
  return self;
}

- (void)addChild:(MoneoASTNode *)node {
  [_children addObject:node];
}

- (NSString *)description {
  return [NSString stringWithFormat:@"BLOCK[%@]", self.children];
}

@end

/*
 * The MoneoTemplateNode is a type of block node, it represents the complete
 * template that is passed to the MoneoTemplate class for rendering.
 */
@implementation MoneoTemplateNode

- (instancetype)init {
  return [self initWithParent:nil];
}

- (NSString *)description {
  return [NSString stringWithFormat:@"TEMPLATE[%@]", self.children];
}


@end

/*
 * The MoneoExistsNode is a type of block node that can be used to evaluate whether
 * a key path exists within the context and evaluate its child node if it exists.
 */
@implementation MoneoExistsNode

- (instancetype)initWithParent:(MoneoBlockNode *)parent keyPath:(NSString *)keyPath {
  self = [self initWithParent:parent];
  if( self ) {
    _keyPath = keyPath;
  }
  return self;
}

@end

/*
 * The MoneoMissingBlock is a type of block node that can be used to evaluate whether
 * a key path does not exist in the context and evaluate its child node if it
 * is missing.
 */
@implementation MoneoMissingNode

- (instancetype)initWithParent:(MoneoBlockNode *)parent keyPath:(NSString *)keyPath {
  self = [self initWithParent:parent];
  if( self ) {
    _keyPath = keyPath;
  }
  return self;
}

@end

/*
 * The MoneoIterNode is a type of block node that represents a key path and a child
 * node. When rendered the key path should evaluate to a (potentially empty) collection.
 * The child node should then be rendered for each value in the collection.
 */
@implementation MoneoIterNode

- (instancetype)initWithParent:(MoneoBlockNode *)parent keyPath:(NSString *)keyPath {
  self = [self initWithParent:parent];
  if( self ) {
    _keyPath = keyPath;
  }
  return self;
}

- (NSString *)description {
  return [NSString stringWithFormat:@"ITER[%@,%@]", self.keyPath, self.children];
}

@end
