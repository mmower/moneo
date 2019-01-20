
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
	0, 1, 1, 1, 2, 1, 3, 2, 
	2, 1, 2, 4, 0, 2, 5, 0, 
	2, 6, 0, 3, 4, 0, 1, 3, 
	4, 0, 5, 3, 4, 0, 6, 3, 
	5, 0, 1, 3, 5, 0, 6, 3, 
	6, 0, 1, 4, 4, 0, 5, 1, 
	4, 4, 0, 5, 6, 4, 4, 0, 
	6, 1, 4, 5, 0, 6, 1, 5, 
	4, 0, 5, 6, 1
};

static const unsigned char _moneo_parser_key_offsets[] = {
	0, 1, 2, 3, 7, 9, 11, 12, 
	19, 26, 31, 33, 34, 41, 51, 58, 
	60, 61, 68, 75, 82, 89, 96, 101, 
	103, 104, 111, 121, 128, 130, 131, 138, 
	145, 152, 157, 159, 160, 167, 177, 184, 
	186, 187, 194, 201, 208, 215, 222, 229
};

static const char _moneo_parser_trans_keys[] = {
	123, 123, 123, 47, 61, 64, 123, 123, 
	125, 123, 125, 123, 32, 123, 126, 9, 
	13, 33, 124, 32, 123, 125, 9, 13, 
	33, 126, 32, 123, 125, 9, 13, 123, 
	125, 123, 32, 123, 125, 9, 13, 33, 
	126, 32, 47, 61, 64, 123, 125, 9, 
	13, 33, 126, 32, 123, 125, 9, 13, 
	33, 126, 123, 125, 123, 32, 123, 125, 
	9, 13, 33, 126, 32, 123, 125, 9, 
	13, 33, 126, 32, 123, 125, 9, 13, 
	33, 126, 32, 123, 125, 9, 13, 33, 
	126, 32, 123, 125, 9, 13, 33, 126, 
	32, 123, 125, 9, 13, 123, 125, 123, 
	32, 123, 125, 9, 13, 33, 126, 32, 
	47, 61, 64, 123, 125, 9, 13, 33, 
	126, 32, 123, 125, 9, 13, 33, 126, 
	123, 125, 123, 32, 123, 125, 9, 13, 
	33, 126, 32, 123, 125, 9, 13, 33, 
	126, 32, 123, 125, 9, 13, 33, 126, 
	32, 123, 125, 9, 13, 123, 125, 123, 
	32, 123, 125, 9, 13, 33, 126, 32, 
	47, 61, 64, 123, 125, 9, 13, 33, 
	126, 32, 123, 125, 9, 13, 33, 126, 
	123, 125, 123, 32, 123, 125, 9, 13, 
	33, 126, 32, 123, 125, 9, 13, 33, 
	126, 32, 123, 125, 9, 13, 33, 126, 
	32, 123, 125, 9, 13, 33, 126, 32, 
	123, 125, 9, 13, 33, 126, 32, 123, 
	125, 9, 13, 33, 126, 32, 123, 126, 
	9, 13, 33, 124, 0
};

static const char _moneo_parser_single_lengths[] = {
	1, 1, 1, 4, 2, 2, 1, 3, 
	3, 3, 2, 1, 3, 6, 3, 2, 
	1, 3, 3, 3, 3, 3, 3, 2, 
	1, 3, 6, 3, 2, 1, 3, 3, 
	3, 3, 2, 1, 3, 6, 3, 2, 
	1, 3, 3, 3, 3, 3, 3, 3
};

static const char _moneo_parser_range_lengths[] = {
	0, 0, 0, 0, 0, 0, 0, 2, 
	2, 1, 0, 0, 2, 2, 2, 0, 
	0, 2, 2, 2, 2, 2, 1, 0, 
	0, 2, 2, 2, 0, 0, 2, 2, 
	2, 1, 0, 0, 2, 2, 2, 0, 
	0, 2, 2, 2, 2, 2, 2, 2
};

static const short _moneo_parser_index_offsets[] = {
	0, 2, 4, 6, 11, 14, 17, 19, 
	25, 31, 36, 39, 41, 47, 56, 62, 
	65, 67, 73, 79, 85, 91, 97, 102, 
	105, 107, 113, 122, 128, 131, 133, 139, 
	145, 151, 156, 159, 161, 167, 176, 182, 
	185, 187, 193, 199, 205, 211, 217, 223
};

