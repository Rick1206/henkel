package code {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class subspeedline extends MovieClip {
		
		private var numDis:Number;
		private var numHet:Number;
		public function subspeedline() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			subLine.addEventListener(MouseEvent.ROLL_OUT, onRollHandle);
			subLine.addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
			
		}
		public function getNum():Number {
			return Number(txtNum.text);
		}
		
		public function setDis(num:Number,hei:Number):void {
			subLine.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandle);
			subLine.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandle);
			numDis = num; 
			numHet = hei;
		}
		private function onMouseUpHandle(e:MouseEvent=null):void {
			var TEvent:TChangeEvent = new TChangeEvent(TChangeEvent.TCHANGE);				
				dispatchEvent(TEvent);
			subLine.stopDrag();
			removeEventListener(Event.ENTER_FRAME, onMouseMoveHandle);
		}
		private function onMouseDownHandle(e:MouseEvent):void {
			var rect:Rectangle = new Rectangle(15,3.8, 0, numHet-2);
			subLine.startDrag(false,rect);
			addEventListener(Event.ENTER_FRAME, onMouseMoveHandle);
		}
		private function onMouseMoveHandle(e:Event):void {
			
			var currentY:Number = subLine.y;
		
			
			//var res:Number = Math.round((int(currentY / numHet * numDis  / .01) )) * .01;
			
			var res:Number = Math.round((int(currentY / numHet * numDis )));
			
			txtNum.text = String(res);
			
			mcLine.subRec.width = currentY;
			mcLine.lineRight.x = currentY + 3 ;
			
			
			if (currentY > numHet) {
				onMouseUpHandle();
			}
			
			if (currentY < 0) {
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
