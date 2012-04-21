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
		[Embed(source = "graphics/globe.png")] public static var GLOBEIMG:Class;
		
		
		/* Chunk Generation */
		
		[Embed(source = "chunks/00-00.png")] public static const CNK_00_00:Class;
		
		/********************/
		
		public function Global() 
		{
		}
		
	}

}