static const char _moneo_parser_indicies[] = {
	1, 0, 1, 0, 2, 0, 3, 4, 
	5, 2, 0, 1, 6, 0, 1, 7, 
	0, 9, 8, 4, 11, 10, 4, 10, 
	0, 12, 14, 15, 12, 13, 0, 16, 
	1, 17, 16, 0, 1, 18, 0, 20, 
	19, 12, 21, 15, 12, 13, 0, 12, 
	22, 23, 24, 21, 15, 12, 13, 0, 
	12, 14, 25, 12, 13, 0, 1, 26, 
	0, 28, 27, 29, 11, 15, 29, 10, 
	0, 30, 11, 17, 30, 10, 0, 31, 
	33, 15, 31, 32, 0, 34, 36, 17, 
	34, 35, 0, 37, 39, 40, 37, 38, 
	0, 41, 1, 42, 41, 0, 1, 43, 
	0, 45, 44, 37, 46, 40, 37, 38, 
	0, 37, 47, 48, 49, 46, 40, 37, 
	38, 0, 37, 39, 50, 37, 38, 0, 
	1, 51, 0, 53, 52, 54, 33, 40, 
	54, 32, 0, 55, 11, 42, 55, 10, 
	0, 56, 58, 59, 56, 57, 0, 60, 
	1, 61, 60, 0, 1, 62, 0, 64, 
	63, 56, 65, 59, 56, 57, 0, 56, 
	66, 67, 68, 65, 59, 56, 57, 0, 
	56, 58, 69, 56, 57, 0, 1, 70, 
	0, 72, 71, 73, 33, 59, 73, 32, 
	0, 74, 11, 61, 74, 10, 0, 75, 
	33, 59, 75, 32, 0, 76, 36, 61, 
	76, 35, 0, 77, 36, 40, 77, 35, 
	0, 78, 36, 42, 78, 35, 0, 5, 
	36, 35, 5, 35, 0, 0
};

static const char _moneo_parser_trans_targs[] = {
	1, 2, 3, 4, 7, 47, 5, 6, 
	1, 2, 8, 12, 9, 8, 12, 10, 
	9, 10, 11, 1, 2, 13, 14, 17, 
	19, 15, 16, 1, 2, 18, 18, 20, 
	32, 36, 20, 21, 25, 22, 21, 25, 
	23, 22, 23, 24, 1, 2, 26, 27, 
	30, 45, 28, 29, 1, 2, 31, 31, 
	33, 32, 36, 34, 33, 34, 35, 1, 
	2, 37, 38, 41, 43, 39, 40, 1, 
	2, 42, 42, 44, 44, 46, 46
};

static const char _moneo_parser_trans_actions[] = {
	0, 1, 1, 0, 0, 0, 0, 0, 
	16, 39, 3, 7, 5, 0, 1, 5, 
	0, 0, 0, 10, 19, 1, 0, 0, 
	0, 5, 0, 27, 53, 5, 0, 5, 
	3, 7, 0, 3, 7, 5, 0, 1, 
	5, 0, 0, 0, 13, 31, 1, 0, 
	0, 0, 5, 0, 35, 58, 5, 0, 
	5, 0, 1, 5, 0, 0, 0, 23, 
	43, 1, 0, 0, 0, 5, 0, 48, 
	63, 5, 0, 5, 0, 5, 0
};

static const char _moneo_parser_eof_actions[] = {
	0, 1, 1, 1, 1, 1, 39, 1, 
	1, 1, 1, 19, 1, 1, 1, 1, 
	53, 1, 1, 1, 1, 1, 1, 1, 
	31, 1, 1, 1, 1, 58, 1, 1, 
	1, 1, 1, 43, 1, 1, 1, 1, 
	63, 1, 1, 1, 1, 1, 1, 1
};

static const int moneo_parser_start = 0;
static const int moneo_parser_first_final = 0;
static const int moneo_parser_error = -1;

static const int moneo_parser_en_main = 0;


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
    
#line 213 "MoneoParser.m"
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
  
#line 231 "MoneoParser.m"
	{
	int _klen;
	unsigned int _trans;
	const char *_acts;
	unsigned int _nacts;
	const char *_keys;

	if ( p == pe )
		goto _test_eof;
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
	_trans = _moneo_parser_indicies[_trans];
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
        //NSLog( @">CHUNK = %@", _chunk );
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
    //NSLog( @"*KEYPATH = %@", _keypath );
  }
	break;
	case 4:
#line 63 "MoneoParser.m.rl"
	{
    //NSLog( @"*eval*" );
    MoneoEvalNode *node = [[MoneoEvalNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    //NSLog( @"curBlock=%@", _curBlock );
  }
	break;
	case 5:
#line 70 "MoneoParser.m.rl"
	{
    //NSLog( @"*iter:%@*", _keypath );
    MoneoIterNode *node = [[MoneoIterNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    _curBlock = node;
    //NSLog( @"curBlock=%@", _curBlock );
  }
	break;
	case 6:
#line 78 "MoneoParser.m.rl"
	{
    //NSLog( @"*clblk*" );
    _curBlock = _curBlock.parent;
    //NSLog( @"curBlock=%@", _curBlock );
  }
	break;
#line 370 "MoneoParser.m"
		}
	}

_again:
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
        //NSLog( @">CHUNK = %@", _chunk );
    }
    _chunk_start = p;
  }
	break;
	case 4:
#line 63 "MoneoParser.m.rl"
	{
    //NSLog( @"*eval*" );
    MoneoEvalNode *node = [[MoneoEvalNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    //NSLog( @"curBlock=%@", _curBlock );
  }
	break;
	case 5:
#line 70 "MoneoParser.m.rl"
	{
    //NSLog( @"*iter:%@*", _keypath );
    MoneoIterNode *node = [[MoneoIterNode alloc] initWithParent:_curBlock keyPath:_keypath];
    [_curBlock addChild:node];
    _curBlock = node;
    //NSLog( @"curBlock=%@", _curBlock );
  }
	break;
	case 6:
#line 78 "MoneoParser.m.rl"
	{
    //NSLog( @"*clblk*" );
    _curBlock = _curBlock.parent;
    //NSLog( @"curBlock=%@", _curBlock );
  }
	break;
#line 434 "MoneoParser.m"
		}
	}
	}

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
