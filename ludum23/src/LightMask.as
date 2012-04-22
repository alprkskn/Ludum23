package
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class LightMask extends FlxSprite
	{
		[Embed(source="graphics/glow-light.png")]
		private const LightImageClass:Class;
		private var darkness:FlxSprite;
		
		public function LightMask(x:Number, y:Number, darkness:FlxSprite):void
		{
			super(x, y, LightImageClass);
			this.scale = new FlxPoint(4, 4);
			this.darkness = darkness;
			this.blend = "screen"
		}
		
		override public function draw():void
		{
			var screenXY:FlxPoint = getScreenXY();
			
			darkness.stamp(this, screenXY.x - this.width / 2, screenXY.y - this.height / 2);
		}
		
	
	}

}