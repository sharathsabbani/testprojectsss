package com.wb.components
{
	import com.wb.model.ModelLocator;
	
	public class DrawRectangle extends BaseComponent
	{
		public function DrawRectangle()
		{
			super();
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void 
		{
			var rectWidth:Number = x2-x1;
			var rectHeight:Number = y2-y1;  
			graphics.clear();
			graphics.lineStyle(ModelLocator.getInstance().pixelThickness, ModelLocator.getInstance().pixelColor, 1);
			graphics.drawRect(x1,y1,rectWidth,rectHeight);
			graphics.endFill();
		}
	}
}