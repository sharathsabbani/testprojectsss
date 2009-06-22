package
{
	import mx.containers.HBox;
	import mx.containers.VBox;
	import mx.controls.Text;

	public class ChessBoard extends VBox
	{

		public function ChessBoard()
		{
			super();
		}
		public var chesssquare:Square;
		public var row:HBox;
		public var notationArray:Array = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H'];

		protected override function createChildren():void
		{
			super.createChildren();
			for (var i:int = 8; i > 0; i--)
			{
				row = new HBox();
				row.percentWidth = 100;
				row.setStyle("horizontalGap", "0");
				row.setStyle("verticalGap", "0");
				if (i % 2 == 0)
				{
					for each (var obj:Object in notationArray)
					{
						chesssquare = new Square();
						chesssquare.width = 90;
						chesssquare.height = 90;
						chesssquare.id = obj + i;

						if ((obj == "A" || obj == "H") && i == 8)
						{
							chesssquare.chesspiece.source = "assets/images/wrook.gif";
						}
						if ((obj == "B" || obj == "G") && i == 8)
						{
							chesssquare.chesspiece.source = "assets/images/wknight.gif";
						}
						if ((obj == "C" || obj == "F") && i == 8)
						{
							chesssquare.chesspiece.source = "assets/images/wbishop.gif";
						}
						if (obj == "D" && i == 8)
						{
							chesssquare.chesspiece.source = "assets/images/wqueen.gif";
						}
						if (obj == "E" && i == 8)
						{
							chesssquare.chesspiece.source = "assets/images/wking.gif";
						}
						if (i == 2)
						{
							chesssquare.chesspiece.source = "assets/images/bpawn.gif";
						}
						if (obj == "B" || obj == "D" || obj == "F" || obj == "H")
						{

							/* chesssquare.setStyle("backgroundColor", "black");
							   chesssquare.setStyle("borderStyle", "solid");
							 chesssquare.setStyle("borderColor", "black"); */
							chesssquare.styleName = "BlackSquare";
						}
						else
						{
							/* chesssquare.setStyle("backgroundColor", "white");
							   chesssquare.setStyle("borderStyle", "solid");
							 chesssquare.setStyle("borderColor", "white"); */
							chesssquare.styleName = "WhiteSquare";
						}

						row.addChild(chesssquare);
					}

				}
				else
				{
					for each (var bobj:Object in notationArray)
					{
						chesssquare = new Square();
						chesssquare.width = 90;
						chesssquare.height = 90;


						chesssquare.id = bobj + i;
						if ((bobj == "A" || bobj == "H") && i == 1)
						{
							chesssquare.chesspiece.source = "assets/images/brook.gif";
						}
						if ((bobj == "B" || bobj == "G") && i == 1)
						{
							chesssquare.chesspiece.source = "assets/images/bknight.gif";
						}
						if ((bobj == "C" || bobj == "F") && i == 1)
						{
							chesssquare.chesspiece.source = "assets/images/bbishop.gif";
						}
						if (bobj == "D" && i == 1)
						{
							chesssquare.chesspiece.source = "assets/images/bqueen.gif";
						}
						if (bobj == "E" && i == 1)
						{
							chesssquare.chesspiece.source = "assets/images/bking.gif";
						}

						if (bobj == "A" || bobj == "C" || bobj == "E" || bobj == "G")
						{

							/* chesssquare.setStyle("backgroundColor", "black");
							   chesssquare.setStyle("borderStyle", "solid");
							 chesssquare.setStyle("borderColor", "black"); */
							chesssquare.styleName = "BlackSquare";
						}
						else
						{
							/* chesssquare.setStyle("borderStyle", "solid");
							   chesssquare.setStyle("borderColor", "white");
							 chesssquare.setStyle("backgroundColor", "white"); */
							chesssquare.styleName = "WhiteSquare";
						}
						if (i == 7)
						{
							chesssquare.chesspiece.source = "assets/images/wpawn.gif";
						}
						row.addChild(chesssquare);
					}
				}

				addChild(row);
			}
		}

		protected override function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			row.percentWidth = 100;
		}

	}
}