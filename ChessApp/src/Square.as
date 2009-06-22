package
{
	import mx.containers.Box;
	import mx.controls.Image;

	public class Square extends Box
	{

		public var chesspiece:Image = null;

		public function Square()
		{
			chesspiece = new Image();
			chesspiece.width = 32;
			chesspiece.height = 32;
			this.setStyle("horizontalAlign", "center");
			this.setStyle("verticalAlign", "middle");
			addChild(chesspiece);

		}

	}
}