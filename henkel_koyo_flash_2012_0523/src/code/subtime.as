package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.TweenMax;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.plugins.TransformAroundPointPlugin;
	import flash.geom.Point;

	public class subtime extends MovieClip {
		
		
		public function subtime() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		private function init(e:Event=null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			TweenPlugin.activate([TransformAroundPointPlugin]);
			
		}
		public function setRot(num:int):void {
			
			if (num > 360) {
				num = num % 360
			}else if (num > 1080) {
				num = 1080;
			}
				
			if (num < -360 ) {
				num = num % 360
			}else if (num < -360) {
					num = -1080;
			}
			
			trace(num);
			
			
			perTxt.text = String(Math.round((num / 360 * 100))) + "(%)";
		
			TweenMax.to(timeLine, 0.5, { transformAroundPoint: { point:new Point(32, 32), rotation:num }} );
			
			var rotation:int = num % 360;
			
			if (rotation < 0) {
				rotation = 360 + rotation;
			}
			
			Mask.gotoAndStop(rotation);
		}
	}
}
