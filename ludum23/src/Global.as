package  
{
	import Box2D.Dynamics.b2World;
	import flash.display.BitmapData;
	import mx.core.BitmapAsset;
	import org.flixel.FlxB2State;
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class Global 
	{
		public static var world:b2World;
		public static var player:Player;
		public static var bulletManager:BulletManager;
		public static var enemyManager:EnemyManager;
		public static var worldSize:int;
		public static var dasSun:Planet;
		
		[Embed(source = "graphics/planetShadow.png")] public static const PLSHDW:Class;
		[Embed(source = "graphics/globe.png")] public static const GLOBEIMG:Class;
		[Embed(source = "graphics/TheSun.png")] public static const SUNIMG:Class;
		[Embed(source = "graphics/Mars.png")] public static const MARSIMG:Class;
		[Embed(source = "graphics/Earth.png")] public static const EARTHIMG:Class;
		[Embed(source = "graphics/Mercury.png")] public static const MERCIMG:Class;
		
		/* Chunk Generation */
		[Embed(source = "chunks/00-00.png")] public static const CNK_00_00:Class;
		
		/********************/
		
		public function Global() 
		{
		}
		
	}

}