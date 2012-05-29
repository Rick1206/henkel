package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import com.greensock.TweenMax;
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	public class main extends MovieClip {
		
	
		private var navArray:Array;
		private var mainArray:Array;
		public function main() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event=null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			navArray = [nav1, nav2, nav3, nav4, nav5];
			mainArray = [main1, main2, main3,main4,main5];
			
			for (var key:String in mainArray) {
				mainArray[key].visible = false;
			}
			for (key in navArray) {
				navArray[key].addEventListener(MouseEvent.CLICK, onNavChangeHandle);
				navArray[key].addEventListener(MouseEvent.ROLL_OUT, onRollHandle);
				navArray[key].addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
			}
			//setAni(1);
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
		private function onNavChangeHandle(e:MouseEvent):void 
		{
			
			var str:String = e.currentTarget.name;
			switch(str) {
				case "nav1":
					NavChange(0);
					break;
				case "nav2":
					NavChange(1);
					break;
				case "nav3":
					NavChange(2);
					break;
				case "nav4":
					NavChange(3);
					break;
				case "nav5":
					NavChange(4);
					break;
			}
			
		}
		private function NavChange(num:int):void 
		{
			var nlen:int = navArray.length;
			for (var i:int = 0; i < nlen; i++) {
				var t:int;
				
				navArray[i].removeEventListener(MouseEvent.CLICK, onNavChangeHandle);
					TweenMax.to(navArray[i], .3, { alpha:0, x:String(navArray[i].width-0.8), onComplete:function() {
					navArray[t].gotoAndStop(1);
					t++;
					}});
			}
			var	mytimer:Timer = new Timer(300, 1);
			mytimer.addEventListener(TimerEvent.TIMER, onNavStartHandle);
			mytimer.start();
			function onNavStartHandle(e:TimerEvent):void 
			{
				setAni(num);
				mytimer.stop();
				mytimer = null;
				
			}
			
		}

		public function setAni(num:int):void {
			var nlen:int = navArray.length;
			var curY:int = 8;
			for (var i:int = 0; i < nlen; i++) {
				if (i == num) {
					navArray[i].gotoAndStop(2);
				}
				navArray[i].x = 129.85;
				navArray[i].y = curY;
				curY += navArray[i].height + 12;
				//trace(curY);
			}
			
			for (i = 0; i < nlen; i++) {
				
				if (i == num) {
					navArray[i].gotoAndStop(2);
					TweenMax.to(navArray[i], .3, {alpha:1, x:"-122",delay:i*.3});
				}else {
					TweenMax.to(navArray[i],.3,{alpha:1,x:"-80",delay:i*.3});
				}
			
			}
			for (i = 0 ; i < mainArray.length; i++) {
				if (i == num) {
					TweenMax.to(mainArray[i], .3, {autoAlpha:1});
				}else {
					TweenMax.to(mainArray[i], .3, {autoAlpha:0});
				}
			
			}
			
			var subtimer:Timer = new Timer(1500, 1);
				subtimer.addEventListener(TimerEvent.TIMER, onNavStartHandle);
				subtimer.start();
			function onNavStartHandle(e:TimerEvent):void 
			{
				for (var key:String in navArray) {
					navArray[key].addEventListener(MouseEvent.CLICK, onNavChangeHandle);
					trace(key);
				}
				
				subtimer.stop();
				subtimer = null;
				
			}
		
		}
	}
	
}
