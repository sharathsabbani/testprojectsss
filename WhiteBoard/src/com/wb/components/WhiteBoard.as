package com.wb.components
{
	import com.wb.model.ModelLocator;
	
	import flash.display.Graphics;
	import flash.display.Shape;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import mx.containers.Canvas;

	[Bindable]
	public class WhiteBoard extends Canvas
	{
		
		public function WhiteBoard():void 
		{
			super();
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			setStyle("backgroundAlpha",0);
			setStyle("backgroundColor","red");
		}

		private var backGround:Shape;
		private var myComp:BaseComponent = new BaseComponent();
		public var selectedComponent:Class;
		public var lineWidth:Number = 1;
		public var lineAlpha:Number = 1;
				
		protected function dragStart(event:MouseEvent):void
	    {
	    	drawGraph(event);
	        systemManager.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove, true);
	        systemManager.addEventListener(MouseEvent.MOUSE_UP, onMouseUp, true);
	        systemManager.stage.addEventListener(Event.MOUSE_LEAVE, onMouseLeave);
	    }
	    
	    protected function dragStop():void
	    {
	        systemManager.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove, true);
	        systemManager.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp, true);
	        systemManager.stage.removeEventListener(Event.MOUSE_LEAVE, onMouseLeave);
	    }
	    
	    public function onMouseDown(event:MouseEvent):void{
	    	if(selectedComponent.toString().indexOf('DummyClass')!=-1)
	    	{
	    		addEventListener(MouseEvent.MOUSE_MOVE, moveEvent);
	    		addEventListener(MouseEvent.MOUSE_UP, upEvent);
				addEventListener(MouseEvent.MOUSE_OUT, upEvent);
				newLine();
				drawGraph(event);
	    	}
	    	else
				dragStart(event);
			
		}
		
	    private function onMouseMove(event:MouseEvent):void
	    {
	    	if(selectedComponent.toString().indexOf('DummyClass')==-1)
	    	{
	    		var newPoint:Point = new Point(event.stageX,event.stageY);
		    	newPoint = globalToLocal(newPoint);
		    	myComp.x2 = newPoint.x;
		    	myComp.y2 = newPoint.y;
		    	myComp.invalidateDisplayList(); 
	    	}
	    }
	    
	    private function onMouseUp(event:MouseEvent):void
	    {
	    	if(selectedComponent.toString().indexOf('DummyClass')==-1)
	    	{
	    		dragStop();
	    	}
	    }
	    
	    private function onMouseLeave(event:MouseEvent):void
	    {
	    	if(selectedComponent.toString().indexOf('DummyClass')==-1)
	    	{
	    		dragStop();
	    	}
	    }
	    
	    override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void 
		{
			super.updateDisplayList(unscaledWidth, unscaledHeight);
			if(selectedComponent && selectedComponent.toString().indexOf('DummyClass')!=-1)
			{
					drawLines(graphics, lineWidth, lineAlpha);
			}
			if(isNaN(unscaledWidth) || isNaN(unscaledHeight)) 
			{
				return;
			}
		}
		
		private function drawGraph(event:MouseEvent):void
		{
			 trace(selectedComponent.toString());
			if(selectedComponent.toString().indexOf('DummyClass')==-1)
			{
				var newClass:BaseComponent = new selectedComponent(); 
				newClass.x1 = event.localX;
		    	newClass.y1 = event.localY;
		    	newClass.x2 = event.localX;
		    	newClass.y2 = event.localY;
		    	newClass.invalidateDisplayList();
				myComp = newClass;
		    	addChild(myComp);
			}			
		}
		
		private var lines:Array = new Array();
		private var _curentLine:Array;
		public function newLine():void
		{
			_curentLine = new Array();
			lines.push( _curentLine );
			
			if( lines.length > 10 )
				lines.shift();
		}
		
		public function addPoint(xIN:int, yIN:int):void
		{
			_curentLine.push( { x:xIN, y:yIN } );
			this.invalidateDisplayList();
		}
		
		
		public function drawLines( graphics:Graphics, lw:Number, la:Number ):void
		{
			graphics.clear();
			graphics.lineStyle(ModelLocator.getInstance().pixelThickness,ModelLocator.getInstance().pixelColor,la);
			
			for( var j:int = 0; j<lines.length; j++ )
			{
				var line:Array = lines[j];
				
				for( var i:int = 0; i<line.length; i++ )
				{
					var p:Object = line[i];
					if( i == 0 )
					{
						graphics.moveTo( p.x, p.y );
					}	
					else
					{
						graphics.lineTo( p.x, p.y );
					}	
				}
			}
		}
		
		private function moveEvent(event:MouseEvent):void
		{
			addPoint( event.localX, event.localY );				
		}
		
		private function downEvent(event:MouseEvent):void
		{
			addEventListener(MouseEvent.MOUSE_MOVE, moveEvent);
			newLine();
		}
		
		private function upEvent(event:MouseEvent):void
		{
			removeEventListener(MouseEvent.MOUSE_MOVE, moveEvent);
	    	removeEventListener(MouseEvent.MOUSE_UP, upEvent);
			removeEventListener(MouseEvent.MOUSE_OUT, upEvent);
		}
	}
}