package;

/**
 * ...
 * @author Skial Bainn
 */
@:build( uhx.macro.StringRange.build() )
class Main {
	
	static function main() {
		var range = 'a'...'z';
		trace(range);
		
		for (character in 'a'...'z') trace( character );
		
		var characters = [for (character in 'a'...'z') character];
		trace( characters );
		
		// in reverse
		var range = 'z'...'a';
		trace(range);
		
		for (character in 'z'...'a') trace( character );
		
		var characters = [for (character in 'z'...'a') character];
		trace( characters );
	}
	
}