package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import com.greensock.TweenMax;
	import code.drawmap2;
	
	public class ratemain extends MovieClip {
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
		
		public function ratemain() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			mainLine.setDis(15, 454);
			minNum.setDis(2);
			maxNum.setDis(5);
			
			
			minNum.addEventListener(TChangeEvent.TCHANGE, onMinChangeHandle);
			
			cotNum.addEventListener(Event.CHANGE, onCotInputHandle);
			
			arrSpedTxt = [sped2,sped3,sped4,sped5,sped6,sped7,sped8,sped9,sped10,sped11,sped12,sped13,sped14,sped15];
			arrRateTxt = [rate1, rate2, rate3, rate4, rate5, rate6, rate7, rate8, rate9, rate10, rate11, rate12, rate13, rate14];
			
			arrAmoTxt = [amount1, amount2, amount3, amount4, amount5, amount6, amount7, amount8, amount9,amount10,amount11,amount12,amount13,amount14];
			
			arrAmoRateTxt = [amoRate1, amoRate2, amoRate3, amoRate4, amoRate5, amoRate6, amoRate7, amoRate8, amoRate9, amoRate10
							,amoRate11,amoRate12,amoRate13,amoRate14];
			
			arrLineSpdTxt = [lineSpd1, lineSpd2, lineSpd3, lineSpd4, lineSpd5, lineSpd6, lineSpd7, lineSpd8,
							 lineSpd9,lineSpd10,lineSpd11,lineSpd12,lineSpd13];
			
							 
			arrLineSpaceTxt = [lineSpace1, lineSpace2, lineSpace3, lineSpace4, lineSpace5,
								lineSpace6,lineSpace7,lineSpace8,lineSpace9,lineSpace10,lineSpace12];
							 
			for (var key:String in arrAmoTxt) {
				arrAmoTxt[key].addEventListener(Event.CHANGE, onAmoInputHandle);
			}
			
			
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
					arrAmoRateTxt[i].text = String(res/amo);
				}else {
					arrAmoRateTxt[i].test = "";
				}
			}
		}
		private function onCotInputHandle(e:Event):void 
		{
			
			numSpace  = (maxNum.getNum() - minNum.getNum()) / Number(cotNum.text);
			cotSpace.text = String((maxNum.getNum() - minNum.getNum()) / Number(cotNum.text));
			numSample = Number(cotNum.text);
			
			
			
			var arrLen:int = arrSpedTxt.length;
			var res:Number = 0;
			for (var i:int = 0; i < arrLen; i++ ) {
				if (numSample - (i + 1) >= 0) {
					
					res  = numMin + (numSample-(numSample-(i + 1))) * numSpace;
					arrSpedTxt[i].text = String(res);
					arrRateTxt[i].text = String((res - numMin)/numMin);
				}else {
					arrSpedTxt[i].text = "";
					arrRateTxt[i].text = "";
				}
				
			}
			
			var arrLen2:int = arrLineSpdTxt.length;
			var res2:Number = 0;
			var t:int = 0;
			for ( i = 0; i < arrLen2; i++ ) {
				
				if (arrSpedTxt[i+1].text != "") {
					res2 += (Number(arrAmoRateTxt[i + 1].text) - Number(arrAmoRateTxt[0].text)) / ( Number(arrRateTxt[i + 1].text) - Number(arrRateTxt[0].text));
					arrLineSpdTxt[i].text = String((Number(arrAmoRateTxt[i + 1].text) - Number(arrAmoRateTxt[0].text)) / ( Number(arrRateTxt[i + 1].text) - Number(arrRateTxt[0].text)));
					t++;
				}else {
					arrLineSpdTxt[i].text = "";
				}
			}
			
			allLineTxt.text = String(res2 / t);
		
			
			arrLen2 = arrLineSpaceTxt.length;						
			t = 0;
			res2 = 0;
			for ( i = 0; i < arrLen2; i++ ) {
				
				if (arrSpedTxt[i + 1].text != "") {
					res2 +=  (Number(arrAmoRateTxt[0].text) + Number(arrAmoRateTxt[i+1].text) - 
							Number(arrLineSpdTxt[i].text) * ( Number( arrRateTxt[0].text) + Number(arrRateTxt[i + 1].text) ) ) / 2;
				
					arrLineSpaceTxt[i].text = String((Number(arrAmoRateTxt[0].text) + Number(arrAmoRateTxt[i+1].text) - 
													Number(arrLineSpdTxt[i].text) * ( Number( arrRateTxt[0].text) + Number(arrRateTxt[i + 1].text) ) ) / 2);
					t++;
				}else {
						arrLineSpaceTxt[i].text  = "";
				}
			}
			allLineTxt2.text = String(res2 / t);
		}
		private function onMinChangeHandle(e:TChangeEvent):void 
		{
			numMin = minNum.getNum();
			
			sped1.text = String(numMin);
			
			var res:Number=0;
			
		}
		
	}
}
