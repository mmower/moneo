//
//  MoneoASTNode.h
//  Moneo
//
//  Created by Matthew Mower on 16/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MoneoBlockNode;

@interface MoneoASTNode : NSObject

@property MoneoBlockNode *parent;

- (instancetype)initWithParent:(MoneoBlockNode *)parent;

@end

@interface MoneoEmitNode : MoneoASTNode

@property NSString *chunk;

- (instancetype)initWithParent:(MoneoBlockNode *)parent chunk:(NSString *)chunk;

@end

@interface MoneoEvalNode : MoneoASTNode

@property NSString *keyPath;

- (instancetype)initWithParent:(MoneoBlockNode *)parent keyPath:(NSString *)keyPath;

@end

@interface MoneoBlockNode : MoneoASTNode

@property NSMutableArray *children;

- (void)addChild:(MoneoASTNode *)node;

@end

@interface MoneoTemplateNode : MoneoBlockNode

@end

@interface MoneoIterNode : MoneoBlockNode

@property NSString *keyPath;

- (instancetype)initWithParent:(MoneoBlockNode *)parent keyPath:(NSString *)keyPath;

@end

@interface MoneoMissingNode : MoneoBlockNode

@property NSString *keyPath;

- (instancetype)initWithParent:(MoneoBlockNode *)parent keyPath:(NSString *)keyPath;

@end
