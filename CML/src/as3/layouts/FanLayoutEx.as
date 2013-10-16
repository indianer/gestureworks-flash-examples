package as3.layouts
{
	import com.gestureworks.cml.element.Container;
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.cml.layouts.FanLayout;
	import com.gestureworks.cml.layouts.GridLayout;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class FanLayoutEx extends GestureWorks
	{
		public function FanLayoutEx():void
		{
		
		}
		
		//To best demonstrate the four possible origins of rotation through the fan layout, this example nests the four versions of this layout
		// into a parent container wiith a grid layout.
		
		override protected function gestureworksInit():void
		{
			
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("FanLayout");
			exTemp.createDesc("<p>The FanLayout positions the corners of the container's objects in the same location and rotates them individually around the corner.  <br /><br />" + "This example demonstrates the fan layout rotated around each corner at various degrees of rotation.</p>" + "<br /><p>See also:<br />LayoutFactory<br />PileLayout<br /></p>");
			
			var parent:Container = new Container();
			parent.x = 625;
			parent.y = 50;
			
			var gridLayout:GridLayout = new GridLayout();
			gridLayout.rows = 2;
			gridLayout.columns = 2;
			gridLayout.spacingX = 510;
			gridLayout.spacingY = 600;
			
			var topLeftFan:Container = getImageContainer();
			topLeftFan.applyLayout(getFanLayout());
			parent.addChild(topLeftFan);
			
			var topRightFan:Container = getImageContainer();
			topRightFan.applyLayout(getFanLayout(-10, "topRightOrigin"));
			parent.addChild(topRightFan);
			
			var bottomLeftFan:Container = getImageContainer();
			bottomLeftFan.applyLayout(getFanLayout(-10, "bottomLeftOrigin"));
			parent.addChild(bottomLeftFan);
			
			var bottomRightFan:Container = getImageContainer();
			bottomRightFan.applyLayout(getFanLayout(10, "bottomRightOrigin"));
			parent.addChild(bottomRightFan);
			
			parent.applyLayout(gridLayout);
			addChild(parent);
		}
		
		/**
		 * Returns a container of images
		 * @return
		 */
		private function getImageContainer():Container
		{
			var container:Container = new Container();
			container.addChild(getImage("assets/images/plane.jpg"));
			container.addChild(getImage("assets/images/plane.jpg"));
			container.addChild(getImage("assets/images/plane.jpg"));
			container.addChild(getImage("assets/images/plane.jpg"));
			container.addChild(getImage("assets/images/plane.jpg"));
			container.addChild(getImage("assets/images/plane.jpg"));
			container.addChild(getImage("assets/images/plane.jpg"));
			container.addChild(getImage("assets/images/plane.jpg"));
			return container;
		}
		
		/**
		 * Returns a FanLayout
		 * @param	angle  the angle of rotation
		 * @param	type   the origin or rotation
		 * @return
		 */
		private function getFanLayout(angle:Number = 10, type:String = "topLeftOrigin"):FanLayout
		{
			var fanLayout:FanLayout = new FanLayout();
			fanLayout.angle = angle;
			fanLayout.type = type;
			fanLayout.tween = true;
			fanLayout.tweenTime = 1500;
			return fanLayout;
		}
		
		/**
		 * Returns an image element generated by the external source
		 * @param	source  the source file
		 * @return
		 */
		private function getImage(source:String):Image
		{
			var img:Image = new Image();
			img.open(source);
			img.width = 250;
			img.height = 150;
			img.resample = true;
			return img;
		}
	}

}