package Core.Character
{
	import flash.display.Sprite;
	
	import Core.Controller.BasicController;
	import Core.Controller.MonsterController;
	import Core.Object.ActionObject;
	
	public class Monster extends ActionObject
	{
		
		/**
		 * 上一次的运行日期对象
		 */
		private var _lastAction:Date=new Date();
		
		/**
		 * 运行频率
		 */
		private var _fps:uint = 8;
		
		
		public function Monster(ctrl:MonsterController,instance:Sprite)
		{
			super(ctrl, instance);
			direction = 1+int(Math.random() * 4);
		
		}
		
		override public function Do():void
		{
			var date:Date = new Date();
			// 如果运行时间已经超过频率所指定的时间间隔，那么运行程序
			if (date.time-_lastAction.time > 1000/_fps)
			{
				_lastAction = date;
				controller.AutoRun();
				super.Do();
			}
		}
	}
}