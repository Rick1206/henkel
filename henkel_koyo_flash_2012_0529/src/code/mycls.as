package code {
	
	public class  mycls {
		

		public function mycls() {
			
		}
		
		public static  function myRound(num:Number, reg:Number ):String {

			var res:Number = Math.round( num / reg ) / (1 / reg);
			
			return res.toString();
			
		}
	}
}