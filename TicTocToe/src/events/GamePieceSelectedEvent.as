package events
{
	import flash.events.Event;

	public class GamePieceSelectedEvent extends Event
	{
		public var pieceId:int;

		public function GamePieceSelectedEvent(pieceId:int)
		{
			super(SELECTED, true);
			this.pieceId = pieceId;
		}
		public static const SELECTED:String = "selected";

	}
}