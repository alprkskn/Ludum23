package  
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import mx.core.BitmapAsset;
	import org.flixel.FlxG;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class DarkMask extends FlxSprite 
	{
		private var origPixels:BitmapData;

		public function DarkMask(mask:Class = null)
		{
			super(0, 0);
			if (mask) {
				loadGraphic(mask);
				origPixels = (new mask() as BitmapAsset).bitmapData;
			}
			else {
				makeGraphic(FlxG.width,FlxG.height);
				fill(0xFF000000);
				origPixels = pixels;
				//trace("DarkMasked! x: "+x+" y: "+y+" width: "+width+" height: "+height);
			}
			this.blend = "multiply";	
		}
		
		override public function draw():void 
		{
			this.pixels.copyPixels(origPixels, new Rectangle(0,0,width,height), _flashPoint);
			super.draw();
		}
		
	}

}