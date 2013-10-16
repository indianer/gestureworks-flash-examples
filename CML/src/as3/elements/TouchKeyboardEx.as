package as3.elements
{
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.cml.element.TouchKeyboard;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class TouchKeyboardEx extends GestureWorks
	{
		public function TouchKeyboardEx():void
		{
		
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("TouchKeyboard");
			exTemp.createDesc("<p>The TouchKeyboard is a virtual keyboard providing an interface for a collection of KeyElement objects and output management for key events. Default configurations are in place for convenience but the keyboard's style, layout, and key actions are customizable.<br /><br />" + "This example displays the default layout and demonstrates key actions and the ability switch between multiple text fields.</p><br />" + "<p>See also:<br />KeyElement<br />TouchKeyboardCustom<br /></p>");
			
			//create touch keyboard
			var tk:TouchKeyboard = new TouchKeyboard();
			tk.x = 500;
			tk.y = 300;
			tk.scale = .8;
			tk.init();
			addChild(tk);
			
			//create output text fields
			var tf1:Text = new Text();
			tf1.x = 500;
			tf1.y = 140;
			tf1.width = 365;
			tf1.height = 150;
			tf1.background = true;
			tf1.backgroundColor = 0xFFFFFF;
			tf1.border = true;
			tf1.multiline = true;
			tf1.type = "input";
			addChild(tf1);
			
			var tf2:Text = new Text();
			tf2.x = 875;
			tf2.y = 140;
			tf2.width = 365;
			tf2.height = 150;
			tf2.background = true;
			tf2.backgroundColor = 0xFFFFFF;
			tf2.border = true;
			tf2.multiline = true;
			tf2.type = "input";
			addChild(tf2);
		
		}
	
	}

}