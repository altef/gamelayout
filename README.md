gamelayout
==========

manages scenes and is probably super buggy


import com.gigglingcorpse.gamelayout.System;
import com.gigglingcorpse.gamelayout.Memory;
import com.gigglingcorpse.gamelayout.Scene;

system = new System();
addChild( system );


// Add some scenes (Scenes extend com.gigglingcorpse.gamelayout.Scene)
system.addScene( "Splash", new MenuScene() );
system.addScene( "game", new Level1() );

// Switch to a scene
system.scene( "Splash" );
