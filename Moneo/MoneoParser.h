//
//  MoneoParser.h
//  Moneo
//
//  Created by Matthew Mower on 16/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import <Foundation/Foundation.h>

enum {
  MoneoNilTemplateError,
} MoneoErrorCodes;

@class MoneoTemplate;

@interface MoneoParser : NSObject

+ (MoneoTemplate *)parseTemplate:(NSString *)input error:(NSError **)error;

- (MoneoTemplate *)parseTemplate:(NSString *)input error:(NSError **)error;

@end
