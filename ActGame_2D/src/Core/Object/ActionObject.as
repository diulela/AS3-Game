package Core.Object
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	
	import Core.Common.Global;
	import Core.Controller.BasicController;

	public class ActionObject extends GameObjectBase
	{
		//速度
	    protected var moveSpeed:Number=1.2;
		
		protected var walkDirection:uint=0
			
		public static const UP:uint = 1;
		public static const DOWN:uint = 2;
		public static const LEFT:uint = 3;
		public static const RIGHT:uint = 4;
		
		private var _instance:Sprite;
		
		/**
		 * 控制器
		 */
		protected var controller:BasicController;
		
		
		public function ActionObject(ctrl:BasicController, instance:Sprite)
		{
			controller = ctrl;
			controller.target = this;  
			_instance =instance;
			addChild(_instance);
			
		}
		
		/**
		 * 修改移动方向
		 */
		public function set direction(dir:uint):void
		{
			walkDirection = dir;
		}
		
		public function set speed(dir:uint):void{
			moveSpeed = dir;
		}
		
		public function get nextCanMove():Boolean
		{
			// 下一X位置
			var nx:uint = 0;
			// 下一Y位置
			var ny:uint = 0;
			// 根据移动方向进行处理，计算出下一目标点位置
			switch(walkDirection)
			{
				case UP:
					ny = y-moveSpeed;
					break;
				case DOWN:
					ny = y+moveSpeed;
					break;
				case LEFT:
					nx = x-moveSpeed;
					break;
				case RIGHT:
					nx = x+moveSpeed;
					break;
				default:break;
			}
			
			// 如果下一目标点超出屏幕范围，则不能移动
			if (nx > Global.stage.stageWidth-50 || nx < 0) return false;
			if (ny > Global.stage.stageHeight-50 || ny < 0) return false;
			
			// 检测通过
			return true;
		}
		
		protected function move():void
		{
			if (!nextCanMove) return;
			
			// 根据不同的方向进行移动
			switch(walkDirection)
			{
				case UP:
					y -= moveSpeed;
					
					break;
				case DOWN:
					y += moveSpeed;
					break;
				case LEFT:
					x -= moveSpeed;
					scaleX=-1;
					break;
				case RIGHT:
					x += moveSpeed;
					scaleX=1;
					break;
				default:break;
			}
		}
		
		/**
		 * 覆盖父类的Do方法
		 */
		override public function Do():void
		{
			if (walkDirection != 0){ 
				
				move();
			}
			
			
			
			super.Do();
		}
		
		override public function Die():void
		{
			controller.die(); //当自己被删除的时候，通知控制器卸载侦听，以释放内存
		}
	
	}
}