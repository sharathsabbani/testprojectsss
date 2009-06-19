package com.wb.model
{
	[Bindable]
	public class ModelLocator
	{
		public function ModelLocator()
		{
		}
		private static var model:ModelLocator;
		public static function getInstance():ModelLocator
		{
			if(model == null)
				model = new ModelLocator();
				
			return model;
		}
		
		public var pixelColor:uint = 1;
		public var pixelThickness:uint = 1;
	}
}