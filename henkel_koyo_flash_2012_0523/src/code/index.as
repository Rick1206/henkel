package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;

	public class index extends MovieClip {
		public function index() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
		}
	}
	
}
