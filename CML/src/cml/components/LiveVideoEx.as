package cml.components
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the use of the LiveVideoViewer Tag.
	 */
	public class LiveVideoEx extends GestureWorks
	{
		public function LiveVideoEx():void
		{
			super();
			gml = "gml/gestures.gml"
			cml = "components/LiveVideoViewer.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");
		}
	}
}