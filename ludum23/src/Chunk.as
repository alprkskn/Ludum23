package  
{
	import Box2D.Common.Math.b2Vec2;
	import org.flixel.FlxG;
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
		public var magnitudeVector:Vector.<Number>;
		public var origin:FlxPoint;
		private var index:int = 0;
		
		
		public function Chunk(topLeft:FlxPoint) 
		{
			origin = new FlxPoint();
			trace(origin.x + " " + origin.y);
			topLeft.copyTo(origin);
			planets = new Vector.<Planet>();
			magnitudeVector = new Vector.<Number>();
		}
		
		public function createObject(point:FlxPoint, rad:int, clr:uint):void
		{
			var nP:Planet;
			var sD:DarkMask;
			if (clr == 0xffd800) {
				nP = new Planet(Global.world, origin.x + point.x, origin.y + point.y, rad-10, Global.SUNIMG, true);
				magnitudeVector.push(.0);
				nP.color = clr;
				sun = nP;
				Global.dasSun = sun;
				planets.push(nP);
				add(nP);
				index++;
				trace("sun's index: " + sun.x + " " + sun.y);
			}
			else if (clr == 0x7f3300)
			{
				nP = new Planet(Global.world, origin.x + point.x, origin.y + point.y, rad, Global.MARSIMG, true);
				planets.push(nP);
				magnitudeVector.push(.025);
				nP.label = "Mars";
				nP.color = clr;
				add(nP);
				sD = new DarkMask(0, 0, planets[index]);
				add(sD);
				index++;
			}
			else if ( clr == 0x808080)
			{
				nP = new Planet(Global.world, origin.x + point.x, origin.y + point.y, rad, Global.MERCIMG, true);
				nP.color = clr;
				planets.push(nP);
				magnitudeVector.push(.025);
				add(nP);
				sD = new DarkMask(0, 0, planets[index]);
				add(sD);
				index++;
			}
			else if ( clr == 0x0026ff)
			{
				nP = new Planet(Global.world, origin.x + point.x, origin.y + point.y, rad, Global.EARTHIMG, true);
				//nP.color = clr;
				planets.push(nP);
				magnitudeVector.push(.025);
				add(nP);
				sD = new DarkMask(0, 0, planets[index]);
				add(sD);
				index++;
			}
		}
		override public function update():void 
		{
			super.update();
			
			/* Force Applied On Das Earth */
			for (var i:int; i < planets.length; i++)
			{
				var treshold:Number = planets[i].height * 2;
				var dist:FlxPoint = FlxG.getDistance(Global.player.mainSprite, planets[i]);
				if ( dist.magnitude < treshold)
				{
					
					var vect:b2Vec2 = dist.toVector();
					var vecSum:Number = Math.abs(dist.x) + Math.abs(dist.y);
					vect.Multiply((1 / vecSum) * planets[i].height / dist.magnitude * 320);
					Global.player.mainSprite.push(vect);
				}
				if (i)
				{
					var distVec:b2Vec2 = FlxG.getDistance(sun, planets[i]).toVector();
					var movement:b2Vec2 = new b2Vec2(distVec.y * (-1), distVec.x);
					var newPos:b2Vec2 = planets[i].body.GetPosition();
					movement.Normalize();
					movement.Multiply(magnitudeVector[i]);
					newPos.Add(movement);
					planets[i].body.SetPosition(newPos);
				}
			}
			/* ************************** */
			
			
		}
	}

}