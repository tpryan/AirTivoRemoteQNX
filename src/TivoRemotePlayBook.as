package 
{
	import com.terrenceryan.tivoremote.Tivo;
	import com.terrenceryan.tivoremote.TivoRemote;
	import com.terrenceryan.tivoremote.TivoService;
	
	import components.ArrowPad;
	import components.ChannelPad;
	import components.NumberPad;
	import components.PlayControlPad;
	import components.ThumbsPad;
	import components.TivoListItemRenderer;
	
	import flash.desktop.NativeApplication;
	import flash.display.GradientType;
	import flash.display.Graphics;
	import flash.display.SpreadMethod;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Matrix;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import qnx.ui.buttons.Button;
	import qnx.ui.buttons.LabelButton;
	import qnx.ui.data.DataProvider;
	import qnx.ui.listClasses.DropDown;
	import qnx.ui.listClasses.List;
	import qnx.ui.listClasses.ListSelectionMode;
	import qnx.ui.skins.SkinStates;
	import qnx.ui.theme.ThemeGlobals;
	import components.TivoForm;
	
	
	// The following metadata specifies the size and properties of the canvas that
	// this application should occupy on the BlackBerry PlayBook screen.
	[SWF(width="1024", height="600", backgroundColor="#cccccc", frameRate="30")]
	public class TivoRemotePlayBook extends Sprite
	{
		
		ThemeGlobals.currentTheme = ThemeGlobals.BLACK;
		
		protected var tivoService:TivoService = new TivoService();
		protected var tivoRemote:TivoRemote = null;
		
		protected var numpad:NumberPad = null;
		protected var arrowPad:ArrowPad = null;
		protected var playControlPad:PlayControlPad = null;
		protected var channelPad:ChannelPad = null;
		protected var thumbsPad:ThumbsPad = null;
		protected var tivoList:List = new List();
		protected var tivoForm:TivoForm = new TivoForm();
		
		private const BUTTON_WIDTH:int = 170;
		private const BUTTON_HEIGHT:int = 50;
		private const COL1X:int= 10;
		private const COL2X:int= 200;
		private const COL3X:int= 390;
		private const TOP:int= 10;
		private const ROW2Y:int = 280;
		
		public function TivoRemotePlayBook()
		{
			
			initTivo();
			drawBG();
			drawNumPad();
			drawArrowPad();
			drawPlayControlPad();
			drawChannelPad();
			drawThumbsPad();
			
			var bbFormat:TextFormat = new TextFormat();
			bbFormat.font = "DejaVu Sans";
			
			
			var closeButton:LabelButton = getLabelButton("Close",(stage.stageWidth - BUTTON_WIDTH) -10, 10);
			closeButton.addEventListener(MouseEvent.CLICK, closeWindow);
			addChild(closeButton);
			
			
			var tivoButton:LabelButton = getLabelButton("Tivo",COL2X, TOP);
			tivoButton.addEventListener(MouseEvent.CLICK, tivo_clickHandler);
			addChild(tivoButton);
			
			var liveButton:LabelButton =  getLabelButton("Live TV",COL2X, tivoButton.y + tivoButton.height + 10);
			liveButton.addEventListener(MouseEvent.CLICK, live_clickHandler);
			addChild(liveButton);
			
			var infoButton:LabelButton =  getLabelButton("Info",COL2X, liveButton.y + liveButton.height + 10);
			infoButton.addEventListener(MouseEvent.CLICK, live_clickHandler);
			addChild(infoButton);
			
			var guideButton:LabelButton =  getLabelButton("Guide",COL2X, infoButton.y + infoButton.height + 10);
			guideButton.addEventListener(MouseEvent.CLICK, live_clickHandler);
			addChild(guideButton);
			
			
		}
		
		private function handleListChange(e:Event):void{
			var tivo:Tivo = tivoService.getItemForID(tivoList.selectedItem.data);
			tivoForm.nameInput.text = tivo.name;
			tivoForm.hostnameInput.text = tivo.hostname;
		}
		
		
		private function convertTivosToDataProvider(a:Array):DataProvider{
			var result:DataProvider = new DataProvider();
			
			for(var i:int = 0; i < a.length; i++){
				var tivo:Tivo = a[i];
				result.addItem({label:tivo.name, data:tivo.id});
			}
			
			return result
		}
		
		private function drawChannelPad():void{
			channelPad = new ChannelPad();
			channelPad.x = COL3X ;
			channelPad.y = ROW2Y;
			channelPad.addEventListener("upClick", channelUp_clickHandler);
			channelPad.addEventListener("downClick", channelDown_clickHandler);
			addChild(channelPad);
		}
		
		private function drawThumbsPad():void{
			thumbsPad = new ThumbsPad();
			thumbsPad.x = COL3X;
			thumbsPad.y = TOP;
			thumbsPad.addEventListener("upClick", thumbsUp_clickHandler);
			thumbsPad.addEventListener("downClick", thumbsDown_clickHandler);
			addChild(thumbsPad);
		}
		
		private function drawPlayControlPad():void{
			playControlPad = new PlayControlPad();
			playControlPad.x= COL1X;
			playControlPad.y = ROW2Y;
			playControlPad.addEventListener("reverse", actionReverse_clickHandler);
			playControlPad.addEventListener("replay", actionReplay_clickHandler);
			playControlPad.addEventListener("pause", actionPause_clickHandler);
			playControlPad.addEventListener("slow", actionSlow_clickHandler);
			playControlPad.addEventListener("forward", actionForward_clickHandler);
			
			addChild(playControlPad);
		}
		
		private function drawArrowPad():void{
			arrowPad = new ArrowPad();
			arrowPad.x= COL1X;
			arrowPad.y= TOP;
			arrowPad.addEventListener("upClick", up_clickHandler);
			arrowPad.addEventListener("downClick", down_clickHandler);
			arrowPad.addEventListener("leftClick", left_clickHandler);
			arrowPad.addEventListener("rightClick", right_clickHandler);
			arrowPad.addEventListener("selectClick", select_clickHandler);
			addChild(arrowPad);
		}
		
		private function drawNumPad():void{
			numpad = new NumberPad();
			numpad.x = COL2X;
			numpad.y = ROW2Y;
			numpad.addEventListener("num1", pad1_clickHandler);
			numpad.addEventListener("num2", pad2_clickHandler);
			numpad.addEventListener("num3", pad3_clickHandler);
			numpad.addEventListener("num4", pad4_clickHandler);
			numpad.addEventListener("num5", pad5_clickHandler);
			numpad.addEventListener("num6", pad6_clickHandler);
			numpad.addEventListener("num7", pad7_clickHandler);
			numpad.addEventListener("num8", pad8_clickHandler);
			numpad.addEventListener("num9", pad9_clickHandler);
			numpad.addEventListener("num0", pad0_clickHandler);
			numpad.addEventListener("e", enter_clickHandler);
			numpad.addEventListener("c", clear_clickHandler);
			addChild(numpad);
		}
		
		private function closeWindow(event:MouseEvent):void{
			NativeApplication.nativeApplication.exit();
			
		}
		
		private function drawBG():void{
			/****************************
			 Define Variables
			 ****************************/
			//Type of Gradient we will be using
			var fType:String = GradientType.LINEAR;
			//Colors of our gradient in the form of an array
			var colors:Array = [0x333333, 0x0c0c0c ];
			//Store the Alpha Values in the form of an array
			var alphas:Array = [ 1, 1 ];
			//Array of color distribution ratios.  
			//The value defines percentage of the width where the color is sampled at 100%
			var ratios:Array = [ 0, 255 ];
			//Create a Matrix instance and assign the Gradient Box
			var matr:Matrix = new Matrix();
			matr.createGradientBox( stage.stageHeight,  stage.stageWidth, Math.PI/2, 0,0);
			//SpreadMethod will define how the gradient is spread. Note!!! Flash uses CONSTANTS to represent String literals
			var sprMethod:String = SpreadMethod.PAD;
			//Start the Gradietn and pass our variables to it
			var sprite:Sprite = new Sprite();
			//Save typing + increase performance through local reference to a Graphics object
			var g:Graphics = sprite.graphics;
			g.beginGradientFill( fType, colors, alphas, ratios, matr, sprMethod );
			g.drawRect( 0, 0, stage.stageWidth, stage.stageHeight );
			
			addChild( sprite );
			
		}
		
		protected function getLabelButton(label:String, x:int, y:int ):LabelButton{
			var bbFormat:TextFormat = new TextFormat();
			bbFormat.font = "DejaVu Sans";
			
			var button:LabelButton = new LabelButton();
			button.label = label;
			button.width = BUTTON_WIDTH;
			button.height = BUTTON_HEIGHT;
			
			button.x = x;
			button.y = y;
			
			button.setTextFormatForState(bbFormat,SkinStates.DISABLED);
			button.setTextFormatForState(bbFormat,SkinStates.UP); 
			button.setTextFormatForState(bbFormat,SkinStates.DOWN);
			button.setTextFormatForState(bbFormat,SkinStates.SELECTED);
			return button;
		}
		
		protected function initTivo():void{
			
			/*if (tivoService.active == null){
				navigator.pushView(Settings, {msg:"Please add a device"});
				
			}else{
				tivoRemote = new TivoRemote(tivoService.active.hostname);
			}*/
			tivoRemote = new TivoRemote("d");
		}
		
		protected function actionPause_clickHandler(e:Event):void{
			tivoRemote.pause();
		}
		
		protected function actionReplay_clickHandler(e:Event):void{
			tivoRemote.replay();
		}
		
		protected function actionForward_clickHandler(e:Event):void{
			tivoRemote.forward();
		}
		
		protected function actionReverse_clickHandler(e:Event):void{
			tivoRemote.reverse();
		}
		
		protected function actionSlow_clickHandler(e:Event):void{
			tivoRemote.slow();
		}
		
		protected function channelUp_clickHandler(e:Event):void{
			tivoRemote.channelup();
		}
		
		protected function channelDown_clickHandler(e:Event):void{
			tivoRemote.channeldown();
		}
		
		protected function select_clickHandler(e:Event):void{
			tivoRemote.select();
		}
		
		protected function up_clickHandler(e:Event):void{
			tivoRemote.up();
		}
		
		protected function down_clickHandler(e:Event):void{
			tivoRemote.down();
		}
		
		protected function left_clickHandler(e:Event):void{
			tivoRemote.left();
		}
		
		protected function right_clickHandler(e:Event):void{
			tivoRemote.right();
		}
		
		protected function tivo_clickHandler(e:Event):void{
			tivoRemote.tivo();
		}
		
		protected function live_clickHandler(e:Event):void{
			tivoRemote.livetv();
		}
		
		protected function pad1_clickHandler(e:Event):void{
			tivoRemote.num1();
		}
		
		protected function pad2_clickHandler(e:Event):void{
			tivoRemote.num2();
		}
		
		protected function pad3_clickHandler(e:Event):void{
			tivoRemote.num3();
		}
		
		protected function pad4_clickHandler(e:Event):void{
			tivoRemote.num4();
		}
		
		protected function pad5_clickHandler(e:Event):void{
			tivoRemote.num5();
		}
		
		protected function pad6_clickHandler(e:Event):void{
			tivoRemote.num6();
		}
		
		protected function pad7_clickHandler(e:Event):void{
			tivoRemote.num7();
		}
		
		protected function pad8_clickHandler(e:Event):void{
			tivoRemote.num8();
		}
		
		protected function pad9_clickHandler(e:Event):void{
			tivoRemote.num9();
		}
		
		protected function pad0_clickHandler(e:Event):void{
			tivoRemote.num0();
		}
		
		protected function enter_clickHandler(e:Event):void{
			tivoRemote.enter();
		}
		
		protected function clear_clickHandler(e:Event):void{
			tivoRemote.clear();
		}
		
		protected function thumbsUp_clickHandler(e:Event):void
		{
			tivoRemote.thumbsup();
		}
		
		protected function thumbsDown_clickHandler(e:Event):void
		{
			tivoRemote.thumbsdown();
		}
		
		protected function play_clickHandler():void{
			tivoRemote.play();
		}
		
		protected function advance_clickHandler():void{
			tivoRemote.advance();
		}
		
		protected function replay_clickHandler():void{
			tivoRemote.replay();
		}
		
		
	}
}