package  
{
	import Box2D.Dynamics.b2World;
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class Player extends FlxGroup 
	{
		public var mainSprite:Planet;
		public var shadow:DarkMask;
		public var bM:BulletManager;

		public function Player(world:b2World, x:int, y:int) 
		{
			mainSprite = new Planet(world, x, y, 64, Global.EARTHIMG);
			shadow = new DarkMask(x, y, mainSprite);
			bM = new BulletManager();
			mainSprite.label = "Earth";
			add(mainSprite);
			add(shadow);
			//remove(shadow);
			add(bM);
		}
		
		override public function update():void 
		{
			
			super.update();
			if (FlxG.keys.DOWN) {
				mainSprite.thrustDown();
				//mainSprite.body.ApplyForce(mainSprite.weight, mainSprite.forcePoint);
			}
			
			if (FlxG.keys.UP) {
				mainSprite.thrustUp();
				//mainSprite.body.ApplyForce(mainSprite.verticalForce.GetNegative(), mainSprite.forcePoint);
			}
			
			if (FlxG.keys.RIGHT) {
				mainSprite.thrustRight();
				//mainSprite.body.ApplyForce(mainSprite.horizontalForce, mainSprite.forcePoint);
			}
			
			if (FlxG.keys.LEFT) {
				mainSprite.thrustLeft();
				//mainSprite.body.ApplyForce(mainSprite.horizontalForce.GetNegative(), mainSprite.forcePoint);
			}
			
			if (FlxG.keys.SPACE) {
				//remove(shadow);
			}
			
		}
		
	}
	

}