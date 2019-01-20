//
//  MoneoParser.h
//  Moneo
//
//  Created by Matthew Mower on 16/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import <Foundation/Foundation.h>


@class MoneoTemplate;

@interface MoneoParser : NSObject

+ (MoneoTemplate *)parseTemplate:(NSString *)input;

- (MoneoTemplate *)parseTemplate:(NSString *)input;

@end
