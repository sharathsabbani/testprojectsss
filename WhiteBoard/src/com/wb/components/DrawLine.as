package com.wb.components
{
	import com.wb.model.ModelLocator;
	
	public class DrawLine extends BaseComponent
	{
		public function DrawLine()
		{
			super();
		}
		
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void 
		{
			graphics.clear();
			graphics.lineStyle(ModelLocator.getInstance().pixelThickness, ModelLocator.getInstance().pixelColor, 1);
			graphics.moveTo(x1,y1);
			graphics.lineTo(x2,y2);
		}
	}
}