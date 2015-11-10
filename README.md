# string-range

An explorational Haxe build macro which adds String ranges to Haxe.

## Setup

You add `@:build( uhx.macro.StringRange.build() )` to the top of
each class you intend to use string ranges in.

## Syntax

The syntax is as follows.

```Haxe
package ;

@:build( uhx.macro.StringRange.build() )
class Main {
	
	public static function main() {
		var alphabet = 'a'...'z';
		trace( alphabet ); // abcdefghijklmnopqrstuvwxyz
		
		var reverseAlphabet = 'z'...'a';
		trace( reverseAlphabet ); // zyxwvutsrqponmlkjihgfedcba
	}
	
}

## How it works

Internally, the first character of `'a'...'z'` is converted to a code point.
So, `a` codepoint is `97` and `z` codepoint is `122`. As `97 < 122`, we just
count up and turn each codepoint into a string. The opposite is true for `'z'...'a'`.
For unicode characters, the [unifill](https://github.com/mandel59/unifill "Unifill - Unicode in Haxe")
library.
