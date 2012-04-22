package  
{
	import Box2D.Dynamics.b2World;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import mx.core.BitmapAsset;
	import org.flixel.FlxB2Sprite;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class Planet extends FlxB2Sprite
	{
		private var spr:BitmapData;
		
		/*physical things*/
		private var forcePoint:b2Vec2;
		private var verticalForce:b2Vec2;
		private var horizontalForce:b2Vec2;
		private var weight:b2Vec2;
		private const fC:Number = 3;
		private var origPixels:BitmapData;
		
		
		public var label:String;
		/*****************/
		
		public function Planet(world:b2World, x:int, y:int, r:int, img:Class, st:Boolean = false) 
		{
			/* put the main body */
			super(world, x, y);
			height = r;
			width = r;
			
			var scale:Number = r / (new img() as BitmapAsset).bitmapData.width;
			var matrix:Matrix = new Matrix();
			matrix.scale(scale, scale);
			
			spr = new BitmapData(r, r,true, 0);
			spr.draw((new img() as BitmapAsset).bitmapData, matrix);
			
			//pl.scale = new FlxPoint(r / 64, r / 64);
			if(!st)
				b2Type = b2Body.b2_dynamicBody;
			else
				b2Type = b2Body.b2_staticBody;
			createCircle();
			
			/* TODO: play with these to improve game feel*/
			forcePoint = body.GetPosition();
			horizontalForce = new b2Vec2(9.8 * body.GetMass() * fC, 0);
			verticalForce = new b2Vec2(0, 9.8 * body.GetMass() * fC);
			weight = new b2Vec2(0, 9.8 * body.GetMass() * (fC-2));
			body.SetLinearDamping(2);
			body.SetAngularDamping(2);
			/*********************************************/
			
			//body.SetFixedRotation(true);
			body.SetUserData(this);
			origPixels = new BitmapData(spr.width, spr.height);
			origPixels.copyPixels(spr, spr.rect,origPixels.rect.topLeft);
			pixels = spr;
		}
		
		override public function update():void 
		{
			super.update();
		}
		
		public function thrustUp():void {
			body.ApplyForce(verticalForce.GetNegative(), forcePoint);
		}
		
		public function thrustDown():void {
			body.ApplyForce(verticalForce, forcePoint);
		}
		
		public function thrustRight():void {
			body.ApplyForce(horizontalForce, forcePoint);
		}
		
		public function thrustLeft():void {
			body.ApplyForce(horizontalForce.GetNegative(), forcePoint);
		}
		public function push(vec:b2Vec2):void {
			//trace( vec.Length());
			body.ApplyForce(vec, forcePoint);
		}
		
		override public function draw():void 
		{
			this.pixels.copyPixels(origPixels, origPixels.rect, pixels.rect.topLeft);
			//pixels = origPixels.clone();
			super.draw();
		}
	}
	
}