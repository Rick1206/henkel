package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.TweenMax;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.plugins.TransformAroundPointPlugin;
	import flash.geom.Point;

	
	public class subMainTime extends MovieClip {
		
		
		public function subMainTime() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			TweenPlugin.activate([TransformAroundPointPlugin]);
		}
		public function setRot(num:int):void {
			if (num > 360) {
				num = num % 360;
			}
			if (num < -360) {
				num = num % 360;
			}
			TweenMax.to(timeLine, 0.5, { transformAroundPoint: { point:new Point(0,0), rotation:num }} );
			
		}
	}
}
