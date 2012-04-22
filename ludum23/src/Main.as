package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flixel.FlxG;
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class Main extends FlxGame
	{
		
		public function Main():void
		{
			//super(320, 240, MainState, 2);
			super(640, 480, MainState, 1);
			FlxG.debug = true;
		}
		
	}
	
}