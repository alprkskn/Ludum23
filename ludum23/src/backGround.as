package  
{
	import flash.display.BitmapData;
	import mx.core.BitmapAsset;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class backGround extends FlxGroup 
	{
		[Embed(source = "graphics/skeleBack.jpg")] private const BACKGROUND:Class;
		
		private var bgLeft:FlxSprite;
		private var bgCurr:FlxSprite;
		private var bgRight:FlxSprite;
		
		private var w:uint;
		private var h:uint;
		
		private const BSPEED:uint = 10;
		
		public function backGround() 
		{
			super(3);
			w = (new BACKGROUND() as BitmapAsset).width;
			h = (new BACKGROUND() as BitmapAsset).height;
			bgLeft = new FlxSprite( -(w), 0, BACKGROUND);
			bgCurr = new FlxSprite( 0, 0, BACKGROUND);
			bgRight = new FlxSprite(w, 0, BACKGROUND);
			
			add(bgLeft);
			add(bgCurr);
			add(bgRight);
		}
		
		override public function update():void 
		{
			super.update();
			bgLeft.x -= BSPEED;
			bgCurr.x -= BSPEED;
			bgRight.x -= BSPEED;
			if (bgLeft.x < -380)
			{
				var temp:FlxSprite = bgLeft;
				bgLeft = bgCurr;
				bgCurr = bgRight;
				bgRight = temp;
				bgRight.x = bgCurr.x + 380;
			}
		}
		
	}

}