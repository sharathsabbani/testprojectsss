package
{

	public class Anagrams
	{

		public function Anagrams()
		{
		}
		private var count:int;
		private var size:int;
		private var charArray:Array;

		public function Start():void
		{
			var input:String = "documentarily";
			size = input.length;
			count = 0;
			charArray = new Array(size);
			for (var j:int = 0; j < size; j++)
			{
				charArray[j] = input.charAt(j);
			}
			doAnagram(size);

		}

		public function doAnagram(newSize:int):void
		{
			var limit:int;
			if (newSize == 1) // if too small, return;
				return;
			// for each position,
			for (var i:int = 0; i < newSize; i++)
			{
				doAnagram(newSize - 1); // anagram remaining
				/* if (newSize == 5) */ // if innermost,
				display();
				rotate(newSize); // rotate word
			}
		}

		public function display():void
		{
			var str:String = '';
			trace(++count + " ");
			for (var i:int = 0; i < size; i++)
				str += charArray[i];
			if (str == "unmaledictory")
			{
				trace("Done " + str);
				return;
			}
			trace(str);

		}

		public function rotate(newSize:int):void
		{
			var i:int;
			var position:int = size - newSize;
			// save first letter
			var temp:String = charArray[position];
			//shift others left
			for (i = position + 1; i < size; i++)
				charArray[i - 1] = charArray[i];
			//put first on right
			charArray[i - 1] = temp;
		}

	}
}