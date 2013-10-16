package as3.components
{
	import com.gestureworks.cml.components.YouTubeViewer;
	import com.gestureworks.cml.element.Button;
	import com.gestureworks.cml.element.Container;
	import com.gestureworks.cml.element.Frame;
	import com.gestureworks.cml.element.Graphic;
	import com.gestureworks.cml.element.Menu;
	import com.gestureworks.cml.element.Text;
	import com.gestureworks.cml.element.TouchContainer;
	import com.gestureworks.cml.element.YouTube;
	import com.gestureworks.core.GestureWorks;
	import com.gestureworks.utils.ExampleTemplate;
	import flash.display.Sprite;
	import flash.events.Event;
	
	[SWF(width="1280",height="720",backgroundColor="0x000000",frameRate="30")]
	
	public class YouTubeViewerEx extends GestureWorks
	{
		[Embed(source="../../../bin/assets/openexhibits_assets.swf",symbol="org.openexhibits.assets.Info")]
		private var infoBtn:Class;
		
		[Embed(source="../../../bin/assets/openexhibits_assets.swf",symbol="org.openexhibits.assets.Play")]
		private var playBtn:Class;
		
		[Embed(source="../../../bin/assets/openexhibits_assets.swf",symbol="org.openexhibits.assets.Pause")]
		private var pauseBtn:Class;
		
		[Embed(source="../../../bin/assets/openexhibits_assets.swf",symbol="org.openexhibits.assets.Close")]
		private var closeBtn:Class;
		
		public function YouTubeViewerEx():void
		{
		
		}
		
		override protected function gestureworksInit():void
		{
			// entry point
			
			var exTemp:ExampleTemplate = new ExampleTemplate();
			exTemp.createHeader();
			addChild(exTemp);
			
			exTemp.createTitle("Youtube Viewer");
			exTemp.createDesc("<p>Viewer tags are used as larger containers which help to combine menu items and extra functionality with elements.</p><br /><p>In this case, the menu not only provides a helpful visual frame and an info panel, but buttons which allow access to the YouTube's play and pause functions without having to set chrome=\"true\" in the element tag.</p><br /><p>This example loads a YouTube, and flips it with an info-panel.</p>");
			
			var youtubeViewer:YouTubeViewer = new YouTubeViewer();
			
			//The viewer frame
			var frameContainer:TouchContainer = new TouchContainer();
			frameContainer.className = "frame_container";
			frameContainer.visible = true;
			frameContainer.targetParent = true;
			frameContainer.init();
			
			var frame:Frame = new Frame();
			frame.className = "frame_element";
			frameContainer.addChild(frame);
			frameContainer.childToList("frame_element", frame);
			
			frame.init();
			
			youtubeViewer.addChild(frameContainer);
			youtubeViewer.childToList("frame_container", frameContainer);
			
			// The Youtube video itself.
			var ytContainer:TouchContainer = new TouchContainer();
			ytContainer.className = "video_container";
			ytContainer.visible = true;
			ytContainer.targetParent = true;
			ytContainer.init();
			
			var youtube:YouTube = new YouTube();
			youtube.src = "h0MZX-D8xzA";
			youtube.width = 600;
			youtube.height = 360;
			youtube.autoplay = false;
			youtube.className = "youtube_element";
			ytContainer.addChild(youtube);
			ytContainer.childToList("youtube_element", youtube);
			
			youtube.init();
			
			youtubeViewer.addChild(ytContainer);
			youtubeViewer.childToList("video_container", ytContainer);
			youtubeViewer.video = youtube;
			
			// Info container
			var infoContainer:TouchContainer = new TouchContainer();
			infoContainer.className = "info_container";
			infoContainer.visible = false;
			infoContainer.targetParent = true;
			infoContainer.init();
			
			var infoBg:Graphic = new Graphic();
			infoBg.shape = "rectangle";
			infoBg.className = "info_bg";
			infoBg.alpha = 0.6;
			infoBg.lineStroke = 0;
			infoBg.color = 0xFFAE1F;
			infoContainer.addChild(infoBg);
			infoContainer.childToList("info_bg", infoBg);
			
			var infoTitle:Text = new Text();
			infoTitle.border = false;
			infoTitle.embedFonts = true;
			infoTitle.font = "OpenSansBold";
			infoTitle.fontSize = 20;
			infoTitle.color = 0xffffff;
			infoTitle.className = "title";
			infoTitle.selectable = false;
			infoTitle.text = "A Noir Exercise";
			infoTitle.x = 30;
			infoTitle.y = 60;
			
			var infoBody:Text = new Text();
			infoBody.border = false;
			infoBody.className = "info_description";
			infoBody.selectable = false;
			infoBody.multiline = true;
			infoBody.wordWrap = true;
			infoBody.width = 300;
			infoBody.fontSize = 14;
			infoBody.color = 0xffffff;
			infoBody.font = "OpenSansRegular";
			infoBody.text = "A silent experiment in Noir cinematography using the Panasonic AF-100, by Joshua Hicks";
			
			infoContainer.addChild(infoTitle);
			infoContainer.childToList("title", infoTitle);
			infoContainer.addChild(infoBody);
			infoContainer.childToList("info_description", infoBody);
			
			youtubeViewer.addChild(infoContainer);
			youtubeViewer.childToList("info_container", infoContainer);
			youtubeViewer.back = infoContainer;
			
			//Info section ends.
			
			// Menu
			
			var menu:Menu = new Menu();
			menu.className = "menu_container";
			menu.alpha = 0.6;
			menu.position = "bottom";
			menu.paddingLeft = 30;
			menu.paddingBottom = -50;
			menu.paddingRight = 20;
			menu.autoHide = true;
			menu.visible = false;
			
			var infoButton:Button = new Button();
			infoButton = createButton(infoButton, "info", 15, 8, infoBtn);
			infoButton.id = "info-btn";
			infoButton.className = "info_btn";
			
			menu.addChild(infoButton);
			infoButton.init();
			menu.childToList("infoBtn", infoButton);
			
			var playButton:Button = new Button();
			playButton = createButton(playButton, "play", 15, 8, playBtn);
			playButton.id = "play-btn";
			playButton.className = "play_btn";
			
			menu.addChild(playButton);
			playButton.init();
			menu.childToList("playBtn", playButton);
			
			var pauseButton:Button = new Button();
			pauseButton = createButton(pauseButton, "pause", 14.5, 8.5, pauseBtn);
			pauseButton.id = "pause-btn";
			pauseButton.className = "pause_btn";
			
			menu.addChild(pauseButton);
			pauseButton.init();
			menu.childToList("pauseBtn", pauseButton);
			
			var closeButton:Button = new Button();
			closeButton = createButton(closeButton, "close", 11, 11, closeBtn);
			closeButton.id = "close-btn";
			closeButton.className = "close_btn";
			
			menu.addChild(closeButton);
			closeButton.init();
			menu.childToList("closeBtn", closeButton);
			
			menu.init();
			
			youtubeViewer.addChild(menu);
			youtubeViewer.childToList("menu", menu);
			youtubeViewer.menu = menu;
			
			addChild(youtubeViewer);
			
			youtubeViewer.init();
			
			youtubeViewer.x = 500;
			youtubeViewer.y = 250;
			youtubeViewer.rotation = -20;
			youtubeViewer.mouseChildren = true;
			
			youtubeViewer.gestureEvents = true;
			youtubeViewer.gestureList = {"n-drag": true, "n-scale": true, "n-rotate": true, "tap": true};
		}
		
		private function createButton(b:Button, type:String, offX:Number, offY:Number, btnClass:Class):Button
		{
			var btnUp:Container = new Container();
			btnUp.id = type + "-up";
			
			var btnUpBg:Graphic = new Graphic();
			btnUpBg.shape = "circle";
			btnUpBg.alpha = 1;
			btnUpBg.radius = 20;
			btnUpBg.lineStroke = 1.5;
			btnUpBg.color = 0x282E33;
			
			btnUp.addChild(btnUpBg);
			btnUp.childToList(type + "UpBg", btnUpBg);
			
			var btnUpIcon:Sprite = new btnClass();
			btnUpIcon.alpha = 1;
			btnUpIcon.x = offX;
			btnUpIcon.y = offY;
			btnUpIcon.scaleX = 1.6;
			btnUpIcon.scaleY = 1.6;
			
			btnUp.addChild(btnUpIcon);
			btnUp.childToList(type + "UpIcon", btnUpIcon);
			
			var btnDown:Container = new Container();
			btnDown.id = "btn-down";
			
			var btnDownBg:Graphic = new Graphic();
			btnDownBg.shape = "circle";
			btnDownBg.id = type + "DownBg";
			btnDownBg.alpha = 1;
			btnDownBg.radius = 20;
			btnDownBg.lineStroke = 1.5;
			btnDownBg.color = 0x495E67;
			
			btnDown.addChild(btnDownBg);
			btnDown.childToList(type + "DownBg", btnDownBg);
			
			var btnDownIcon:Sprite = new btnClass();
			btnDownIcon.alpha = 1;
			btnDownIcon.x = offX;
			btnDownIcon.y = offY;
			btnDownIcon.scaleX = 1.6;
			btnDownIcon.scaleY = 1.6;
			
			btnDown.addChild(btnDownIcon);
			btnDown.childToList(type + "DownIcon", btnDownIcon);
			
			var btnHit:Container = new Container();
			btnHit.id = type + "-hit";
			
			var hitShp:Graphic = new Graphic();
			hitShp.shape = "circle";
			hitShp.id = type + "HitBg";
			hitShp.alpha = 0;
			hitShp.radius = 20;
			hitShp.lineStroke = 1.5;
			hitShp.color = 0xCCCCCC;
			
			btnHit.addChild(hitShp);
			btnHit.childToList(type + "HitBg", hitShp);
			
			b.addChild(btnUp);
			b.childToList(type + "-up", btnUp);
			
			b.addChild(btnDown);
			b.childToList(type + "-down", btnDown);
			
			b.addChild(btnHit);
			b.childToList(type + "-hit", btnHit);
			
			b.initial = type + "-up";
			
			b.up = type + "-up";
			b.out = type + "-up";
			b.down = type + "-down";
			b.hit = type + "-hit";
			
			b.dispatch = "down:" + type;
			
			return b;
		}
	}

}