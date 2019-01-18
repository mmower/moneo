#  Moneo

An Objective-C template parsing and rendering framework.

## Motivation

Moneo exists for four reasons

* I was using existing Mustache libraries however they were either not well maintained, not Objective-C friendly, or both.
* Mustache contains a number of features that did not make sense in my context and created possible edge-cases I didn't want to have to deal with.
* I needed to know what expressions are being used in a template and none of the Mustache processors provided easy access to that meaning I was going to have to hack them or write my own parser to pull that info out.
* I'm rendering a lot of smallish templates very often, I need it as fast as possible. Moneo uses a Ragel generated parser and does its best to reduce templates into a fast form for rendering (in the future we might explore other representations and even using the `tcc` library to dynamically generate rendering functions).

## Important

Moneo is very much a work in progress. It's on Github because I wanted to check that I could include it in my app, Mentat, using Carthage. Template parsing is mostly complete but rendering is currently implemented using an AST walk and keypath evaluation is kind of hazy.

## Installation

I use Carthage and Moneo should be very simple to install by adding to your Cartfile and using `cathage update`. I'm building on macOS I've no reason to suppose the the current version of Moneo wouldn't work on iOS but I haven't tried it.

## Usage

~~~~
#import <Moneo/Moneo.h>

- (NSSting *)renderEmail {
  MoneoParser *parser = [[MoneoParser alloc] init];

  MoneoTemplate *template = [parse parse:@"<p>{{=email}}</p>"];
  NSString *output = template.render( @{"email":@"matt@theartofnavigation.co.uk"} );
}
~~~~

## Template Syntax

If you are familiar with Mustache, Moneo will hold no suprises. I changed the sigils slightly to make more sense to me but conceptually it's pretty simple.

### Evaluate

To evaluate a value use `{{=<keypath>}}` where `<keypath>` is a key in the context.

Example:

~~~~
{{=<keypath>}}
~~~~

### Iterate

Iterate determines whether a key has a value or not. If it does it treats a single value as a 1-element list. It then iterates the list interpreting everything up to the enclosing `{{/}}` for each value of the list.

Example:

~~~~
{{@<keypath>}}
Something something
{{/}}
~~~~

### Missing

Missing determines whether a key has a value or not. If it does it emits nothing, otherwise it evaluates everything up to the enclosing `{{/}}`.

Example:

~~~~
{{!<keypath>}}
something something
{{/}}
~~~~

And that's it. There is no support for including other templates, reading templates from files, etc…

## Contexts

Rendering happens in a context. This is passed to the `render` method of the `MoneoTemplate`.

## Error Handling

Right now there is none. (See Notes above!)

