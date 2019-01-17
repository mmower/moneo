//
//  MoneoParser.h
//  Moneo
//
//  Created by Matthew Mower on 16/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MoneoTemplateNode;

@interface MoneoParser : NSObject

- (MoneoTemplateNode *)parseBuffer:(const char *)input length:(size_t)length;
- (MoneoTemplateNode *)parse:(NSString *)input;

@end
