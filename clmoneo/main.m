//
//  main.m
//  clmoneo
//
//  Created by Matthew Mower on 18/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Moneo/Moneo.h>

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    if( argc %2 != 1 ) {
      NSLog( @"Error: must be an even number of command line arguments." );
      exit( -1 );
    }

    NSMutableDictionary *context = [NSMutableDictionary dictionary];
    for( int i = 1; i < argc; i+= 2 ) {
      NSString *key = [NSString stringWithUTF8String:argv[i]];
      NSString *value = [NSString stringWithUTF8String:argv[i+1]];
      context[key] = value;
    }
    NSLog( @"Context: %@", context );

    NSString *input;
    input = [[[NSProcessInfo processInfo] environment] objectForKey:@"template"];
    if( !input ) {
      input = [[NSString alloc] initWithData:[[NSFileHandle fileHandleWithStandardInput] availableData]
                                    encoding:NSUTF8StringEncoding];
    }

    NSLog( @"Template: %@", input );

    MoneoParser *parser = [[MoneoParser alloc] init];
    if( !parser ) {
      NSLog( @"Error: Cannot instantiate parser." );
      exit( -2 );
    }

    MoneoTemplate *template = [parser parseTemplate:input];
    if( !template ) {
      NSLog( @"Error: Cannot parse template." );
      exit( -3 );
    }

    NSString *output = [template render:context];
    if( !output ) {
      NSLog( @"Error: Cannot render template." );
      exit( -4 );
    }

    NSLog( @"--------------------------------" );
    NSLog( @"%@", output );
    NSLog( @"--------------------------------" );
  }
  return 0;
}
