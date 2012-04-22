package  
{
	import Box2D.Dynamics.b2Body;
	import flash.display.BitmapData;
	import flash.display.BitmapDataChannel;
	import flash.geom.Rectangle;
	import mx.core.BitmapAsset;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxB2Sprite;
	import flash.geom.Matrix;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class DarkMask extends FlxB2Sprite 
	{
		private var spr:BitmapData;
		private var obj:FlxSprite;
		private var a:Number  = 0;
		
		public function DarkMask(x:int, y:int, o:FlxSprite = null)
		{
			super(Global.world, x, y);
			b2IsSensor = true;
			b2Type = b2Body.b2_staticBody;
			createCircle();
			//body.SetFixedRotation(true);
			var scale:Number = o.height / (new Global.PLSHDW() as BitmapAsset).bitmapData.width;
			var matrix:Matrix = new Matrix();
			matrix.scale(scale, scale);
			
			spr = new BitmapData(o.width, o.height, true, 0);
			spr.draw((new Global.PLSHDW() as BitmapAsset).bitmapData, matrix);
			
			obj = o;
			this.blend = "multiply";
			trim(spr);
			pixels = spr;
		}
		
		override public function draw():void 
		{
			
			obj.stamp(this, 0, 0);
			//super.draw();
		}
		public function trim(bmp:BitmapData):void
		{
			for (var x:int = 0; x < bmp.width; x++)
				for (var y:int = 0; y < bmp.height; y++)
				{
					if (!(obj.pixels.getPixel32(x, y) >> 24))
					{
						bmp.setPixel32(x, y, 0x00000000);
					}
				}
		}
		override public function update():void 
		{
			super.update();
			var dist:FlxPoint = FlxG.getDistance(Global.dasSun, (obj as Planet));
			alpha = (dist.magnitude - 200) / 250;
			var angle:Number = Math.atan2(dist.y, dist.x);
			angle -= (obj as Planet).body.GetAngle();
			body.SetAngle(angle);
		}
		
	}

}