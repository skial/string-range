package uhx.macro;

import haxe.macro.Type;
import haxe.macro.Expr;
import haxe.macro.Context;

using StringTools;
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
			case EIn(e1, { expr: EBinop( OpInterval, { expr:EConst(CString(start)), pos:_ }, { expr:EConst(CString(end)), pos:_ } ), pos:_ } ) if(start.length > 0 && end.length > 0):
				expr.expr = handleRangeIterator( e1, start, end ).expr;
				
			case EVars( vars ): for (v in vars) if (v.expr != null) switch (v.expr.expr) {
				case EBinop( OpInterval, { expr:EConst(CString(start)), pos:_ }, { expr:EConst(CString(end)), pos:_ } ) if (start.length > 0 && end.length > 0):
					v.expr.expr = handleRangeString( start, end ).expr;
					
				case EArrayDecl( [ { expr:EFor(condition, body), pos:_ } ]):
					handler( condition );
					
				case _:
					trace( v.expr );
			}
				
			case _:
				//trace( expr );
				expr.iter( handler );
				
		}
		
	}
	
	public static function handleRangeIterator(e1:Expr, start:String, end:String):Expr {
		var values = [for (code in start.fastCodeAt( 0 )...end.fastCodeAt( 0 )+1) String.fromCharCode( code )];
		var exprs = values.map( function(s) { return macro $v { s }; } );
		return (macro $e1 in $a { exprs } );
	}
	
	public static function handleRangeString(start:String, end:String):Expr {
		var values = [for (code in start.fastCodeAt( 0 )...end.fastCodeAt( 0 )+1) String.fromCharCode( code )];
		return macro $v{ values.join('') };
	}
	
}