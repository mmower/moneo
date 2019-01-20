
#line 1 "MoneoParser.m.rl"
//
//  MoneoParser.m
//  Moneo
//
//  Created by Matthew Mower on 16/01/2019.
//  Copyright © 2019 TAON. All rights reserved.
//

#import "MoneoParser.h"

#import "MoneoASTNode.h"
#import "MoneoTemplate.h"

#import <string.h>

/* Ragel Machine Definition */


#line 124 "MoneoParser.m.rl"


/* Ragel Working State */

#line 27 "MoneoParser.m"
static const char _moneo_parser_actions[] = {
	0, 1, 1, 1, 2, 1, 3, 1, 
	7, 2, 4, 0, 2, 5, 0, 2, 
	6, 0, 3, 4, 0, 1, 3, 5, 
	0, 1, 3, 6, 0, 1
};

static const char _moneo_parser_key_offsets[] = {
	0, 0, 3, 4, 5, 11, 17, 21, 
	22, 28, 34, 38, 39, 40, 41, 42, 
	43, 44
};

static const char _moneo_parser_trans_keys[] = {
	47, 61, 64, 125, 125, 32, 126, 9, 
	13, 33, 124, 32, 125, 9, 13, 33, 
	126, 32, 125, 9, 13, 125, 32, 126, 
	9, 13, 33, 124, 32, 125, 9, 13, 
	33, 126, 32, 125, 9, 13, 125, 123, 
	123, 123, 123, 123, 123, 0
};

static const char _moneo_parser_single_lengths[] = {
	0, 3, 1, 1, 2, 2, 2, 1, 
	2, 2, 2, 1, 1, 1, 1, 1, 
	1, 1
};

static const char _moneo_parser_range_lengths[] = {
	0, 0, 0, 0, 2, 2, 1, 0, 
	2, 2, 1, 0, 0, 0, 0, 0, 
	0, 0
};

static const char _moneo_parser_index_offsets[] = {
	0, 0, 4, 6, 8, 13, 18, 22, 
	24, 29, 34, 38, 40, 42, 44, 46, 
	48, 50
};

static const char _moneo_parser_trans_targs[] = {
	2, 4, 8, 0, 3, 0, 15, 0, 
	4, 5, 4, 5, 0, 6, 7, 6, 
	5, 0, 6, 7, 6, 0, 16, 0, 
	8, 9, 8, 9, 0, 10, 11, 10, 
	9, 0, 10, 11, 10, 0, 17, 0, 
	14, 13, 14, 13, 1, 13, 14, 13, 
	14, 13, 14, 13, 0
};

static const char _moneo_parser_trans_actions[] = {
	0, 0, 0, 7, 0, 7, 0, 7, 
	0, 3, 0, 3, 7, 5, 5, 5, 
	0, 7, 0, 0, 0, 7, 0, 7, 
	0, 3, 0, 3, 7, 5, 5, 5, 
	0, 7, 0, 0, 0, 7, 0, 7, 
	1, 0, 1, 0, 0, 0, 26, 15, 
	18, 9, 22, 12, 0
};

static const char _moneo_parser_eof_actions[] = {
	0, 7, 7, 7, 7, 7, 7, 7, 
	7, 7, 7, 7, 0, 1, 1, 26, 
	18, 22
};

static const int moneo_parser_start = 12;
static const int moneo_parser_first_final = 12;
static const int moneo_parser_error = 0;

static const int moneo_parser_en_main = 12;


#line 128 "MoneoParser.m.rl"

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

+ (MoneoTemplate *)parseTemplate:(NSString *)input error:(NSError **)error {
  MoneoParser *parser = [[self alloc] init];
  return [parser parseTemplate:input error:error];
}

- (instancetype)init {
  self = [super init];
  if( self ) {
    
#line 131 "MoneoParser.m"
	{
	cs = moneo_parser_start;
	}

#line 157 "MoneoParser.m.rl"
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
  
#line 149 "MoneoParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
	if ( cs == 0 )
		goto _out;
_resume:
	_keys = _moneo_parser_trans_keys + _moneo_parser_key_offsets[cs];
	_trans = _moneo_parser_index_offsets[cs];

	_klen = _moneo_parser_single_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + _klen - 1;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + ((_upper-_lower) >> 1);
			if ( (*p) < *_mid )
				_upper = _mid - 1;
			else if ( (*p) > *_mid )
				_lower = _mid + 1;
			else {
				_trans += (unsigned int)(_mid - _keys);
				goto _match;
			}
		}
		_keys += _klen;
		_trans += _klen;
	}

	_klen = _moneo_parser_range_lengths[cs];
	if ( _klen > 0 ) {
		const char *_lower = _keys;
		const char *_mid;
		const char *_upper = _keys + (_klen<<1) - 2;
		while (1) {
			if ( _upper < _lower )
				break;

			_mid = _lower + (((_upper-_lower) >> 1) & ~1);
			if ( (*p) < _mid[0] )
				_upper = _mid - 2;
			else if ( (*p) > _mid[1] )
				_lower = _mid + 2;
			else {
				_trans += (unsigned int)((_mid - _keys)>>1);
				goto _match;
			}
		}
		_trans += _klen;
	}

