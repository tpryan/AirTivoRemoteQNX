package components
{
	import flash.display.DisplayObject;
	import flash.display.LoaderInfo;
	import flash.geom.Rectangle;
	import flash.geom.Transform;
	import flash.text.TextFormat;
	
	import qnx.ui.listClasses.CellRenderer;
	import qnx.ui.listClasses.ICellRenderer;
	import qnx.ui.skins.SkinStates;
	
	public class TivoListItemRenderer extends CellRenderer
	{
		public function TivoListItemRenderer()
		{
			var newformat:TextFormat = new TextFormat();
			newformat.font = "DejaVu Sans";
			this.setTextFormatForState(newformat, SkinStates.UP);
			this.setTextFormatForState(newformat, SkinStates.UP_ODD);
			this.setTextFormatForState(newformat, SkinStates.DOWN);
			this.setTextFormatForState(newformat, SkinStates.DOWN_SELECTED);
			this.setTextFormatForState(newformat, SkinStates.DISABLED);
			this.setTextFormatForState(newformat, SkinStates.DISABLED_SELECTED);
			this.setTextFormatForState(newformat, SkinStates.SELECTED);
			this.setTextFormatForState(newformat, SkinStates.FOCUS);
		} // constructor
	} //Class
}  // Package 