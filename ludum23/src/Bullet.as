package  
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2World;
	import org.flixel.FlxB2Sprite;
	import org.flixel.FlxG;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class Bullet extends Agent 
	{
		public var damage:int = 1;
		public var speed:int = 100;
		
		public function Bullet() 
		{
			label = "bullet";
			super(Global.world,-100, -100);
			width = 4;
			height = 4;
			makeGraphic(width, height);
			fill(0xFFFF8040);
			
			b2Type = b2Body.b2_dynamicBody;
			b2Density = 5;
			b2Filter.groupIndex = -1;
			createCircle();
			
			body.SetBullet(true);
			body.SetFixedRotation(true);
			exists = false;
			body.SetActive(false);
			body.SetUserData(this);
		}
		public function fire(bx:int, by:int, v:b2Vec2):void
		{
			
			body.SetPosition(new b2Vec2(bx / FlxG.B2SCALE, by / FlxG.B2SCALE));
			body.SetActive(true);
			body.SetLinearVelocity(v);
			exists = true;
			//trace("fired from "+ this.x + " " + this.y);
		}
		override public function update():void
		{
			super.update();
			//	Bullet off the top of the screen?
			if (exists)
			{
				//this.x += speed;
				if (this.x > (FlxG.width + 5) || this.y > (FlxG.height + 20) || this.y < -(this.height)) {
					//trace("died");
					exists = false;
					body.SetActive(false);
				}
			}
		}
		
		public function hitEnemy():void 
		{
			body.SetPosition(new b2Vec2( -100 / FlxG.B2SCALE, -100 / FlxG.B2SCALE));
			exists = false;
			body.SetActive(false);
		}
	}

}