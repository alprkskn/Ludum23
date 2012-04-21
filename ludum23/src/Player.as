package  
{
	import Box2D.Dynamics.b2World;
	import flash.geom.ColorTransform;
	import flash.geom.Rectangle;
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class Player extends FlxGroup 
	{
		public var mainSprite:Planet;
		public var bM:BulletManager;

		public function Player(world:b2World, x:int, y:int) 
		{
			mainSprite = new Planet(world, x, y, 16);
			mainSprite.pixels.colorTransform(	new Rectangle(0, 0, mainSprite.width, mainSprite.height),
												new ColorTransform(0.6, 0.3, 0.7));
			bM = new BulletManager();
			add(mainSprite);
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
			
		}
		
	}
	

}