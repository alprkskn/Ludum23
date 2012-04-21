package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxTimer;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class EnemyManager extends FlxGroup 
	{
		private const MAX_ENEMY_NUMBER:uint = 100;
		private var tmr:FlxTimer;
		private var cnt:Number = 0;
		
		public function EnemyManager() 
		{
			
		}
		
		override public function update():void 
		{
			super.update();
			
		}
		
		public function sendEnemy(t:FlxTimer):void {
			
			
		}
		
		
	}

}