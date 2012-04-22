package  
{
	import Box2D.Common.Math.b2Vec2;
	import Box2D.Dynamics.b2Body;
	import Box2D.Dynamics.b2ContactListener;
	import Box2D.Dynamics.b2World;
	import flash.display.BitmapData;
	import mx.core.BitmapAsset;
	import org.flixel.FlxB2Sprite;
	import org.flixel.FlxB2State;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxPoint;
	import org.flixel.FlxRect;
	import org.flixel.FlxSprite;

	/**
	 * ...
	 * @author Alper Keskin
	 */
	public class MainState extends FlxB2State 
	{
		
		private const COUNT:uint = 1; //This count squared will decide the number of chunks in the universe. In a second thought, i'll stick with 1. :)
		private const CHUNKSIZE:uint = 2048;
		private const BMPSIZE:uint = 96;
		
		
		private var chunkData:Vector.<BitmapData>;
		private var chunks:Vector.<Chunk>;
		
		private var agent:Player;
		private var testPlanet:Planet;
		
		private var enemies:EnemyManager;
		private var playaContacts:b2ContactListener;
		private var bG:backGround;
		private var dS:Vignette;
		
		private var frame:Vector.<FlxB2Sprite>;

		override public function create():void 
		{
			super.create();
			
			Global.chunkCnt = COUNT;
			Global.chunkSize = CHUNKSIZE;
			Global.worldSize =  CHUNKSIZE * COUNT;
			
			//Set the background
			FlxG.bgColor = 0xFFEBE0E0;
			//add(new backGround());
			
			
			
			
			//Populate the world
			world = new b2World(new b2Vec2(0, 0), true);
			Global.world = world;
			
			agent = new Player(world, 50, 100);
			Global.player = agent;

			//testPlanet = new Planet(world, 200, -30, 320);
			bG = new backGround();
			add(bG);
			createChunks();
			
			/*enemies = new EnemyManager();
			Global.enemyManager = enemies;*/
			
			add(agent);
			for (var x:int = 0; x < COUNT; x++) {
				add(chunks[x]);
			}
			//add(enemies);
			
			// DarkFilter
			dS = new Vignette(FlxG.width, FlxG.height, Global.VGN);
			//dS = new DarkMask();
			//dS.scrollFactor = new FlxPoint();
			add(dS);
			// Start the enemy timer
			FlxG.camera.follow(agent.mainSprite);
			FlxG.camera.bounds = new FlxRect(0, 0, CHUNKSIZE * COUNT, CHUNKSIZE * COUNT);
			addContactListener();
		}
		
		
		public function addContactListener():void
		{
			playaContacts = new ContactListener();
			world.SetContactListener(playaContacts);
		}

		public function createChunks():void {
			chunkData = new Vector.<BitmapData>();
			chunks = new Vector.<Chunk>();
			
			chunkData.push((new Global.CNK_00_00() as BitmapAsset).bitmapData);
			//chunkData.push((new Global.CNK_00_01() as BitmapAsset).bitmapData);
			
			
			
			var scale:Number = CHUNKSIZE / BMPSIZE;
			
			for (var x:int = 0; x < COUNT; x++)
				for (var y:int = 0; y < COUNT; y++)
				{
					var topLeft:FlxPoint = new FlxPoint(x * CHUNKSIZE, y * CHUNKSIZE);
					var index:uint = x * COUNT + y;
					var cnk:Chunk = new Chunk(topLeft);
					
					chunks.push(cnk);
					if (x*COUNT + y >= chunkData.length)
						continue;
					var bmp:BitmapData = chunkData[index];
					var c:int = 0;
					for (var j:int = 5; j < bmp.width; j++)
						for (var i:int = 5; i < bmp.height; i++)
						{
							if (bmp.getPixel(i, j) == 0xffffff && 
								bmp.getPixel(i - 1, j) != 0xffffff && 
								bmp.getPixel(i + 1, j) != 0xffffff && 
								bmp.getPixel(i, j - 1) != 0xffffff && 
								bmp.getPixel(i, j + 1) != 0xffffff)
							{
								var rad:uint = 1;
								while (bmp.getPixel(i + rad, j) != 0xffffff)
									rad++;
								cnk.createObject(new FlxPoint(i * scale, j * scale) , rad * scale, bmp.getPixel(i, j + 1));
								//trace("added planet");
							}
						}
				}
		}
		
		override public function update():void 
		{
			super.update();
			//trace(dist);
		}
		
	}

}