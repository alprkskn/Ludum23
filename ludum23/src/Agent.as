package  
{
	import Box2D.Dynamics.b2World;
	import org.flixel.FlxB2Sprite;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class Agent extends FlxB2Sprite 
	{
		public var label:String;
		
		public function Agent(world:b2World, x:int, y:int) 
		{
			super(world, x, y);
		}
		
	}

}