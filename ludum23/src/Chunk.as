package  
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class Chunk extends FlxGroup 
	{
		private var sun:Planet;
		private var planets:Vector.<Planet>;
		private var origin:FlxPoint;
		
		public function Chunk(topLeft:FlxPoint) 
		{
			origin = new FlxPoint();
			trace(origin.x + " " + origin.y);
			topLeft.copyTo(origin);
			planets = new Vector.<Planet>();
		}
		
		public function createObject(point:FlxPoint, rad:int, clr:uint):void
		{
			var nP:Planet = new Planet(Global.world, origin.x + point.x, origin.y + point.y, rad * 3);
			nP.color = clr;
			planets.push(nP);
			add(nP);
		}
	}

}