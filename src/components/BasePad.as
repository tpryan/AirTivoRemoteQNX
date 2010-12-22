package components
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextFormat;
	
	import qnx.ui.buttons.Button;
	import qnx.ui.buttons.IconButton;
	import qnx.ui.buttons.LabelButton;
	import qnx.ui.skins.SkinStates;
	
	public class BasePad extends Sprite
	{
		
		private var BUTTON_WIDTH:int = 50;
		private var BUTTON_HEIGHT:int = 50;
		private var COLUMNS:Array = new Array(0,60,120);
		private var ROWS:Array = new Array(0,60,120,180);
		
		public function BasePad()
		{
			super();
		}
		
		protected function getLabelButton(label:String, column:int, row:int ):LabelButton{
			var bbFormat:TextFormat = new TextFormat();
			bbFormat.font = "DejaVu Sans";
			
			var button:LabelButton = new LabelButton();
			button.label = label;
			button.width = BUTTON_WIDTH;
			button.height = BUTTON_HEIGHT;
			
			button.x = COLUMNS[column-1];
			button.y = ROWS[row-1];
			
			button.setTextFormatForState(bbFormat,SkinStates.DISABLED);
			button.setTextFormatForState(bbFormat,SkinStates.UP); 
			button.setTextFormatForState(bbFormat,SkinStates.DOWN);
			button.setTextFormatForState(bbFormat,SkinStates.SELECTED);
			return button;
		}
		
		protected function getIconButton(icon:String, column:int, row:int ):IconButton{
			var bbFormat:TextFormat = new TextFormat();
			bbFormat.font = "DejaVu Sans";
			
			var button:IconButton = new IconButton();
			button.width = BUTTON_WIDTH;
			button.height = BUTTON_HEIGHT;
			button.setIcon(icon);
			
			button.x = COLUMNS[column-1];
			button.y = ROWS[row-1];
			
			return button;
		}
		
	}
}