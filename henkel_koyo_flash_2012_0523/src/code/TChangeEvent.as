package code{
	import flash.events.Event;
	public class TChangeEvent extends Event {
		public static const TCHANGE:String="TCHANGE";
		public function TChangeEvent(eventType:String,bubbles:Boolean = false, cancelable:Boolean = false){
			super(eventType,bubbles,cancelable);
		}
	}
}