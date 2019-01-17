//
//  MoneoParser.m
//  Moneo
//
//  Created by Matthew Mower on 16/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import "MoneoParser.h"

#import "MoneoASTNode.h"

#import <string.h>

/* Ragel Machine Definition */

%%{
  machine moneo_parser;

  # Character Classes

  open = '{' :> '{';
  close = '}' :> '}';
  keypath = alnum+;
  eval = [=];
  iter = '@';
  cblk = '/';
  miss = '!';

  action mark {
    _chunk_start = fpc;
  }

  action chunk_end {
    long length = fpc - _chunk_start;
    char buffer[length+1];
    memset( buffer, 0x00, length+1 );
    strncpy( buffer, _chunk_start, fpc-_chunk_start );
    _chunk = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];

    if( ![_chunk isEqualToString:@""] ) {
       MoneoEmitNode *node = [[MoneoEmitNode alloc] initWithParent:_curBlock chunk:_chunk];
        [_curBlock addChild:node];
        NSLog( @">CHUNK = %@", _chunk );
    }
    _chunk_start = fpc;
  }

  action keypath_start {
    _keypath_start = fpc;
  }

  action keypath_end {
    long length = fpc - _keypath_start;
    char buffer[length+1];
    memset( buffer, 0x00, length+1 );
    strncpy( buffer, _keypath_start, fpc-_keypath_start );
    _keypath = [[NSString alloc] initWithCString:buffer encoding:NSUTF8StringEncoding];
    NSLog( @"*KEYPATH = %@", _keypath );
  }

  action eval {
    NSLog( @"*eval*" );
    MoneoEvalNode *node = [[MoneoEvalNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    NSLog( @"curBlock=%@", _curBlock );
  }

  action iter {
    NSLog( @"*iter:%@*", _keypath );
    MoneoIterNode *node = [[MoneoIterNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    _curBlock = node;
    NSLog( @"curBlock=%@", _curBlock );
  }

  action clblk {
    NSLog( @"*clblk*" );
    _curBlock = _curBlock.parent;
    NSLog( @"curBlock=%@", _curBlock );
  }

  action alert_error {
    NSLog( @"ERROR" );
  }

  eval_block = (
    open
    eval
    space*
    keypath >keypath_start %keypath_end
    space*
    close %eval %mark
  ) >chunk_end;

  iter_block = (
    open
    iter
    space*
    keypath >keypath_start %keypath_end
    space*
    close %iter %mark
  ) >chunk_end;

  close_block = (
    open
    cblk
    close %clblk %mark
  ) >chunk_end;

  chunk = (
    any+ -- open
  );

  body = (
    eval_block
    | iter_block
    | close_block
    | chunk
  ) %eof(chunk_end);

  main := body* $err(alert_error);
}%%

/* Ragel Working State */
%% write data;

@interface MoneoParser ()

@property int cs;

@property char *keypath_start;
@property char *chunk_start;
@property char *marker;

@property MoneoBlockNode *curBlock;

@property NSString *chunk;
@property NSString *keypath;

@end

@implementation MoneoParser

@synthesize cs = cs;

- (instancetype)init {
  self = [super init];
  if( self ) {
    %% write init;
  }
  return self;
}

- (MoneoTemplateNode *)parseBuffer:(const char *)input length:(size_t)length {
  MoneoTemplateNode *template = [[MoneoTemplateNode alloc] init];
  _curBlock = template;
  char *p = (char *)input;
  char *pe = (char *)input + length;
  _chunk_start = p;
  char *eof = pe;
  %% write exec;
  return template;
}

- (MoneoTemplateNode *)parse:(NSString *)input {
  const char *buffer = [input cStringUsingEncoding:NSUTF8StringEncoding];
  return [self parseBuffer:buffer length:strlen(buffer)];
}

@end
