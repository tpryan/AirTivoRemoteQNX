package skins
{
	import flash.display.DisplayObject;
	import flash.display.GradientType;
	import flash.display.Sprite;
	import flash.filters.DropShadowFilter;
	import flash.geom.Matrix;
	import flash.geom.Rectangle;
	
	import qnx.ui.skins.SkinStates;
	import qnx.ui.skins.UISkin;
	import qnx.ui.skins.buttons.RoundedButtonSkinBlack;

	
	public class ThumbsDownButtonSkin extends RoundedButtonSkinBlack
	{
		
		protected var downSkin:Sprite;
		
		public function ThumbsDownButtonSkin()
		{
		}
		
		protected function drawSprite(item:Sprite,lineThickness:int,shadow:Boolean=false):void
		{
			
			item.graphics.beginFill(0xcc0000,1);
			item.graphics.lineStyle(lineThickness,0x444444,1);
			item.graphics.drawRoundRect(0,0,80,80,10,10);
			
			var matr:Matrix = new Matrix();
			matr.createGradientBox(70, 70, Math.PI / 2, 0, 0);
			
			item.graphics.beginGradientFill(GradientType.LINEAR,[0xffffff,0xffffff],[.5,0], [0x30,0x99],matr);
			item.graphics.lineStyle(lineThickness,0x444444,1);
			item.graphics.drawRoundRect(0,0,80,80,10,10);
			
		}
		
		protected function drawBrightSprite(item:Sprite,lineThickness:int,shadow:Boolean=false):void
		{
			
			item.graphics.beginFill(0xFF6666,1);
			item.graphics.lineStyle(lineThickness,0x444444,1);
			item.graphics.drawRoundRect(0,0,80,80,10,10);
			
			var matr:Matrix = new Matrix();
			matr.createGradientBox(70, 70, Math.PI / 2, 0, 0);
			
			item.graphics.beginGradientFill(GradientType.LINEAR,[0xffffff,0xffffff],[.5,0], [0x30,0x99],matr);
			item.graphics.lineStyle(lineThickness,0x444444,1);
			item.graphics.drawRoundRect(0,0,80,80,10,10);
			
		}
		
		override protected function initializeStates():void
		{
			/**
			 * UpSkin
			 **/
			upSkin = new Sprite();
			drawSprite(upSkin,2);
			setSkinState(SkinStates.UP, upSkin );
			
			/**
			 * DownSkin
			 **/
			downSkin = new Sprite();
			drawBrightSprite(downSkin,3);
			setSkinState(SkinStates.DOWN, downSkin );
			
			
			/**
			 * selectedSkin
			 **/
			selectedSkin = new Sprite();
			drawSprite(selectedSkin,3);
			setSkinState(SkinStates.SELECTED, selectedSkin );
			
			
			/**
			 * disabledSkin
			 **/
			disabledSkin = new Sprite();
			drawSprite(disabledSkin,3);
			setSkinState(SkinStates.DISABLED, disabledSkin );
			
			
			showSkin( upSkin );
		}
		
	}
}