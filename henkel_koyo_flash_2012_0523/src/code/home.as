package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TimerEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import com.greensock.TweenMax;
	import com.greensock.plugins.TransformAroundCenterPlugin; 
	import com.greensock.plugins.TweenPlugin;
	import flash.utils.Timer;
	import code.main;
	import flash.display.StageScaleMode;
	
	public class home extends MovieClip {
		
		private var barWidth:Number;
		private var phoArray:Array;
		private var totalPhotos:int = 5;
		private var current:Number;
		private var myTimer:Timer;
		
		public function home() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		private function init(e:Event=null):void {
		
			removeEventListener(Event.ADDED_TO_STAGE, init);
			 
			stage.scaleMode=StageScaleMode.NO_SCALE;
			 
			stage.displayState="fullScreen";
			 
			TweenPlugin.activate([TransformAroundCenterPlugin]);
			
			mainTitle.mouseChildren = false;
			
			mainTitle.buttonMode = false;
			
			phoArray = [pho1, pho2, pho3, pho4, pho5];
			
			for (var key:String in phoArray) {
				TweenMax.from(phoArray[key], .3, {autoAlpha:0, transformAroundCenter: { scale:0.8, rotationY:"45", x:"60" },delay:int(key) * 0.3});	
				TweenMax.to(phoArray[key].subImg, .3, { colorMatrixFilter: { saturation:0.1, brightness:0.8 }, blurFilter: { blurX:10, blurY:10 }, delay:int(key) * 0.3,onComplete:function() {}});
			}
			
				myTimer = new Timer(1500, 1);
				myTimer.addEventListener(TimerEvent.TIMER, onSetPhoHandle);
				myTimer.start();
				
		}
		private function onSetPhoHandle(e:TimerEvent):void 
		{
			for (var key:String in phoArray) {
				phoArray[key].id = key;
				phoArray[key].addEventListener(MouseEvent.CLICK, onClickHandle);
				phoArray[key].addEventListener(MouseEvent.ROLL_OVER, onOverHandle);
				phoArray[key].addEventListener(MouseEvent.ROLL_OVER, mouseStr);
				phoArray[key].addEventListener(MouseEvent.ROLL_OUT, mouseStr);
			}
		}
		private function onClickHandle(e:MouseEvent):void 
		{
			var strName:String = e.currentTarget.name;
			
			Mouse.cursor = MouseCursor.ARROW;
			
			for (var key:String in phoArray) {
				phoArray[key].removeEventListener(MouseEvent.CLICK, onClickHandle);
				phoArray[key].removeEventListener(MouseEvent.ROLL_OVER, onOverHandle);
				phoArray[key].removeEventListener(MouseEvent.ROLL_OUT, mouseStr);
				phoArray[key].removeEventListener(MouseEvent.ROLL_OVER, mouseStr);
				TweenMax.to(phoArray[key], .3, { autoAlpha:0, transformAroundCenter: { scale:0.8, rotationY:"45", x:"60" }, delay:int(key) * 0.3 } );	
			}
			TweenMax.to(mainTitle, .5, { autoAlpha:0, y:"80" , delay:1.8 } );
			var mc:MovieClip = new main();
				mc.alpha = 0;
				mc.visible = false;
				addChild(mc);
			TweenMax.to(mc, 1, { autoAlpha:1, delay:2 , onComplete:function() {
				switch(strName) {
				case "pho1":
					mc.setAni(0);
					break;
				case "pho2":
					mc.setAni(1);
					break;
				case "pho3":
					mc.setAni(2);
					break;
				case "pho4":
					mc.setAni(3);
					break;
				case "pho5":
					mc.setAni(4);
					break;	
				}

				for ( key in phoArray) {
					removeChild(phoArray[key]);
						phoArray[key] = null;
				}
				
				}});
		}
		private function onOverHandle(e:MouseEvent):void {
			
			var mc:MovieClip = e.currentTarget as MovieClip;
			barWidth = Math.ceil((999 - 309) / (totalPhotos - 1));
			current = e.target.id
			var newX:Number;
				for (var arrayNum :int = 0; arrayNum < phoArray.length; arrayNum++) {
						if (arrayNum < current) {
							newX = arrayNum * barWidth;
						}
						else{
							newX = 309 + (arrayNum - 1) * barWidth;
						}
						if(arrayNum == current) {
							newX = arrayNum * barWidth;
							TweenMax.to(phoArray[arrayNum].subMask, .3, { width:309 } );
							TweenMax.to(phoArray[arrayNum].mainTitle, .3, { alpha:1 } );		
							TweenMax.to(phoArray[arrayNum].subTitle, .3, { alpha:0 } );					
							TweenMax.to(phoArray[arrayNum].subImg, .3, { colorMatrixFilter: { saturation:1, brightness:1 }, blurFilter: { blurX:0, blurY:0 } } );	
						}else{
							TweenMax.to(phoArray[arrayNum].subTitle, .3, { alpha:1 } );
							TweenMax.to(phoArray[arrayNum].subMask, .3, { width:170 } );
							TweenMax.to(phoArray[arrayNum].mainTitle, .3, { alpha:0 } );	
							TweenMax.to(phoArray[arrayNum].subImg, .3, { colorMatrixFilter: { saturation:0.1, brightness:0.8 }, blurFilter: { blurX:10, blurY:10 }} );
						}
						
						TweenMax.to(phoArray[arrayNum], .3, { x: newX } );
				}
		}
		private function mouseStr(e:Event):void {
			var str:String = e.type;
			switch(str) {
				case "rollOut":
					Mouse.cursor = MouseCursor.ARROW;
					for(var i:int = 0; i < phoArray.length; i++){
						TweenMax.to(phoArray[i].subImg, .3, { colorMatrixFilter: { saturation:0.1, brightness:0.8 }, blurFilter: { blurX:10, blurY:10 }} );	
						TweenMax.to(phoArray[i].mainTitle, .3, { alpha:0 } );	
						TweenMax.to(phoArray[i], .3, { x:5 + i * 197.8 } );
						TweenMax.to(phoArray[i].subMask, .3, { width:197.8 } );
						TweenMax.to(phoArray[i].subTitle, .3, { alpha:1} );
					}
				break;
				case "rollOver":
					Mouse.cursor = MouseCursor.BUTTON;
				break;
			}
		}
	}
	
}
