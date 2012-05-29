package code
{
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.events.MouseEvent;
	import flash.ui.Mouse;
	import flash.ui.MouseCursor;
	
	
	public class  normal extends MovieClip {
		
		private var arrTextFrame:Array;
		private var arrProFrame:Array;
		
		public function normal() {
			if (stage) {
				init();
			}else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}
		private function init(e:Event=null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			setText();
		}
		private function setText():void {
			arrTextFrame = [pr1, pr2, pr3, pr4, pr5, pr6, pr7, pr8];
			arrProFrame = [pro1, pro2, pro3, pro4, pro5, pro6, pro7, pro8];
			
			for (var key:String in arrProFrame) {
				arrProFrame[key].setDis(2);
				arrProFrame[key].addEventListener(TChangeEvent.TCHANGE, onTChangeHandle);
			}
			
			for(key in arrTextFrame) {
				arrTextFrame[key].addEventListener(Event.CHANGE,onTextInputHandle);
			}
			
			btnResult.addEventListener(MouseEvent.CLICK,onResultHandle);
			btnResult.addEventListener(MouseEvent.ROLL_OVER, onRollHandle);
			btnResult.addEventListener(MouseEvent.ROLL_OUT, onRollHandle);
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
		private function onResultHandle(e:MouseEvent):void {
			resFinal.text = String(Math.round(Number(pre4.text) * Number(txtPic.text) * Number(txtDay.text)*100000)/100000);	
			var rot:Number = Number(pre4.text) * Number(txtPic.text) * Number(txtDay.text);
			mainTime.setRot(rot);
		}
		private function onChangeHandle(e:Event):void{
				
		}
		private function onTChangeHandle(e:TChangeEvent):void {
			var strName:String = e.currentTarget.name;
			strName = strName.substr(3, 1);
			setRes(strName);
		}
		private function onTextInputHandle(e:Event):void {	
			var strName:String = e.currentTarget.name;
			strName = strName.substr(2, 1);
			trace(strName);
			setRes(strName);
		}
		private function getRes(mc:TextField, Nprc:Number, Npro:Number):void {
			trace(Math.round(Nprc / 1000 * Npro * 100000) / 10000);
			var result:String = String(Math.round(Nprc / 1000 * Npro * 100000) / 100000);
			mc.text = result;
		}
		private function setRes(str:String):void {
			var rot:int;
			switch(str) {
				case "1":
					getRes(re1, Number(pr1.text), pro1.getNum());					
					rot = ((Number(pro5.getNum()) - Number(pro1.getNum())) / Number(pro1.getNum())) * 360;
					trace(rot);
					subTime1.setRot(rot);
					break;
				case "2":
					getRes(re2, Number(pr2.text), pro2.getNum());
					rot =((Number(pro6.getNum()) - Number(pro2.getNum())) / Number(pro2.getNum())) * 360;
					subTime2.setRot(rot);
					break;
				case "3":
					getRes(re3, Number(pr3.text), pro3.getNum());
					rot =((Number(pro7.getNum()) - Number(pro3.getNum())) / Number(pro3.getNum())) * 360;
					subTime3.setRot(rot);
					break;
				case "4":
					getRes(re4, Number(pr4.text), pro4.getNum());
					rot =((Number(pro8.getNum()) - Number(pro4.getNum())) / Number(pro4.getNum())) * 360;
					subTime4.setRot(rot);					
					break;
				case "5":
					getRes(re5, Number(pr5.text), pro5.getNum());
					rot =((Number(pro5.getNum()) - Number(pro1.getNum())) / Number(pro1.getNum())) * 360;
					subTime1.setRot(rot);
					break;
				case "6":
					getRes(re6, Number(pr6.text), pro6.getNum());
					rot =((Number(pro6.getNum()) - Number(pro2.getNum())) / Number(pro2.getNum())) * 360;
					subTime2.setRot(rot);
					break;
				case "7":
					getRes(re7, Number(pr7.text), pro7.getNum());
					rot =((Number(pro7.getNum()) - Number(pro3.getNum())) / Number(pro3.getNum())) * 360;
					subTime3.setRot(rot);
					break;
				case "8":
					getRes(re8, Number(pr8.text), pro8.getNum());
					rot =((Number(pro8.getNum()) - Number(pro4.getNum())) / Number(pro4.getNum())) * 360;
					subTime4.setRot(rot);
					break;
			}
			
			res1.text = String(Math.round((Number(re1.text) + Number(re2.text) + Number(re3.text) + Number(re4.text))*100000)/100000);
			res2.text = String(Math.round((Number(re5.text) + Number(re6.text) + Number(re7.text) + Number(re8.text))*100000)/100000);
			
			pre4.text = String(Math.round((Number(res2.text) - Number(res1.text))*100000)/100000);
			pre5.text = String(Math.round(Number(pre4.text) / Number(res1.text) * 100)) + "(%)" ;
		}
	}
}