package  
{
	import Box2D.Common.Math.b2Vec2;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class Chunk extends FlxGroup 
	{
		public var sun:Planet;
		public var planets:Vector.<Planet>;
		public var origin:FlxPoint;
		private var index:int = 0;
		
		
		public function Chunk(topLeft:FlxPoint) 
		{
			origin = new FlxPoint();
			trace(origin.x + " " + origin.y);
			topLeft.copyTo(origin);
			planets = new Vector.<Planet>();
		}
		
		public function createObject(point:FlxPoint, rad:int, clr:uint):void
		{
			var nP:Planet;
			var sD:DarkMask;
			if (clr == 0xffd800) {
				nP = new Planet(Global.world, origin.x + point.x, origin.y + point.y, rad * 3, Global.SUNIMG);
				nP.color = clr;
				sun = nP;
				Global.dasSun = sun;
				add(nP);
			}
			else if (clr == 0x7f3300)
			{
				nP = new Planet(Global.world, origin.x + point.x, origin.y + point.y, rad * 3, Global.MARSIMG);
				planets.push(nP);
				nP.label = "Mars";
				nP.color = clr;
				add(nP);
				sD = new DarkMask(0, 0, planets[index]);
				add(sD);
				index++;
			}
			else if ( clr == 0x808080)
			{
				nP = new Planet(Global.world, origin.x + point.x, origin.y + point.y, rad * 3, Global.MERCIMG);
				nP.color = clr;
				planets.push(nP);
				add(nP);
				sD = new DarkMask(0, 0, planets[index]);
				add(sD);
				index++;
			}
			else if ( clr == 0x0026ff)
			{
				nP = new Planet(Global.world, origin.x + point.x, origin.y + point.y, rad * 3, Global.EARTHIMG);
				//nP.color = clr;
				planets.push(nP);
				add(nP);
				sD = new DarkMask(0, 0, planets[index]);
				add(sD);
				index++;
			}
		}
		override public function update():void 
		{
			super.update();
		}
	}

}