package cml.filters
{
	import com.gestureworks.cml.core.CMLParser;
	import com.gestureworks.core.GestureWorks;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	/**
	 * This example demonstrates the Glow filter tag.
	 */
	public class GlowEx extends GestureWorks
	{
		public function GlowEx():void
		{
			super();
			cml = "filters/Glow.cml";
			CMLParser.addEventListener(CMLParser.COMPLETE, cmlInit);			
		}
		
		private function cmlInit(event:Event):void
		{
			CMLParser.removeEventListener(CMLParser.COMPLETE, cmlInit);
			trace("cmlInit()");		
		}
	}
}