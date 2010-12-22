package components
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	import qnx.ui.buttons.LabelButton;
	import qnx.ui.buttons.IconButton;
	import qnx.ui.text.Label;
	
	import skins.ThumbsDownButtonSkin;
	import skins.ThumbsUpButtonSkin;
	
	[Event(name="upClick", type="flash.events.Event")]
	[Event(name="downClick", type="flash.events.Event")]
	
	public class ThumbsPad extends BasePad
	{
		public function ThumbsPad()
		{
			
			super();
			
			
			
			
			//up
			var up:IconButton = getIconButton("/assets/controls/thumbsup_s1.png", 1, 1);
			up.setSkin(ThumbsDownButtonSkin);
			up.addEventListener(MouseEvent.CLICK, up_clicked);
			addChild(up);
			
			//down
			var down:IconButton = getIconButton("/assets/controls/thumbsdown_s1.png", 1, 2);
			down.setSkin(ThumbsUpButtonSkin);
			down.addEventListener(MouseEvent.CLICK, down_clicked);
			addChild(down);
			
			
		}
		
		private function up_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("upClick")); 
		}
		
		private function down_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("downClick")); 
		}
	
	}
	
	
}