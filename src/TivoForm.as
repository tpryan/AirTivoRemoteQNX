package
{
	import flash.display.Sprite;
	import flash.text.TextFormat;
	
	import qnx.ui.buttons.LabelButton;
	import qnx.ui.text.Label;
	import qnx.ui.text.TextInput;
	
	import qnx.ui.skins.SkinStates;
	
	public class TivoForm extends Sprite
	{
		
		public var nameInput:TextInput = new TextInput();
		public var hostnameInput:TextInput = new TextInput();
		
		private const YDIST:int = 30;
		
		public function TivoForm()
		{
			super();
			
			var bbFormat:TextFormat = new TextFormat();
			bbFormat.font = "DejaVu Sans";
			
			var bbInputFormat:TextFormat = new TextFormat();
			bbInputFormat.font = "DejaVu Sans";
			
			var nameLabel:Label = new Label();
			nameLabel.text = "Name:";
			nameLabel.format = bbFormat;
			addChild(nameLabel);
			
			nameInput.y = nameLabel.y + nameLabel.height;
			nameInput.format = bbInputFormat;
			addChild(nameInput);
			
			var hostNameLabel:Label = new Label();
			hostNameLabel.text = "Hostname:";
			hostNameLabel.format = bbFormat;
			hostNameLabel.y = nameInput.y + nameInput.height + 10;
			addChild(hostNameLabel);
			
			hostnameInput.y = hostNameLabel.y + hostNameLabel.height;
			hostnameInput.format = bbInputFormat;
			addChild(hostnameInput);
			
			var saveButton:LabelButton = new LabelButton();
			saveButton.y = hostnameInput.y + hostnameInput.height + 10;
			saveButton.label = "Save";
			saveButton.setTextFormatForState(bbFormat,SkinStates.DISABLED);
			saveButton.setTextFormatForState(bbFormat,SkinStates.UP); 
			saveButton.setTextFormatForState(bbFormat,SkinStates.DOWN);
			saveButton.setTextFormatForState(bbFormat,SkinStates.SELECTED);
			addChild(saveButton);
			
		}
	}
}