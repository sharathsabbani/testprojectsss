package com
{
	import flash.display.Sprite;
	
	import mx.core.UIComponent;

	public class TicktokTieCmpt extends UIComponent
	{
		public function TicktokTieCmpt(cmptColor: uint, playerName: String){
			super();
			_cmptColor = cmptColor;
			this.playerName = playerName;
		}
		
		public var playerName: String;
		private var _cmptColor: uint;
		private var _cmptX: Number = 30;
		private var _cmptY: Number = 25;
		private var symbolCmpt: Sprite;
		
		override protected function createChildren(): void{
			symbolCmpt = new Sprite();
			addChild(symbolCmpt);
		}
		override protected function updateDisplayList(unscaledWidth:Number, unscaledHeight:Number):void{
			symbolCmpt.graphics.clear();
			symbolCmpt.graphics.beginFill(_cmptColor);
			symbolCmpt.graphics.drawCircle(_cmptX,_cmptY,20)
			symbolCmpt.graphics.endFill();
		}
		
		public function set cmptX(value: Number): void{
			_cmptX = value;
		}
		public function set cmptY(value: Number): void{
			_cmptY = value;
			validateDisplayList();
		}
	}
}