//
//  MoneoParser.h
//  Moneo
//
//  Created by Matthew Mower on 16/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
  MoneoNilTemplateError,
  MoneoParsingTemplateError,
} MoneoErrorCodes;

@class MoneoTemplate;

@interface MoneoParser : NSObject

@property NSError *error;

- (MoneoTemplate *)parseTemplate:(NSString *)input;

@end
