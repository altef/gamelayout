package;


import flash.display.Sprite;
import flash.events.Event;

import com.gigglingcorpse.gamelayout.System;
import com.gigglingcorpse.gamelayout.Memory;
import com.gigglingcorpse.gamelayout.Scene;


class Main extends Sprite {
	
	private var system : System;

	public function new () {
		
		super ();
		
		system = new System();
		addChild( system );


		system.addEventListener("RESET", reset );
		// Test the reset callback
		system.reset();
		
 
		system.addScene( "Splash", new MenuScene() );
		system.addScene( "game", new Level1() );
		system.scene( "Splash" );


	}

	private function reset( e:Event ) {
		// This is where we reset the memory stuff
		System.instance.memory.set("score", 0);
		system.memory.set("level", 1);
	}
	
	
}