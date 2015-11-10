package;

/**
 * ...
 * @author Skial Bainn
 */
@:build( uhx.macro.StringRange.build() )
class Main {
	
	static function main() {
		for (character in 'a'...'z') {
			trace( character );
			
		}
	}
	
}