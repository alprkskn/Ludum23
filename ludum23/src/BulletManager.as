package  
{
	import Box2D.Common.Math.b2Vec2;
	import org.flixel.FlxGroup;
	
	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class BulletManager extends FlxGroup 
	{
		
		private const MAX_BULLET_NUMBER:uint = 150;
		private var upVec:b2Vec2;
		private var nmVec:b2Vec2;
		private var dwVec:b2Vec2;
		private var cnt:uint = 0;
		
		public function BulletManager() 
		{
			super();

			//	There are 40 bullets in our pool
			for (var i:int = 0; i < MAX_BULLET_NUMBER; i++)
			{
				add(new Bullet());
			}
			upVec = new b2Vec2(30, -10);
			nmVec = new b2Vec2(30, 0);
			dwVec = new b2Vec2(30, 10);
		}
		
		
		public function fire(bx:int, by:int):void
		{
			cnt++;
			if (getFirstAvailable() && cnt > 2)
			{
				cnt = 0;
				//Bullet(getFirstAvailable()).fire(bx, by, upVec);
				Bullet(getFirstAvailable()).fire(bx, by, nmVec);
				//Bullet(getFirstAvailable()).fire(bx, by, dwVec);
			}

		}

	}

}