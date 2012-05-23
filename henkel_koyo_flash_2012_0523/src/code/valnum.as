package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	
	public class valnum extends MovieClip {
		
		
		public function valnum() {
				if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event=null):void 
		{
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
