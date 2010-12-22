package components
{
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	import qnx.ui.buttons.LabelButton;
	import qnx.ui.text.Label;
	
	[Event(name="upClick", type="flash.events.Event")]
	[Event(name="downClick", type="flash.events.Event")]
	
	public class ThumbsPad extends BasePad
	{
		public function ThumbsPad()
		{
			
			super();
			
			
			var labelFormat:TextFormat = new TextFormat();
			labelFormat.italic = true;  
			labelFormat.align = "center";
			labelFormat.font = "DejaVu Sans";
			
			
			
			
			//up
			var up:LabelButton = getButton("↑", 1, 1);
			up.addEventListener(MouseEvent.CLICK, up_clicked);
			addChild(up);
			
			//down
			var down:LabelButton = getButton("↓", 1, 2);
			down.addEventListener(MouseEvent.CLICK, down_clicked);
			addChild(down);
			
			//label
			var label:Label = new Label();
			label.text = "Thumbs";
			label.y = down.y + down.height + 10;
			label.width = 70;
			label.format = labelFormat;
			addChild(label);
			
			
		}
		
		private function up_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("upClick")); 
		}
		
		private function down_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("downClick")); 
		}
	
	}
	
	
}