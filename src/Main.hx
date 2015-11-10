package;

/**
 * ...
 * @author Skial Bainn
 */
@:build( uhx.macro.StringRange.build() )
class Main {
	
	static function main() {
		var range = 'b'...'z';
		trace( range );
		for (character in 'a'...'z') {
			trace( character );
			
		}
	}
	
}