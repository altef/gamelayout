gamelayout
==========

Manages scenes and is probably super buggy.  Each scene is basically a [Sprite](http://www.openfl.org/documentation/api/flash/display/Sprite.html)



###Usage
######Import the classes
```haxe
import com.gigglingcorpse.gamelayout.System;
import com.gigglingcorpse.gamelayout.Memory;
import com.gigglingcorpse.gamelayout.Scene;
```

######Instantiate the system
```haxe
system = new System();
addChild( system );
```

######Add scenes
```haxe
// Add some scenes (Scenes extend com.gigglingcorpse.gamelayout.Scene)
system.addScene( "Splash", new MenuScene() );
system.addScene( "game", new Level1() );
```

######Set a scene(or switch between them)
```haxe
// Switch to a scene
system.scene( "Splash" );
```


######webhook test
3