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
		
		// ranges in reverse
		var range = 'z'...'a';
		trace(range);
		
		for (character in 'z'...'a') trace( character );
		
		var characters = [for (character in 'z'...'a') character];
		trace( characters );
		
		// unicode ranges - À...Å
		var range = '\u00C0'...'\u00C5';
		trace( range );
		
		var range = 'À'...'Å';
		trace( range );
		
		for (character in 'À'...'Å') trace( character );
		
		var characters = [for (character in 'À'...'Å') character];
		trace( characters );
		
		// unicode in reverse
		var range = 'Å'...'À';
		trace( range );
		
		for (character in 'Å'...'À') trace( character );
		
		var characters = [for (character in 'Å'...'À') character];
		trace( characters );
	}
	
}