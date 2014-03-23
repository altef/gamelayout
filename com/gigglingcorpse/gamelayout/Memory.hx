package com.gigglingcorpse.gamelayout;


class Memory {

	

	private var map:Map<String,Dynamic>;

	public function new( ) {
		map = new Map<String,Dynamic>();
	}


	public function exists( key:String ) : Bool {
		return map.exists( key );
	}

	public function get( key:String ) : Null<Dynamic> {
		return map.get( key );
	}

	public function set( key:String, value:Dynamic ) : Void {
		map.set( key, value );
	}

	public function remove( key:String ) : Bool {
		return map.remove( key );
	}

	public function toString() : String {
		return map.toString( );
	}



}