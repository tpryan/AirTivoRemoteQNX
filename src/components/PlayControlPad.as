package components
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.events.Event;
	import qnx.ui.buttons.LabelButton;
	
	[Event(name="reverse", type="flash.events.Event")]
	[Event(name="replay", type="flash.events.Event")]
	[Event(name="pause", type="flash.events.Event")]
	[Event(name="slow", type="flash.events.Event")]
	[Event(name="forward", type="flash.events.Event")]
	
	public class PlayControlPad extends BasePad
	{
		public function PlayControlPad()
		{
			super();
			
			var BUTTON_WIDTH:int = 50;
			var BUTTON_HEIGHT:int = 50;
			
			var COL1X:int = 10;
			var COL2X:int = 70;
			var COL3X:int = 130;
			
			var ROW1Y:int = 10;
			var ROW2Y:int = 70;
			var ROW3Y:int = 130;
			
			
			//replay
			var replay:LabelButton = getButton("<|", 2, 1);
			replay.addEventListener(MouseEvent.CLICK, replay_clicked);
			addChild(replay);
			
			
			//reverse
			var reverse:LabelButton = getButton("<<", 1, 2);
			reverse.addEventListener(MouseEvent.CLICK, reverse_clicked);
			addChild(reverse);
			
			//pause
			var pause:LabelButton = getButton("||", 2, 2);
			pause.width = pause.width + 20;
			pause.height = pause.height + 20;
			pause.x = pause.x -10;
			pause.y = pause.y - 10;
			pause.addEventListener(MouseEvent.CLICK, pause_clicked);
			addChild(pause);
			
			//forward
			var forward:LabelButton = getButton(">>", 3, 2);
			forward.addEventListener(MouseEvent.CLICK, forward_clicked);
			addChild(forward);
			
			
			//slow
			var slow:LabelButton = getButton("|>", 2, 3);
			slow.addEventListener(MouseEvent.CLICK, slow_clicked);
			addChild(slow);
			
			
			
			
		}
		
		private function reverse_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("reverse")); 
		}
		
		private function pause_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("pause")); 
		}
		
		private function forward_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("forward")); 
		}
		
		private function slow_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("slow")); 
		}
		
		private function replay_clicked(e:MouseEvent):void{
			dispatchEvent(new Event("replay")); 
		}
		
	}
}