package  
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.filters.BitmapFilter;
	import flash.filters.BlurFilter;
	import flash.geom.Point;
	import mx.core.BitmapAsset;
	import org.flixel.FlxBasic;
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	import org.flixel.FlxGroup;
	import org.flixel.FlxTween;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class backGround extends FlxGroup 
	{
		//[Embed(source = "graphics/skeleBack.jpg")] private const BACKGROUND:Class;
		
		private var w:uint = Global.worldSize;
		private var h:uint = Global.worldSize;
		
		/* Just Useless Counts*/
		private const st01:uint = 50;
		private const st02:uint = 100;
		private const st03:uint = 150;
		/**********************/
		
		private var bG:FlxSprite;
		private var bGSprite:FlxSprite;
		private var bGBlur:FlxSprite;
		
		[Embed(source = "graphics/star01.png")] private const STAR_01:Class;
		[Embed(source = "graphics/star02.png")] private const STAR_02:Class;
		
		public function backGround() 
		{
			bG = new FlxSprite(0, 0);
			bG.makeGraphic(w, h, 0xffffffff, true);
			bG.fill(0xff111111)

			add(bG);
			//bGBlur.pixels = bGSprite.pixels.clone();
			for (var x:uint = 0; x < st01; x++) {
				
				add(new FlxSprite(w * Math.random(), h * Math.random(), STAR_01));
			}
			
			for (x = 0; x < st02; x++) {
				
				add(new FlxSprite(w * Math.random(), h * Math.random(), STAR_02));
			}
			
		}
		
		override public function update():void 
		{
			super.update();
			if (Math.random() > 0.75)
			{
				var t:FlxBasic = getRandom(1);
				if(t is FlxSprite)
					FlxTween.fromTo((t as FlxSprite), 0.4, { alpha:0 }, { alpha:1 } );
			}
		}
		
	}

}