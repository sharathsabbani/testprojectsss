package com.wb.components
{
	import com.wb.model.ModelLocator;
	
	public class DrawCircle extends BaseComponent
	{
		public function DrawCircle()
		{
			super();
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void 
		{
			var cirWidth:Number = x2-x1;
			var cirHeight:Number = y2-y1; 
			var r:Number = Math.sqrt((cirWidth * cirWidth) + (cirHeight * cirHeight));
			graphics.clear();
			graphics.lineStyle(ModelLocator.getInstance().pixelThickness, ModelLocator.getInstance().pixelColor, 1);
			graphics.drawCircle(x1,y1,r);
			graphics.endFill();
		}
	}
}