package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.*;
	import flash.events.MouseEvent;
	import flash.display.Shape;
	
	
	public class drawmap extends MovieClip {
		private var line:Shape;
		private	var tl:TimelineMax;
		private var arrTxt:Array;
		private var arrTxtX:Array;
		private var arrPos:Array;
		private var arrNum:Array;
		public function drawmap() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			arrTxt = [txt1, txt2, txt3, txt4, txt5, txt6];
			arrTxtX = [txtX1, txtX2, txtX3, txtX4, txtX5, txtX6];
			arrPos = [p1, p2, p3, p4, p5, p6];
			
			line = new Shape();
			addChild(line);
			
			tl = new TimelineMax( { paused:true, onUpdate:drawLine } );
			
			
		}
		
		public function setNum(arr:Array, arr2:Array = null):void {
			
			
			arrNum = new Array;
			for (var key:String in arr) {
				arrNum.push(arr[key]);
			}
			for (key in arr2) {
				arrTxtX[key].text = String(arr2[key]);
			}
			
			
			var numArr:Array = arr; 
			numArr.sort(Array.NUMERIC);
			var len:int = numArr.length;
			var max:Number = numArr[numArr.length - 1];
			var min:Number = numArr[0];
			var dis:Number = (max - min) / (len - 2) ;
			//var res:int = 0;
			
			for (key in arrTxt) {
				arrTxt[key].text = String(Number(key)*dis);
			}
			
			for (key in arr) {	
				arrPos[key].y = 201.9 - arrNum[key] / (Number(txt6.text)) * 201.9 + 77;
			}
			
			mc.x = p1.x;
			mc.y = p1.y;
			
			tl.appendMultiple([
				TweenLite.to(mc, 1, { x:p2.x, y:p2.y } ),
				TweenLite.to(mc, 1, { x:p3.x, y:p3.y } ),
				TweenLite.to(mc, 1, { x:p4.x, y:p4.y } ),
				TweenLite.to(mc, 1, { x:p5.x, y:p5.y } ),
				TweenLite.to(mc, 1, { x:p6.x, y:p6.y } )
				], 0, TweenAlign.SEQUENCE);
			
		
			playTl();
		}
		private	function drawLine():void
		{
			line.graphics.lineTo(mc.x, mc.y);
		}
		private function playTl():void
		{
			//kill existing line
			line.graphics.clear();
	
			//start new line at first point
			line.graphics.lineStyle(5, 0x999999, .5);
			line.graphics.moveTo(p1.x, p1.y);
	
			tl.restart();

		}
	}
	
}
