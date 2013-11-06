package cml.elements
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width = "1280", height = "720", backgroundColor = "0x000000", frameRate = "30")]

	/**
	 * This example demonstrates the use of the Dial class within CML.
	 */
	public class DrawerEx extends GestureWorks
	{
		public function DrawerEx():void 
		{	
			super();
			gml = "gml/gestures.gml";			
			cml = "elements/Drawer.cml";			
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}

		private function cmlInit(event:Event):void
		{
			trace("cmlInit()");
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
		}
	
	}
}