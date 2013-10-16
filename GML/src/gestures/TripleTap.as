package gestures
{
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.core.TouchSprite;
	import com.gestureworks.events.GWGestureEvent;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.geom.ColorTransform;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class TripleTap extends GestureWorks
	{
		public function TripleTap():void
		{
			gml = "gml/triple-tap.gml";
		}
		
		override protected function gestureworksInit():void
		{
			trace("gestureWorksInit()");
			
			// entry point			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("triple-tap");
			exTemp.createDesc("<p>The double tap gesture is recognized when two tap events occur within a specified time interval and translation threshold. " + "These values can be set in the GML definition. The interval can be set using the \"event_duration_max\" attribute and the translation threshold can be set using the " + "\"translation_max\" attribute. The duration threshold for the two tap events can be set using the \"interevent_duration_max\". NOTE: These attributes are currently not working in the double tap gesture.</p><br />" +
				
				"<p>Like other gestures you can turn an \"triple-tap\" gesture into a 1-finger, 2-finger, etc. double_tap gesture by altering the cluster point number. NOTE: This feature is currently " + "not working in the double tap gesture. Use the \"triple_tap_n\" return value instead.</p><br />" +
				
				"<p>This example randomly changes the color of the square on each tap event. It also traces the return values to the output window.</p><br />");
			
			// create a touchable sprite 
			var touchSprite:TouchSprite = new TouchSprite();
			
			// draw a simple graphic
			touchSprite.graphics.beginFill(0xFF0000);
			touchSprite.graphics.drawRect(0, 0, 300, 300);
			touchSprite.graphics.endFill();
			
			// align graphic
			touchSprite.x = ((stage.stageWidth - 200) / 2) + 150;
			touchSprite.y = ((stage.stageHeight - 200) / 2) - 50;
			
			// add touch sprite to display list 
			addChild(touchSprite);
			
			// add events 
			touchSprite.gestureList = {"triple-tap": true};
			touchSprite.addEventListener(GWGestureEvent.TRIPLE_TAP, onTripleTap);
			
			function onTripleTap(event:GWGestureEvent):void
			{
				trace("triple tap");
				trace("triple_tap_n:", event.value.triple_n);
				trace("triple_tap_x:", event.value.triple_x);
				trace("triple_tap_y:", event.value.triple_y);
				
				var c:ColorTransform = event.target.transform.colorTransform;
				c.color = Math.random() * 0xFFFFFF;
				event.target.transform.colorTransform = c;
			}
		
		}
	}
}