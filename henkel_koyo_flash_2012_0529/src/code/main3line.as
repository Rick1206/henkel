package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.TweenMax;
	import com.greensock.plugins.TweenPlugin;
	import com.greensock.plugins.TransformAroundPointPlugin;
	import flash.geom.Point;
	
	
	public class main3line extends MovieClip {
		
		
		public function main3line() {
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
		public function setRot(num:Number):void {
			var res:Number = num * 180;
			if (res>180) {
				res = res % 180;
			}
			trace(res);
			TweenMax.to(timeLine, 0.5, { transformAroundPoint: { point:new Point(0, 14), rotation:res }} );
			
		}
	}
	
}
