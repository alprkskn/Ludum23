package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import org.flixel.FlxGame;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class Main extends FlxGame
	{
		
		public function Main():void
		{
			trace("eben");
			super(640, 480, MainState, 1);
		}
		
	}
	
}