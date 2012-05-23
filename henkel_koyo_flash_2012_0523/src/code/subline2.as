package code{
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class subline2 extends MovieClip {
		private var numDis:Number;
		public function subline2() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event=null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			subLine.addEventListener(MouseEvent.ROLL_OUT, onRollHandle);
			subLine.addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
		}
		
		public function getNum():Number {
			return Number(txtNum.text);
		}
		
		public function setDis(num:Number):void {
			subLine.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandle);
			subLine.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandle);
			numDis = num; 
		}
		private function onMouseUpHandle(e:MouseEvent=null):void {
			var TEvent:TChangeEvent = new TChangeEvent(TChangeEvent.TCHANGE);				
				dispatchEvent(TEvent);
			
			subLine.stopDrag();
			removeEventListener(Event.ENTER_FRAME, onMouseMoveHandle);
		}
		private function onMouseDownHandle(e:MouseEvent):void {
			var rect:Rectangle = new Rectangle(0, -7, 123, 0);
			subLine.startDrag(false,rect);
			addEventListener(Event.ENTER_FRAME, onMouseMoveHandle);
		}
		private function onMouseMoveHandle(e:Event):void {
			
			var currentX:Number = subLine.x;
			var current:Number = this.mouseX;
			
			
			var res:Number = Math.round(((currentX / 123 * numDis ) ) );
				txtNum.text = String(res);
			
			mcLine.subRec.width = currentX;
			mcLine.lineRight.x = currentX + 3 ;
			
			if (this.mouseX > 130) {
				onMouseUpHandle();
			}
			if (this.mouseX < 0) {
				onMouseUpHandle();
			}
		}
		
		private function onRollHandle(e:MouseEvent):void {
			var str:String = e.type;
			switch(str) {
				case "rollOut":
					Mouse.cursor = MouseCursor.ARROW;
					subLine.stopDrag();
					removeEventListener(Event.ENTER_FRAME, onMouseMoveHandle);
					break;
				case "rollOver":
					Mouse.cursor = MouseCursor.BUTTON;
					break;
			}
		}
	}
}
