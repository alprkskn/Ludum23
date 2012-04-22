package  
{
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	import mx.core.BitmapAsset;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class Vignette extends FlxSprite 
	{

		public function Vignette(w:int, h:int, mask:Class = null)
		{
			super(0, 0);
			if (mask) {
				var scaleX:Number = w / (new mask() as BitmapAsset).bitmapData.width;
				var scaleY:Number = h / (new mask() as BitmapAsset).bitmapData.height;
				var spr:BitmapData;
				var matrix:Matrix = new Matrix();
				matrix.scale(scaleX, scaleY);
			
				spr = new BitmapData(w, h,true, 0);
				spr.draw((new mask() as BitmapAsset).bitmapData, matrix);
				makeGraphic(w, h);
				pixels = spr;
			}
			scrollFactor = new FlxPoint(0, 0);
			this.blend = "multiply";	
		}
		
		override public function draw():void 
		{
			//this.pixels.copyPixels(origPixels, new Rectangle(0,0,width,height), _flashPoint);
			super.draw();
		}
		
	}

}