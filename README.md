#  Moneo

An Objective-C template parsing and rendering framework.

## Motivation

Moneo exists for four reasons:

* I was using existing Mustache libraries however they were either not well maintained, not Objective-C friendly, or both.
* Mustache contains a number of features that did not make sense in my context and created possible edge-cases I didn't want to have to deal with.
* I needed to know what expressions are being used in a template and none of the Mustache processors provided easy access to that meaning I was going to have to hack them or write my own parser to pull that info out.
* I'm rendering a lot of smallish templates very often, I need it as fast as possible. Moneo uses a [Ragel](http://www.colm.net/open-source/ragel/) generated parser and does its best to reduce templates into a fast form for rendering. At the moment this means transforming into blocks that append to an NSMutableString. Peformance is reasonably dependent on cost of keypath evaluation and calls to -appendString. In the future we might explore other representations and perhaps using something like the [tcc](https://bellard.org/tcc/) library to dynamically generate rendering functions.

## Important

Moneo is a work in progress. It's essentially feature complete but implemented to a level that supports my forthcoming app, Mentat. YMMV.

## Installation

I use Carthage and Moneo should be very simple to install by adding the repo to your `Cartfile` and using `cathage update`. I'm building on macOS I've no reason to suppose the the current version of Moneo wouldn't work on iOS but I haven't tried it.

## Usage

~~~~
#import <Moneo/Moneo.h>

- (NSSting *)renderEmail {
  MoneoParser *parser = [[MoneoParser alloc] init];

  MoneoTemplate *template = [parse parse:@"<p>Email: {{=email}}</p>"];
  NSString *output = template.render( @{"email":@"matt@theartofnavigation.co.uk"} );
}
~~~~

## Template Syntax

If you are familiar with Mustache, Moneo will hold no suprises. I changed the sigils slightly to make more sense to me but conceptually it's pretty simple.

### Evaluate

Use the `=` operator to evalute a value in the current context. Where  `{{=<keypath>}}` looks up `<keypath>` in the rendering context.

Example:

~~~~
{{=name}}
~~~~

### Iterate

Use the `*` operator to iterate on a keypath. It gets the value for the keypath in the current context and determines if its a list or not. If not it treats a single value as a 1-element list. It then iterates the list interpreting everything up to the enclosing `{{/}}` for each value of the list.

Example:

~~~~
<ul>
{{*email_addresses}}
<li>{{=address}}</li>
{{/}}
</ul>
~~~~

### Exists

Use the `?` operator to determine if a keypath is present. If it is, the contained block is evaluated, otherwise no output is generated.

Example:

~~~~
<ul>
{{?url}}
<li><a href="{{=url}}">Link</a>
{{/}}
<li>Something else.</li>
</ul>
~~~~

### Missing

Use the `-` operator to detemine if  a keypath is missing. If it is not, the operator nothing, otherwise it evaluates everything up to the enclosing `{{/}}`.

Example:

~~~~
{{-email_addresses}}
<p>User has no email addresses.</p>
{{/}}
~~~~

And that's it. There is no support for including other templates, reading templates from files, etc…

## Contexts

Rendering happens in a context. This is passed to the `render` method of the `MoneoTemplate`. Whenever one of the evaluation, iteration, or missing operators is used the associated `keypath` is resolved in the current context using the `NSKeyValueCoding` method `-valueForKeyPath:`. This allows specifying properties enclosed in objects within the context.

Note that when using the iteration operator `{{*<keypath>}}` the context used when rendering within the contained content will be the series of 1 or more objects obtained from the keypath. 

## Error Handling

The `MoneoParser` has an `error` property which should be checked when parsing fails. Right now there is no diagnostic information about errors as I'm still trying to figure out how you embed this information using Ragel!
