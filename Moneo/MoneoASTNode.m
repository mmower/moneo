//
//  MoneoASTNode.m
//  Moneo
//
//  Created by Matthew Mower on 16/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import "MoneoASTNode.h"

@implementation MoneoASTNode

- (instancetype)initWithParent:(MoneoBlockNode *)parent {
  self = [super init];
  if( self ) {
    _parent = parent;
  }
  return self;
}

@end

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

@implementation MoneoTemplateNode

- (instancetype)init {
  return [self initWithParent:nil];
}

- (NSString *)description {
  return [NSString stringWithFormat:@"TEMPLATE[%@]", self.children];
}


@end

@implementation MoneoExistsNode

- (instancetype)initWithParent:(MoneoBlockNode *)parent keyPath:(NSString *)keyPath {
  self = [self initWithParent:parent];
  if( self ) {
    _keyPath = keyPath;
  }
  return self;
}

@end

@implementation MoneoMissingNode

- (instancetype)initWithParent:(MoneoBlockNode *)parent keyPath:(NSString *)keyPath {
  self = [self initWithParent:parent];
  if( self ) {
    _keyPath = keyPath;
  }
  return self;
}

@end

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
