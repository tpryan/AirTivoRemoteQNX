package components
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	import qnx.ui.buttons.IconButton;
	import qnx.ui.buttons.LabelButton;
	import qnx.ui.skins.SkinStates;
	
	
	[Event(name="upClick", type="flash.events.Event")]
	[Event(name="downClick", type="flash.events.Event")]
	[Event(name="leftClick", type="flash.events.Event")]
	[Event(name="rightClick", type="flash.events.Event")]
	[Event(name="selectClick", type="flash.events.Event")]
	
	public class ArrowPad extends BasePad
	{
		public function ArrowPad()
		{
			super();
			
			
			
			//up
			var up:IconButton = getIconButton("/assets/controls/a_up_s1.png", 2, 1);
			up.addEventListener(MouseEvent.CLICK, up_clicked);
			addChild(up);
			
			//left
			var left:IconButton = getIconButton("/assets/controls/a_left_s1.png", 1, 2);
			left.addEventListener(MouseEvent.CLICK, left_clicked);
			addChild(left);
			
			//right
			var right:IconButton = getIconButton("/assets/controls/a_right_s1.png", 3, 2);
			right.addEventListener(MouseEvent.CLICK, right_clicked);
			addChild(right);
			
			//down
			var down:IconButton = getIconButton("/assets/controls/a_down_s1.png", 2, 3);
			down.addEventListener(MouseEvent.CLICK, down_clicked);
			addChild(down);
			
			//select
			var selectFormat:TextFormat = new TextFormat();
			selectFormat.font = "DejaVu Sans";
			selectFormat.size = 14;
			
			var select:LabelButton = getLabelButton("Select", 2, 2);
			select.setTextFormatForState(selectFormat,SkinStates.DISABLED);
			select.setTextFormatForState(selectFormat,SkinStates.UP); 
			select.setTextFormatForState(selectFormat,SkinStates.DOWN);
			select.setTextFormatForState(selectFormat,SkinStates.SELECTED);
			select.setTextFormatForState(selectFormat,SkinStates.DISABLED_SELECTED);
			select.addEventListener(MouseEvent.CLICK, select_clicked);
			addChild(select);
			
			
			
		}
		
		private function up_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("upClick")); 
		}
		
		private function down_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("downClick")); 
		}
		
		private function left_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("leftClick")); 
		}
		
		private function right_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("rightClick")); 
		}
		
		private function select_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("selectClick")); 
		}
		
	}
}