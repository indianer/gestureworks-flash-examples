package as3.layouts
{
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Image;
	import com.gestureworks.cml.layouts.GridLayout;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class GridLayoutEx extends GestureWorks
	{
		public function GridLayoutEx():void
		{
			gml = "gml/gestures.gml";		
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			var exTemp:ExampleTemplate = new ExampleTemplate();
			addChild(exTemp);
			
			exTemp.createTitle("GridLayout");
			exTemp.createDesc("<p>The GridLayout positions the container's objects in a grid based on the number of rows, columns, and spacing(pixels). By default, the distribution is from left to right but can be performed from top to bottom by setting the \"leftToRight\" flag to false. Spacing is controlled by the \"spacingX\" and \"spacingY\" attributes and can be switched to use margins(marginX and marginY) through the \"useMargins\" flag.<br /><br />" + "This example demonstrates a 3x3 grid layout with margins of 4px.</p>" + "<br /><p>See also:<br />LayoutFactory<br />ListLayout<br /></p>");
			
			var grid:Container = getImageContainer();
			grid.x = 480;
			grid.y = 125;
			grid.applyLayout(getGridLayout());
			addChild(grid);
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
		 * Returns a 3x3 grid layout
		 * @return
		 */
		private function getGridLayout():GridLayout
		{
			var gridLayout:GridLayout = new GridLayout();
			gridLayout.rows = 3;
			gridLayout.columns = 3;
			gridLayout.useMargins = true;
			gridLayout.marginX = 4;
			gridLayout.marginY = 4;
			gridLayout.tween = true;
			gridLayout.tweenTime = 1500;
			return gridLayout;
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