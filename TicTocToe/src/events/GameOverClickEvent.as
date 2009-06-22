package events
{
	import flash.events.Event;

	public class GameOverClickEvent extends Event
	{

		public function GameOverClickEvent()
		{
			super(CLICKED, true);
		}

		public static const CLICKED:String = "clicked";


	}
}