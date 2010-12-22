package components
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import qnx.ui.buttons.LabelButton;
	
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
			var up:LabelButton = getButton("↑", 2, 1);
			up.addEventListener(MouseEvent.CLICK, up_clicked);
			addChild(up);
			
			//left
			var left:LabelButton = getButton("←", 1, 2);
			left.addEventListener(MouseEvent.CLICK, left_clicked);
			addChild(left);
			
			//right
			var right:LabelButton = getButton("→", 3, 2);
			right.addEventListener(MouseEvent.CLICK, right_clicked);
			addChild(right);
			
			//down
			var down:LabelButton = getButton("↓", 2, 3);
			down.addEventListener(MouseEvent.CLICK, down_clicked);
			addChild(down);
			
			//select
			var select:LabelButton = getButton("Select", 2, 2);
			select.width = select.width + 20;
			select.height = select.height + 20;
			select.x = select.x -10;
			select.y = select.y - 10;
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