package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.*;
	import flash.events.MouseEvent;
	import flash.display.Shape;
	
	
	public class drawmap2 extends MovieClip {
		private var line:Shape;
		private	var tl:TimelineMax;
		private var arrTxt:Array;
		private var arrTxtX:Array;
		private var arrPos:Array;
		private var arrNum:Array;
		public function drawmap2() {
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
			arrTxtX = [txtX1, txtX2, txtX3, txtX4, txtX5, txtX6,txtX7,txtX8,txtX9,txtX10,txtX11,txtX12,txtX13,txtX14,txtX15,txtX16];
			arrPos = [p1, p2, p3, p4, p5, p6,p7,p8,p9,p10,p11,p12,p13,p14,p15,p16];
			
			line = new Shape();
			addChild(line);
			
			tl = new TimelineMax( { paused:true, onUpdate:drawLine } );
			
			
		}
		
		public function setNum(arr:Array, arr2:Array = null):void {
			
			
			
			arrNum = new Array;
			var arrNum2 = new Array;
			
			for (var key:String in arr) {
				arrNum.push(Number(arr[key].text));
				arrNum2.push(Number(arr[key].text));
				//trace(Number(arr[key].text));
			}
			
				
			for (key in arr2) {
				var str:String = arr2[key].text
				arrTxtX[key].text = str.substr(0, 4);
			}
			
		
			arrNum2.sort(Array.NUMERIC);
			
			var len:int = arrNum2.length;
			
			var max:Number = arrNum2[arrNum2.length - 1];
			trace(max);
			var min:Number = arrNum2[0];
			trace(min);
			var dis:Number = (max *10 - min*10) * 0.1 / 4 ;
			trace(dis);

			
			for (key in arrTxt) {
				arrTxt[key].text = String(Number(key)*dis+min);
			}
			
			for (key in arrNum) {	
				arrPos[key].y = 201.9 - arrNum[key] / (Number(txt6.text)) * 201.9 + 77;
			}
			
			mc.x = p1.x;
			mc.y = p1.y;
			
			tl.appendMultiple([
				TweenLite.to(mc, 1, { x:p2.x, y:p2.y } ),
				TweenLite.to(mc, 1, { x:p3.x, y:p3.y } ),
				TweenLite.to(mc, 1, { x:p4.x, y:p4.y } ),
				TweenLite.to(mc, 1, { x:p5.x, y:p5.y } ),
				TweenLite.to(mc, 1, { x:p6.x, y:p6.y } ),
				TweenLite.to(mc, 1, { x:p7.x, y:p7.y } ),
				TweenLite.to(mc, 1, { x:p8.x, y:p8.y } ),
				TweenLite.to(mc, 1, { x:p9.x, y:p9.y } ),
				TweenLite.to(mc, 1, { x:p10.x, y:p10.y } ),
				TweenLite.to(mc, 1, { x:p11.x, y:p11.y } ),
				TweenLite.to(mc, 1, { x:p12.x, y:p12.y } ),
				TweenLite.to(mc, 1, { x:p13.x, y:p13.y } ),
				TweenLite.to(mc, 1, { x:p14.x, y:p14.y } ),
				TweenLite.to(mc, 1, { x:p15.x, y:p15.y } )
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
