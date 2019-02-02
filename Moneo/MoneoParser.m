
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

//#define DEBUG_LOG


#line 154 "MoneoParser.m.rl"


/* Ragel Working State */

#line 29 "MoneoParser.m"
static const char _moneo_parser_actions[] = {
	0, 1, 1, 1, 2, 1, 3, 1, 
	8, 2, 4, 0, 2, 5, 0, 2, 
	6, 0, 2, 7, 0, 3, 4, 0, 
	1, 3, 5, 0, 1, 3, 6, 0, 
	1, 3, 7, 0, 1
};

static const char _moneo_parser_key_offsets[] = {
	0, 0, 4, 10, 16, 20, 21, 27, 
	33, 37, 38, 39, 40, 46, 52, 56, 
	57, 58, 59, 60, 61, 62, 63
};

static const char _moneo_parser_trans_keys[] = {
	42, 45, 47, 61, 32, 126, 9, 13, 
	33, 124, 32, 125, 9, 13, 33, 126, 
	32, 125, 9, 13, 125, 32, 126, 9, 
	13, 33, 124, 32, 125, 9, 13, 33, 
	126, 32, 125, 9, 13, 125, 125, 125, 
	32, 126, 9, 13, 33, 124, 32, 125, 
	9, 13, 33, 126, 32, 125, 9, 13, 
	125, 123, 123, 123, 123, 123, 123, 123, 
	0
};

static const char _moneo_parser_single_lengths[] = {
	0, 4, 2, 2, 2, 1, 2, 2, 
	2, 1, 1, 1, 2, 2, 2, 1, 
	1, 1, 1, 1, 1, 1, 1
};

static const char _moneo_parser_range_lengths[] = {
	0, 0, 2, 2, 1, 0, 2, 2, 
	1, 0, 0, 0, 2, 2, 1, 0, 
	0, 0, 0, 0, 0, 0, 0
};

static const char _moneo_parser_index_offsets[] = {
	0, 0, 5, 10, 15, 19, 21, 26, 
	31, 35, 37, 39, 41, 46, 51, 55, 
	57, 59, 61, 63, 65, 67, 69
};

static const char _moneo_parser_trans_targs[] = {
	2, 6, 10, 12, 0, 2, 3, 2, 
	3, 0, 4, 5, 4, 3, 0, 4, 
	5, 4, 0, 19, 0, 6, 7, 6, 
	7, 0, 8, 9, 8, 7, 0, 8, 
	9, 8, 0, 20, 0, 11, 0, 21, 
	0, 12, 13, 12, 13, 0, 14, 15, 
	14, 13, 0, 14, 15, 14, 0, 22, 
	0, 18, 17, 18, 17, 1, 17, 18, 
	17, 18, 17, 18, 17, 18, 17, 0
};

static const char _moneo_parser_trans_actions[] = {
	0, 0, 0, 0, 7, 0, 3, 0, 
	3, 7, 5, 5, 5, 0, 7, 0, 
	0, 0, 7, 0, 7, 0, 3, 0, 
	3, 7, 5, 5, 5, 0, 7, 0, 
	0, 0, 7, 0, 7, 0, 7, 0, 
	7, 0, 3, 0, 3, 7, 5, 5, 
	5, 0, 7, 0, 0, 0, 7, 0, 
	7, 1, 0, 1, 0, 0, 0, 25, 
	12, 29, 15, 33, 18, 21, 9, 0
};

static const char _moneo_parser_eof_actions[] = {
	0, 7, 7, 7, 7, 7, 7, 7, 
	7, 7, 7, 7, 7, 7, 7, 7, 
	0, 1, 1, 25, 29, 33, 21
};

static const int moneo_parser_start = 16;
static const int moneo_parser_first_final = 16;
static const int moneo_parser_error = 0;

static const int moneo_parser_en_main = 16;


#line 158 "MoneoParser.m.rl"

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
    _error = nil;
    
#line 137 "MoneoParser.m"
	{
	cs = moneo_parser_start;
	}

#line 183 "MoneoParser.m.rl"
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
  
#line 155 "MoneoParser.m"
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
#line 33 "MoneoParser.m.rl"
	{
    _chunk_start = p;
  }
	break;
	case 1:
#line 37 "MoneoParser.m.rl"
	{
    long length = p - _chunk_start;
    char buffer[length+1];
    memset( buffer, 0x00, length+1 );
    strncpy( buffer, _chunk_start, p-_chunk_start );
    _chunk = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];

    if( ![_chunk isEqualToString:@""] ) {
       MoneoEmitNode *node = [[MoneoEmitNode alloc] initWithParent:_curBlock chunk:_chunk];
        [_curBlock addChild:node];
        #ifdef DEBUG_LOG
        NSLog( @">CHUNK = %@", _chunk );
        #endif
    }
    _chunk_start = p;
  }
	break;
	case 2:
