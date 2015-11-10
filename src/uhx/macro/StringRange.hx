package uhx.macro;

import haxe.macro.Type;
import haxe.macro.Expr;
import haxe.macro.Context;

using haxe.macro.ExprTools;

/**
 * ...
 * @author Skial Bainn
 */
class StringRange {

	public static function build():Array<Field> {
		var fields = Context.getBuildFields();
		
		for (field in fields) switch (field.kind) {
			case FFun(m):
				m.expr.iter( handler );
				
			case _:
				
		}
		
		return fields;
	}
	
	public static function handler(expr:Expr) {
		switch (expr.expr) {
			case EBinop( OpInterval, { expr:EConst(CString(start)), pos:_ }, { expr:EConst(CString(end)), pos:_ } ) if(start.length > 0 && end.length > 0):
				var values = [for (code in StringTools.fastCodeAt( start, 0 )...StringTools.fastCodeAt( end, 0 )+1) String.fromCharCode( code )];
				var exprs = values.map( function(s) { return macro $v { s }; } );
				expr.expr = (macro $a { exprs } ).expr;
				
			case _:
				expr.iter( handler );
				
		}
	}
	
}