_match:
	cs = _moneo_parser_trans_targs[_trans];

	if ( _moneo_parser_trans_actions[_trans] == 0 )
		goto _again;

	_acts = _moneo_parser_actions + _moneo_parser_trans_actions[_trans];
	_nacts = (unsigned int) *_acts++;
	while ( _nacts-- > 0 )
	{
		switch ( *_acts++ )
		{
	case 0:
#line 31 "MoneoParser.m.rl"
	{
    _chunk_start = p;
  }
	break;
	case 1:
#line 35 "MoneoParser.m.rl"
	{
    long length = p - _chunk_start;
    char buffer[length+1];
    memset( buffer, 0x00, length+1 );
    strncpy( buffer, _chunk_start, p-_chunk_start );
    _chunk = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];

    if( ![_chunk isEqualToString:@""] ) {
       MoneoEmitNode *node = [[MoneoEmitNode alloc] initWithParent:_curBlock chunk:_chunk];
        [_curBlock addChild:node];
//        NSLog( @">CHUNK = %@", _chunk );
    }
    _chunk_start = p;
  }
	break;
	case 2:
#line 50 "MoneoParser.m.rl"
	{
    _keypath_start = p;
  }
	break;
	case 3:
#line 54 "MoneoParser.m.rl"
	{
    long length = p - _keypath_start;
    char buffer[length+1];
    memset( buffer, 0x00, length+1 );
    strncpy( buffer, _keypath_start, p-_keypath_start );
    _keypath = [[NSString alloc] initWithCString:buffer encoding:NSUTF8StringEncoding];
//    NSLog( @"*KEYPATH = %@", _keypath );
  }
	break;
	case 4:
#line 63 "MoneoParser.m.rl"
	{
//    NSLog( @"*eval*" );
    MoneoEvalNode *node = [[MoneoEvalNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
//    NSLog( @"curBlock=%@", _curBlock );
  }
	break;
	case 5:
#line 70 "MoneoParser.m.rl"
	{
//    NSLog( @"*iter:%@*", _keypath );
    MoneoIterNode *node = [[MoneoIterNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    _curBlock = node;
//    NSLog( @"curBlock=%@", _curBlock );
  }
	break;
	case 6:
#line 78 "MoneoParser.m.rl"
	{
//    NSLog( @"*clblk*" );
    _curBlock = _curBlock.parent;
//    NSLog( @"curBlock=%@", _curBlock );
  }
	break;
	case 7:
#line 84 "MoneoParser.m.rl"
	{
    NSLog( @"ERROR" );
  }
	break;
#line 295 "MoneoParser.m"
		}
	}

_again:
	if ( cs == 0 )
		goto _out;
	if ( ++p != pe )
		goto _resume;
	_test_eof: {}
	if ( p == eof )
	{
	const char *__acts = _moneo_parser_actions + _moneo_parser_eof_actions[cs];
	unsigned int __nacts = (unsigned int) *__acts++;
	while ( __nacts-- > 0 ) {
		switch ( *__acts++ ) {
	case 0:
#line 31 "MoneoParser.m.rl"
	{
    _chunk_start = p;
  }
	break;
	case 1:
#line 35 "MoneoParser.m.rl"
	{
    long length = p - _chunk_start;
    char buffer[length+1];
    memset( buffer, 0x00, length+1 );
    strncpy( buffer, _chunk_start, p-_chunk_start );
    _chunk = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];

    if( ![_chunk isEqualToString:@""] ) {
       MoneoEmitNode *node = [[MoneoEmitNode alloc] initWithParent:_curBlock chunk:_chunk];
        [_curBlock addChild:node];
//        NSLog( @">CHUNK = %@", _chunk );
    }
    _chunk_start = p;
  }
	break;
	case 4:
#line 63 "MoneoParser.m.rl"
	{
//    NSLog( @"*eval*" );
    MoneoEvalNode *node = [[MoneoEvalNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
//    NSLog( @"curBlock=%@", _curBlock );
  }
	break;
	case 5:
#line 70 "MoneoParser.m.rl"
	{
//    NSLog( @"*iter:%@*", _keypath );
    MoneoIterNode *node = [[MoneoIterNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    _curBlock = node;
//    NSLog( @"curBlock=%@", _curBlock );
  }
	break;
	case 6:
#line 78 "MoneoParser.m.rl"
	{
//    NSLog( @"*clblk*" );
    _curBlock = _curBlock.parent;
//    NSLog( @"curBlock=%@", _curBlock );
  }
	break;
	case 7:
#line 84 "MoneoParser.m.rl"
	{
    NSLog( @"ERROR" );
  }
	break;
#line 367 "MoneoParser.m"
		}
	}
	}

	_out: {}
	}

#line 169 "MoneoParser.m.rl"
  return template;
}

- (MoneoTemplate *)parseTemplate:(NSString *)input error:(NSError **)error {
  if( input == nil ) {
    *error = [NSError errorWithDomain:@"Moneo" code:MoneoNilTemplateError userInfo:@{NSLocalizedDescriptionKey:@"Template 'input' parameter may not be nil."}];
    return nil;
  }
  const char *buffer = [input cStringUsingEncoding:NSUTF8StringEncoding];
  MoneoTemplateNode *templateNode = [self parseBuffer:buffer length:strlen(buffer)];
  if( templateNode ) {
    return [[MoneoTemplate alloc] initWithAST:templateNode];
  } else {
    return nil;
  }
}

@end
