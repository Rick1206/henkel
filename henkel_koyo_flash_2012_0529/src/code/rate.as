package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import code.ScrollBar;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class rate extends MovieClip {
		
		
		public function rate() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		private function init(e:Event=null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			var myScroll:ScrollBar = new ScrollBar(Masked,Mask,slider,scroll_bg);
				myScroll.direction = "L";
				myScroll.tween = 5;
				myScroll.elastic = false;
				myScroll.lineAbleClick = true;
				myScroll.mouseWheel = true;
				myScroll.stepNumber = 15;
			
		}
	}
	
}
