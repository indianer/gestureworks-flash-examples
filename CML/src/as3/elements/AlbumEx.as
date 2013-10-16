package as3.elements
{
	import com.gestureworks.cml.element.Album;
	import com.gestureworks.cml.element.Container;
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.Image;
	import com.gestureworks.cml.utils.CloneUtils;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="60")]
	
	public class AlbumEx extends GestureWorks
	{
		private var arrowHead:Graphic;
		private var arrowShaft:Graphic;
		private var arrowBkg:Graphic;
		
		public function AlbumEx():void
		{
		
		}
		
		override protected function gestureworksInit():void
		{
			
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Album");
			exTemp.createDesc("<p>The Album provides a list of display objects that can be scrolled horizontally or vertically.<br /><br />" + "This example demonstrates the scrolling of a set of images by dragging the list along the x or y axis. When the drag is complete, the view will snap to the closest display object.</p><br/>" + "<p>See also:<br />AlbumViewer<br /></p>");
			
			addChild(horizontalAlbum());
			addChild(verticalAlbum());
		}
		
		/**
		 * Returns a horizontal album element
		 * @return
		 */
		private function horizontalAlbum():Album
		{
			var h_album:Album = new Album();
			h_album.x = 625;
			h_album.y = 50;
			
			h_album.addChild(getArrow("right"));
			h_album.addChild(getImage("assets/images/wb3.jpg"));
			h_album.addChild(getImage("assets/images/USS_Macon_over_Manhattan.png"));
			h_album.addChild(getImage("assets/images/wb3.jpg"));
			h_album.addChild(getArrow("left"));
			
			h_album.init();
			return h_album;
		}
		
		/**
		 * Returns a vertical ablum element
		 * @return
		 */
		private function verticalAlbum():Album
		{
			var v_album:Album = new Album();
			v_album.x = 625;
			v_album.y = 375;
			v_album.horizontal = false;
			
			v_album.addChild(getArrow("down"));
			v_album.addChild(getImage("assets/images/wb3.jpg"));
			v_album.addChild(getImage("assets/images/USS_Macon_over_Manhattan.png"));
			v_album.addChild(getImage("assets/images/wb3.jpg"));
			v_album.addChild(getArrow("up"));
			
			v_album.init();
			
			return v_album;
		}
		
		/**
		 * Returns the arrow rotated and positioned according to the direction
		 * @param	direction  left, right, up, or down
		 * @return
		 */
		private function getArrow(direction:String):Container
		{
			var arrow:Container = new Container();
			var bkg:Graphic = getArrowBkg();
			var head:Graphic = getArrowHead();
			var shaft:Graphic = getArrowShaft();
			arrow.width = bkg.width;
			arrow.height = bkg.height;
			
			switch (direction)
			{
				case "left":
					head.x = 200;
					head.y = 175;
					head.rotation = -90;
					shaft.x = 250;
					shaft.y = 137;
					break;
				case "right":
					head.x = 300;
					head.y = 125;
					head.rotation = 90;
					shaft.x = 200;
					shaft.y = 137;
					break;
				case "up":
					head.x = 225;
					head.y = 100;
					head.rotation = 0;
					shaft.x = 263;
					shaft.y = 150;
					shaft.rotation = 90;
					break;
				case "down":
					head.x = 275;
					head.y = 200;
					head.rotation = 180;
					shaft.x = 263;
					shaft.y = 100;
					shaft.rotation = 90;
					break;
				default:
			}
			
			arrow.addChild(bkg);
			arrow.addChild(head);
			arrow.addChild(shaft);
			return arrow;
		}
		
		/**
		 * Returns the a background graphic
		 * @return
		 */
		private function getArrowBkg():Graphic
		{
			if (arrowBkg)
				return CloneUtils.clone(arrowBkg);
			
			arrowBkg = new Graphic;
			arrowBkg.shape = "rectangle"
			arrowBkg.lineStroke = 0;
			arrowBkg.width = 500;
			arrowBkg.height = 300;
			return arrowBkg;
		}
		
		/**
		 * Returns a triangle graphic
		 * @return
		 */
		private function getArrowHead():Graphic
		{
			if (arrowHead)
				return CloneUtils.clone(arrowHead);
			
			arrowHead = new Graphic();
			arrowHead.shape = "triangle";
			arrowHead.color = 0xFFFFFF;
			arrowHead.height = 50;
			return arrowHead;
		}
		
		/**
		 * Returns a rectangle graphic
		 * @return
		 */
		private function getArrowShaft():Graphic
		{
			if (arrowShaft)
				return CloneUtils.clone(arrowShaft);
			
			arrowShaft = new Graphic();
			arrowShaft.shape = "rectangle";
			arrowShaft.color = 0xFFFFFF;
			arrowShaft.width = 50;
			arrowShaft.height = 25;
			return arrowShaft;
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
			img.width = 500;
			img.height = 300;
			return img;
		}
	
	}

}