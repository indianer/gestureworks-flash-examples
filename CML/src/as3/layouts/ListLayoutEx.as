package as3.layouts
{
	import com.gestureworks.cml.elements.Container;
	import com.gestureworks.cml.elements.Image;
	import com.gestureworks.cml.layouts.ListLayout;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class ListLayoutEx extends GestureWorks
	{
		public function ListLayoutEx():void
		{
			gml = "gml/gestures.gml";		
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			var exTemp:ExampleTemplate = new ExampleTemplate();		
			addChild(exTemp);
			
			exTemp.createTitle("ListLayout");
			exTemp.createDesc("<p>The ListLayout positions the container's objects in a horizontal or vertical list. By default, the distribution is horizontal but can be set to vertical by setting the \"type\" attribute to \"vertical\". Spacing(pixels) is controlled by the \"spacingX\" and \"spacingY\" attributes and can be switched to use margins(marginX and marginY) through the \"useMargins\" flag.<br /><br />" + "This example demonstrates a horizontal list with a spacing of 200px and a vertical list with a margin of 5px.</p>" + "<br /><p>See also:<br />LayoutFactory<br />GridLayout<br /></p>");
			
			//horizontal list layout 
			var h_list:Container = getImageContainer();
			h_list.x = 475;
			h_list.y = 25;
			addChild(h_list);
			
			var horiztonalLayout:ListLayout = new ListLayout();
			horiztonalLayout.spacingX = 200;
			horiztonalLayout.tween = true;
			horiztonalLayout.tweenTime = 1500;
			h_list.applyLayout(horiztonalLayout);
			
			//vertical list layout
			var v_list:Container = getImageContainer();
			v_list.x = 750;
			v_list.y = 200;
			addChild(v_list);
			
			var verticalLayout:ListLayout = new ListLayout();
			verticalLayout.type = "vertical";
			verticalLayout.useMargins = true;
			verticalLayout.marginY = 5;
			verticalLayout.tween = true;
			verticalLayout.tweenTime = 1500;
			v_list.applyLayout(verticalLayout);
		
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