#line 54 "MoneoParser.m.rl"
	{
    _keypath_start = p;
  }
	break;
	case 3:
#line 58 "MoneoParser.m.rl"
	{
    long length = p - _keypath_start;
    char buffer[length+1];
    memset( buffer, 0x00, length+1 );
    strncpy( buffer, _keypath_start, p-_keypath_start );
    _keypath = [[NSString alloc] initWithCString:buffer encoding:NSUTF8StringEncoding];
    #ifdef DEBUG_LOG
    NSLog( @"*KEYPATH = %@", _keypath );
    #endif
  }
	break;
	case 4:
#line 69 "MoneoParser.m.rl"
	{
    MoneoEvalNode *node = [[MoneoEvalNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    #ifdef DEBUG_LOG
    NSLog( @"*EVAL* curBlock=%@", _curBlock );
    #endif
  }
	break;
	case 5:
#line 77 "MoneoParser.m.rl"
	{
    MoneoIterNode *node = [[MoneoIterNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    _curBlock = node;
    #ifdef DEBUG_LOG
    NSLog( @"*ITER* curBlock=%@", _curBlock );
    #endif
  }
	break;
	case 6:
#line 86 "MoneoParser.m.rl"
	{
    MoneoMissingNode *node = [[MoneoMissingNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    _curBlock = node;
    #ifdef DEBUG_LOG
    NSLog( @"*MISS* curBlock=%@", _curBlock );
    #endif
  }
	break;
	case 7:
#line 95 "MoneoParser.m.rl"
	{
    _curBlock = _curBlock.parent;
  }
	break;
	case 8:
#line 99 "MoneoParser.m.rl"
	{
    self.error = [NSError errorWithDomain:@"Moneo"
                                     code:MoneoParsingTemplateError
                                 userInfo:@{NSLocalizedDescriptionKey:@"Template did not parse correctly."}];
                                 #ifdef DEBUG_LOG
                                 NSLog( @"*ERROR*" );
                                 #endif
  }
	break;
#line 321 "MoneoParser.m"
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
#line 33 "MoneoParser.m.rl"
	{
    _chunk_start = p;
  }
	break;
	case 1:
#line 37 "MoneoParser.m.rl"
	{
    long length = p - _chunk_start;
    char buffer[length+1];
    memset( buffer, 0x00, length+1 );
    strncpy( buffer, _chunk_start, p-_chunk_start );
    _chunk = [NSString stringWithCString:buffer encoding:NSUTF8StringEncoding];

    if( ![_chunk isEqualToString:@""] ) {
       MoneoEmitNode *node = [[MoneoEmitNode alloc] initWithParent:_curBlock chunk:_chunk];
        [_curBlock addChild:node];
        #ifdef DEBUG_LOG
        NSLog( @">CHUNK = %@", _chunk );
        #endif
    }
    _chunk_start = p;
  }
	break;
	case 4:
#line 69 "MoneoParser.m.rl"
	{
    MoneoEvalNode *node = [[MoneoEvalNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    #ifdef DEBUG_LOG
    NSLog( @"*EVAL* curBlock=%@", _curBlock );
    #endif
  }
	break;
	case 5:
#line 77 "MoneoParser.m.rl"
	{
    MoneoIterNode *node = [[MoneoIterNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    _curBlock = node;
    #ifdef DEBUG_LOG
    NSLog( @"*ITER* curBlock=%@", _curBlock );
    #endif
  }
	break;
	case 6:
#line 86 "MoneoParser.m.rl"
	{
    MoneoMissingNode *node = [[MoneoMissingNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    _curBlock = node;
    #ifdef DEBUG_LOG
    NSLog( @"*MISS* curBlock=%@", _curBlock );
    #endif
  }
	break;
	case 7:
#line 95 "MoneoParser.m.rl"
	{
    _curBlock = _curBlock.parent;
  }
	break;
	case 8:
#line 99 "MoneoParser.m.rl"
	{
    self.error = [NSError errorWithDomain:@"Moneo"
                                     code:MoneoParsingTemplateError
                                 userInfo:@{NSLocalizedDescriptionKey:@"Template did not parse correctly."}];
                                 #ifdef DEBUG_LOG
                                 NSLog( @"*ERROR*" );
                                 #endif
  }
	break;
#line 411 "MoneoParser.m"
		}
	}
	}

	_out: {}
	}

#line 195 "MoneoParser.m.rl"
  return template;
}

- (MoneoTemplate *)parseTemplate:(NSString *)input {
  if( input == nil ) {
    self.error = [NSError errorWithDomain:@"Moneo"
                                code:MoneoNilTemplateError
                            userInfo:@{NSLocalizedDescriptionKey:@"Template 'input' parameter may not be nil."}];
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
