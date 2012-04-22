package  
{
	import Box2D.Common.Math.b2Vec2;
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
		public var maxTemperature:Number = 100;
		public var temperature:Number = 100;
		
		private const movementCost:Number = 0.02;
		private const chargeAmount:Number = 0.1;
		
		public function Player(world:b2World, x:int, y:int) 
		{
			mainSprite = new Planet(world, x, y, 64, Global.EARTHIMG);
			shadow = new DarkMask(x, y, mainSprite);
			bM = new BulletManager();
			mainSprite.label = "Earth";
			mainSprite.health = 100;
			add(mainSprite);
			add(shadow);
			//remove(shadow);
			add(bM);
		}
		
		override public function update():void 
		{
			
			super.update();
			if (temperature >= movementCost) {
				
				if (FlxG.keys.DOWN) {
					mainSprite.thrustDown();
					temperature -= movementCost;
					//mainSprite.body.ApplyForce(mainSprite.weight, mainSprite.forcePoint);
				}
				
				if (FlxG.keys.UP) {
					mainSprite.thrustUp();
					temperature -= movementCost;
					//mainSprite.body.ApplyForce(mainSprite.verticalForce.GetNegative(), mainSprite.forcePoint);
				}
				
				if (FlxG.keys.RIGHT) {
					mainSprite.thrustRight();
					temperature -= movementCost;
					//mainSprite.body.ApplyForce(mainSprite.horizontalForce, mainSprite.forcePoint);
				}
				
				if (FlxG.keys.LEFT) {
					mainSprite.thrustLeft();
					temperature -= movementCost;
					//mainSprite.body.ApplyForce(mainSprite.horizontalForce.GetNegative(), mainSprite.forcePoint);
				}
				if (FlxG.keys.SPACE) {
				
				}
			}
			
			
			if (FlxG.getDistance(Global.dasSun, mainSprite).magnitude < 300)
			{
				if(temperature <= maxTemperature)
					temperature += chargeAmount;
			}
			//trace("T: "+temperature);		
		}
		
	}
	

}