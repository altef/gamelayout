package com.gigglingcorpse.gamelayout;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;

class System extends Sprite {


	// Get the instance back
	private static var _instance : System;
	public static var instance( get, null ) : System;
	private static function get_instance() {
		if ( _instance == null )
			_instance = new System();
		return _instance;
	}


	// Get the memory back
	private var _memory : Memory;
	public  var memory( get, null ) : Memory;
	private function get_memory() {
		return _memory;
	}




	private var scenes : Map<String,Scene>;
	private var currentScene : Scene;
	private var levelScene : Scene; 


	private var _startTime : Int;
	

	public function new( ) {
		super();
		_memory = new Memory();
		scenes = new Map<String,Scene>();

		Lib.current.stage.addEventListener( Event.ENTER_FRAME, onFrame );
		
		_instance = this;
	}



	public function reset() { 

		// Go through and call reset on all scenes.  Clear out the current scene and the current level scene

		dispatchEvent( new Event( "RESET" ) );
	}


	public function addScene( name:String, scene:Scene ) {
		scenes.set( name, scene );
	}

	public function removeScene( name:String ) : Bool {
		return scenes.remove( name );
	}

	public function scene( name:String ) : Void {

		trace("Switching to scene " + name );


		if ( currentScene != null ) {
			if ( !currentScene.isLevel )
				currentScene.destroy();

			// Remove currentScene from stage
			if ( this.contains( currentScene ))
				this.removeChild( currentScene );
		}
	
		// Swap scenes
		if ( name == "CurrentLevelScene" )
			currentScene = levelScene;

		var s = scenes.get( name );
		currentScene = s;
		if ( s != null ) {
			// Add scene to stage ( can make this more transitiony later if we want )
			addChild( currentScene );
			s.init();
			
			if ( s.isLevel ) {
				if ( levelScene != null )
					levelScene.destroy();
				levelScene = s;
			}
		}

		trace("Scene: " + s);

		dispatchEvent( new Event( "SceneChange" ) ); // This should be a scene change event and pass back the Scene name
		_startTime = Lib.getTimer();
		
	}



	private function onFrame( e:Event ) {
		var time = Lib.getTimer();
		var delta = time-_startTime;
		if ( currentScene != null )
			currentScene.update( delta );		
		_startTime = time;
	}



}