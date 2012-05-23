package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import com.greensock.TweenMax;
	import code.drawmap2;
	import flash.events.TextEvent;
	import flash.utils.setTimeout;
	
	public class subMasked5 extends MovieClip {
		private var numMin:Number;
		private var numMax:Number;
		private var numSample:Number;
		private var numSpace:Number;
		
		private var arrSpedTxt:Array;
		private var arrRateTxt:Array;
		private var arrAmoTxt:Array;
		private var arrAmoRateTxt:Array;
		
		private var arrLineSpdTxt:Array;
		
		private var arrLineSpaceTxt:Array;
		
		private var mc:MovieClip;
		
		
		public function subMasked5() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function onMapHandle(e:MouseEvent):void 
		{
			if (mc == null) {
				var str:String = e.currentTarget.name;
				
				mc = new drawmap2();
				if (str == "btnMap2") {
					mc.contxtX.text = "用胶量比率";
					mc.contxtY.text = "泵速比率";
					
				var arrX:Array = arrRateTxt;
				var arrY:Array = arrAmoRateTxt;
				
					
				}else {
				
					arrX = [sped1, sped2, sped3, sped4, sped5, sped6, sped7, sped8, sped9, sped10, sped11, sped12, sped13, sped14, sped15];
					
					arrY = [amount, amount1, amount2, amount3, amount4, amount5, amount6, amount7, amount8, amount9, amount10, amount11, amount12, amount13, amount14];
					
					
				}
			
				mc.x = 100;
				mc.y = 280;
				
				addChild(mc);
				
				mc.setNum(arrY, arrX);
				mc.btnClose.addEventListener(MouseEvent.CLICK, onCloseMapHandle);
				mc.btnClose.addEventListener(MouseEvent.ROLL_OUT,onRollHandle);
				mc.btnClose.addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
			 }
		}
		
		private function onCloseMapHandle(e:MouseEvent):void
		{
			TweenMax.to(mc, .5, { autoAlpha:0, onComplete:function() {
					removeChild(mc);
					mc = null;
				}});
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
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			mainLine.setDis(3000, 454);
			minNum.setDis(100);
			maxNum.setDis(100);
			
			
			minNum.addEventListener(TChangeEvent.TCHANGE, onMinChangeHandle);
			
			cotNum.addEventListener(Event.CHANGE, onCotInputHandle);
			
			arrSpedTxt = [sped2, sped3, sped4, sped5, sped6, sped7, sped8, sped9, sped10, sped11, sped12, sped13, sped14, sped15, sped16];
			
			arrRateTxt = [rate1, rate2, rate3, rate4, rate5, rate6, rate7, rate8, rate9, rate10, rate11, rate12, rate13, rate14, rate15];
			
			arrAmoTxt = [amount1, amount2, amount3, amount4, amount5, amount6, amount7, amount8, amount9, amount10, amount11, amount12, amount13, amount14, amount15];
			
			arrAmoRateTxt = [amoRate1, amoRate2, amoRate3, amoRate4, amoRate5, amoRate6, amoRate7, amoRate8, amoRate9, amoRate10, amoRate11, amoRate12, amoRate13, amoRate14, amoRate15];
			
			arrLineSpdTxt = [lineSpd1, lineSpd2, lineSpd3, lineSpd4, lineSpd5, lineSpd6, lineSpd7, lineSpd8, lineSpd9, lineSpd10, lineSpd11, lineSpd12, lineSpd13, lineSpd14];
							 
			arrLineSpaceTxt = [lineSpace1, lineSpace2, lineSpace3, lineSpace4, lineSpace5, lineSpace6, lineSpace7, lineSpace8, lineSpace9, lineSpace10, lineSpace11, lineSpace12 , lineSpace13, lineSpace14];
			
							 
			for (var key:String in arrAmoTxt) {
				arrAmoTxt[key].addEventListener(Event.CHANGE, onAmoInputHandle);
			}
		
			btnMap.addEventListener(MouseEvent.CLICK, onMapHandle);
			btnMap.addEventListener(MouseEvent.ROLL_OUT, onRollHandle);
			btnMap.addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
			
			btnMap2.addEventListener(MouseEvent.CLICK, onMapHandle);
			btnMap2.addEventListener(MouseEvent.ROLL_OUT, onRollHandle);
			btnMap2.addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
			
			btnResult.addEventListener(MouseEvent.CLICK, onCotInputHandle);
			btnResult.addEventListener(MouseEvent.ROLL_OUT, onRollHandle);
			btnResult.addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
			
		}
		private function onAmoInputHandle(e:Event):void 
		{
			var amo:Number = Number(amount.text);
			trace(amo);
			var arrLen:int = arrAmoRateTxt.length;
			var res:Number = 0;
			for (var i:int = 0; i < arrLen; i++ ) {
				res = Number(arrAmoTxt[i].text) - amo;
				if (res>0) {
					arrAmoRateTxt[i].text =  mycls.myRound(res/amo, 0.01);
				}else {
					arrAmoRateTxt[i].text = "";
				}
			}
		}
		private function onCotInputHandle(e:Event):void 
		{
			
			
			numSample = Number(cotNum.text);
			
			if (numSample > 15 || isNaN(numSample) ) {
				cotNum.text = "请输入正确数值!";
				setTimeout(function() {
					cotNum.text = "";
					},1000);
				return;
			}
			
			
			numSpace  = (maxNum.getNum() - minNum.getNum()) / Number(cotNum.text);
			
			//cotSpace.text = String((maxNum.getNum() - minNum.getNum()) / Number(cotNum.text));
			
			cotSpace.text = mycls.myRound(numSpace, 0.1);
			
			var arrLen:int = arrSpedTxt.length;
			var res:Number = 0;
			for (var i:int = 0; i < arrLen; i++ ) {
				if (numSample - (i + 1) >= 0) {
					
					res  = numMin + (numSample-(numSample-(i + 1))) * numSpace;
					
					if (isNaN(res)) return;
					
					arrSpedTxt[i].text = String(res);
					
					//arrRateTxt[i].text = String((res - numMin) / numMin);
					
					arrRateTxt[i].text = mycls.myRound((res - numMin) / numMin, 0.001);
				}else {
					arrSpedTxt[i].text = "";
					arrRateTxt[i].text = "";
				}
				
			}
			
			var arrLen2:int = arrLineSpdTxt.length;
			var res2:Number = 0;
			var t:int = 0;
			for ( i = 0; i < arrLen2; i++ ) {
				
				if (arrSpedTxt[i + 1].text != "") {
					
					res2 += Number(mycls.myRound((Number(arrAmoRateTxt[i + 1].text) - Number(arrAmoRateTxt[0].text)) / ( Number(arrRateTxt[i + 1].text) - Number(arrRateTxt[0].text)),0.0001));
				
					arrLineSpdTxt[i].text = mycls.myRound((Number(arrAmoRateTxt[i + 1].text) - Number(arrAmoRateTxt[0].text)) / ( Number(arrRateTxt[i + 1].text) - Number(arrRateTxt[0].text)), 0.01);
					
					t++;
					
				}else {
					arrLineSpdTxt[i].text = "";
				}
			}
			
			//allLineTxt.text = String(res2 / t);
			
			if (t!=0) {
				allLineTxt.text = mycls.myRound(res2 / t , 0.0001);
			}
			
			arrLen2 = arrLineSpaceTxt.length;						
			t = 0;
			res2 = 0;
			for ( i = 0; i < arrLen2; i++ ) {
				
				if (arrSpedTxt[i + 1].text != "") {
									
					res2 +=  Number(mycls.myRound((Number(arrAmoRateTxt[0].text) + Number(arrAmoRateTxt[i+1].text) - Number(arrLineSpdTxt[i].text) * (Number( arrRateTxt[0].text) + Number(arrRateTxt[i + 1].text))) / 2,0.0001));
								
					arrLineSpaceTxt[i].text = mycls.myRound((Number(arrAmoRateTxt[0].text) + Number(arrAmoRateTxt[i+1].text) - 
											  Number(arrLineSpdTxt[i].text) * ( Number( arrRateTxt[0].text) + Number(arrRateTxt[i + 1].text) ) ) / 2,0.01);
					t++;
				}else {
					
						arrLineSpaceTxt[i].text  = "";
						
				}
			}
			
			if (t!=0) {
				allLineTxt2.text = mycls.myRound(res2 / t, 0.0001);
			}
		}
		private function onMinChangeHandle(e:TChangeEvent):void 
		{
			numMin = minNum.getNum();
			
			sped1.text = String(numMin);
			
			var res:Number=0;
			
		}
	}
	
}
