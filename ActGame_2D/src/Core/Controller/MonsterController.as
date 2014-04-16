package Core.Controller
{
	import Core.Object.ActionObject;

	public class MonsterController extends BasicController
	{
		public function MonsterController()
		{
			super();
		}
		
		override public function AutoRun():void
		{
			var me:ActionObject = _target as ActionObject;
		
			if (!me.nextCanMove) 
				changeDir();
		}
		
		private function changeDir():void
		{
		
			var me:ActionObject = _target as ActionObject;
			me.direction=(1+int(Math.random() * 4));
		
		
		}
	}
}