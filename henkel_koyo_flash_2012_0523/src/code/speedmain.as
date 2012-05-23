package code {
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import code.ScrollBar;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	import com.greensock.TweenMax;
	
	
	public class speedmain extends MovieClip {
		private var arrTextFrame:Array;
		private var arrRate:Array;
		private var arrCot:Array;
		private var arrPcot:Array;
		private var arrCost:Array;
		private var mc:MovieClip;
		public function speedmain() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		
		private function init(e:Event=null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			setText();
			
			
		}
		
		private function onChangContentHandle(e:MouseEvent):void 
		{
			
		}
		private function setText():void {
			
			arrTextFrame = [speedTxt2, speedTxt3, speedTxt4, speedTxt5, speedTxt6];
			arrRate = [0.8,0.6,0.4,0.2,0.1];
			arrCot = [cot1, cot2, cot3, cot4, cot5, cot6];
			arrPcot = [pcot1, pcot2, pcot3, pcot4 , pcot5, pcot6];
			
			arrCost = [cost2, cost3, cost4, cost5, cost6];
			
			for(var key:String in arrCot) {
				arrCot[key].setDis(2);
				
			}
			
			mainline1.setDis(50, 227);
			//mainline2.setDis(50, 185);
			allCot1.addEventListener(Event.CHANGE,onAllCotHandle);
			speedTxt1.addEventListener(Event.CHANGE, onTextInputHandle);
			mainline1.addEventListener(TChangeEvent.TCHANGE, onTChangeHandle);
			mainline2.addEventListener(Event.CHANGE, onT2ChangeHandle);
			btnResult.addEventListener(MouseEvent.CLICK, onClickHandle);
			
			btnResult.addEventListener(MouseEvent.ROLL_OUT, onRollHandle);
			btnResult.addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
			
			
			btnResultMap.addEventListener(MouseEvent.CLICK, onMapHandle);
			btnResultMap.addEventListener(MouseEvent.ROLL_OUT, onRollHandle);
			btnResultMap.addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
		}
		
		private function onMapHandle(e:MouseEvent):void 
		{
			 if(mc == null){
				mc = new drawmap();
				var arrX:Array = [int(speedTxt1.text), int(speedTxt2.text), int(speedTxt3.text), 
								 int(speedTxt4.text), int(speedTxt5.text), int(speedTxt6.text)];
				
				var arrY:Array = [cot1.getNum(), cot2.getNum(), cot3.getNum(),
								  cot4.getNum(), cot5.getNum(), cot6.getNum()];
				
				mc.x = 100;
				mc.y = 242;
				
				addChild(mc);
				
				mc.setNum(arrY, arrX);
				mc.btnClose.addEventListener(MouseEvent.CLICK, onCloseMapHandle);
				mc.btnClose.addEventListener(MouseEvent.ROLL_OUT,onRollHandle);
				mc.btnClose.addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
			 }
		}
		private function onCloseMapHandle(e:MouseEvent):void {
			TweenMax.to(mc, .5, { autoAlpha:0, onComplete:function() {
					removeChild(mc);
					mc = null;
				}});
		}
		private function onT2ChangeHandle(e:Event):void {
			cost2.text = String((Number(prcot2.text) * Number(allCot2.text) * Number(mainline2.text)));		
			cost3.text = String((Number(prcot3.text) * Number(allCot3.text) * Number(mainline2.text)));
			cost4.text = String((Number(prcot4.text) * Number(allCot4.text) * Number(mainline2.text)));
			cost5.text = String((Number(prcot5.text) * Number(allCot5.text) * Number(mainline2.text)));
			cost6.text = String((Number(prcot6.text) * Number(allCot6.text) * Number(mainline2.text)));
		}
		private function onClickHandle(e:MouseEvent):void 
		{
			
			var res:Number=0;
			
			for (var key:String in arrCost) {
				//trace(arrCost[key].text);
				res += Number(arrCost[key].text);
				//trace(res);
			}
			FinalRes.text = String(res);
		}
		private function onTChangeHandle(e:TChangeEvent):void 
		{
			for(var key:String in arrPcot) {
				arrPcot[key].text = mainline1.getNum() / 1000 * Number(arrCot[key].getNum());
			}
			
			prcot2.text = String(Number(pcot2.text) - Number(pcot1.text));
			prcot3.text = String(Number(pcot3.text) - Number(pcot1.text));
			prcot4.text = String(Number(pcot4.text) - Number(pcot1.text));
			prcot5.text = String(Number(pcot5.text) - Number(pcot1.text));
			prcot6.text = String(Number(pcot6.text) - Number(pcot1.text));
			
			
			per1.text =  String(Number( prcot2.text) / Number(pcot1.text)*100) + "%";
			per2.text =  String(Number( prcot3.text) / Number(pcot1.text)*100) + "%";
			per3.text =  String(Number( prcot4.text) / Number(pcot1.text)*100) + "%";
			per4.text =  String(Number( prcot5.text) / Number(pcot1.text)*100) + "%";
			per5.text =  String(Number( prcot6.text) / Number(pcot1.text)*100) + "%";
			
			
			perline1.setRot(Number( prcot2.text) / Number(pcot1.text));
			perline2.setRot(Number( prcot3.text) / Number(pcot1.text));
			perline3.setRot(Number( prcot4.text) / Number(pcot1.text));
			perline4.setRot(Number( prcot5.text) / Number(pcot1.text));
			perline5.setRot(Number( prcot6.text) / Number(pcot1.text));
		
		}
		
		private function onAllCotHandle(e:Event):void 
		{
				allCot2.text = String(Number(perd2.text)*Number(allCot1.text)/100);
				allCot3.text = String(Number(perd3.text)*Number(allCot1.text)/100);;
				allCot4.text = String(Number(perd4.text)*Number(allCot1.text)/100);;
				allCot5.text = String(Number(perd5.text)*Number(allCot1.text)/100);;
				allCot6.text = String(Number(perd6.text)*Number(allCot1.text)/100);;
				
		}
		private function onTextInputHandle(e:Event):void 
		{
			for(var key:String in arrTextFrame) {
				arrTextFrame[key].text = int(speedTxt1.text) * arrRate[key];
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
