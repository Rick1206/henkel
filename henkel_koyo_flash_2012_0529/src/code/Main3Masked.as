package  code{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import com.greensock.TweenMax;
		import flash.ui.Mouse;
	import flash.ui.MouseCursor;

	public class Main3Masked extends MovieClip {
		private var state:String;
		
		public function Main3Masked() {
			
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
			
		}
		
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			main2.visible = false;
			main2.alpha = 0;
			
			btnLast.addEventListener(MouseEvent.CLICK, onChangContentHandle);
			btnNext.addEventListener(MouseEvent.CLICK, onChangContentHandle);
			
			btnLast.addEventListener(MouseEvent.ROLL_OUT, onRollHandle);
			btnNext.addEventListener(MouseEvent.ROLL_OUT, onRollHandle);
			
			btnLast.addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
			btnNext.addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
			
			btnLast.gotoAndStop(2);
			state = "1";
		}
		
		private function onChangContentHandle(e:Event):void {
				var str:String = e.currentTarget.name;
				
				switch(str) {
					case "btnNext":
						
					btnLast.gotoAndStop(1);
					btnNext.gotoAndStop(2);
					
					TweenMax.to(main1, 0.5, { autoAlpha:0,onComplete:function() {
						TweenMax.to(main2, 0.5, { autoAlpha:1 } );
						
						} } );
						
					
					state = "2";
					break;
					
				case "btnLast":
						
					btnLast.gotoAndStop(2);
					btnNext.gotoAndStop(1);

					TweenMax.to(main2, 0.5, { autoAlpha:0,onComplete:function() {
						TweenMax.to(main1, 0.5, { autoAlpha:1 } );
						
						} } );
						
					state = "1";
					break;
				}
		}
		private function onRollHandle(e:MouseEvent):void {
			var str:String = e.type;
			switch(str) {
				case "rollOut":
					Mouse.cursor = MouseCursor.ARROW;
					break;
				case "rollOver":
					Mouse.cursor = MouseCursor.BUTTON;
					break;
			}
		}
	}
	
}
