package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;

	import mx.containers.Canvas;
	import mx.controls.Alert;

	public class Jigsawpuzzle extends Canvas
	{
		private var url:String = "jigsaw.png";
		private var imageRawContent:BitmapData;
		private var solArray:Array = new Array(9, 11, 2, 15, 0, 6, 14, 7, 3, 5, 8, 13, 4, 10, 1, 12);
		private var cloneArray:Array = [];
		private var puzzleArray:Array = [];
		private var tilesArray:Array = [];

		public function Jigsawpuzzle()
		{
			super();
			loadImage();
		}

		private function loadImage():void
		{
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, completeHandler);
			loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioErrorHandler);
			var request:URLRequest = new URLRequest(url);
			loader.load(request);
		}



		private function completeHandler(event:Event):void
		{
			imageRawContent = event.target.content.bitmapData;
			if (imageRawContent)
			{
				//gets the image tiles and arranges the image tiles according to the solution array
				swapArray(getTiles());
			}
		}

		private function ioErrorHandler(event:IOErrorEvent):void
		{
			Alert.show("Unable to load image: " + url);
			trace("Unable to load image: " + url);
		}

		//Copies all the image tiles returns array
		private function getTiles():Array
		{
			var tilewidth:int = Math.ceil(imageRawContent.width / 4);
			var tileheight:int = Math.ceil(imageRawContent.height / 4);
			for (var i:int = 0; i < 4; i++)
			{

				for (var j:int = 0; j < 4; j++)
				{
					var imagePiece:Bitmap = new Bitmap();
					imagePiece.bitmapData = new BitmapData(tilewidth, tileheight);
					imagePiece.bitmapData.copyPixels(imageRawContent,
						new Rectangle(i * tilewidth, j * tileheight,
						tilewidth, tileheight),
						new Point(0, 0));
					tilesArray.push(imagePiece);
				}
			}
			return tilesArray;
		}

		private function swapArray(tiles:Array):void
		{

			for (var i:int = 0; i < solArray.length; i++)
			{
				cloneArray.push(tilesArray[solArray[i]]);
			}
			//Takes the swaparray cloned data and created twodimensional array of tiles.
			getSwapArrayData();
		}

		private function displyPuzzle():void
		{
			for (var i:int = 0; i < 4; i++)
			{
				for (var j:int = 0; j < 4; j++)
				{
					var puzImageHolder:MovieClip = new MovieClip();
					var image:Bitmap = puzzleArray[i][j];
					image.width = 32;
					image.height = 32;
					puzImageHolder.addChild(image);
					image.x = -(32 / 2);
					image.y = -(32 / 2);
					puzImageHolder.x = j * 32 + 32 / 2;
					puzImageHolder.y = i * 32 + 32 / 2;
					this.rawChildren.addChild(puzImageHolder);
				}
			}
		}

		private function getSwapArrayData():void
		{
			var first:int = 0;
			var second:int = 4;
			for (var index:int = 0; index < 4; index++)
			{
				puzzleArray[index] = new Array();
				var ind:int = 0;
				for (var j:int = first; j < second; j++)
				{
					puzzleArray[index][ind] = cloneArray[j];
					ind++;
				}
				first = second;
				second += 4;
			}
			//creates a movie clip adds the tile  to the movie clip
			displyPuzzle();
		}

	}
}