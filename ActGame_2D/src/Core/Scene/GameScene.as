package Core.Scene
{
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	
	import Core.Object.GameObjectBase;
	import Core.Common.Global;
	
	
	
	//游戏场景
	public class GameScene extends Sprite
	{
		
		/**
		 * 舞台中的对象列表
		 */
		protected var objectList:Array;
		
		public function GameScene(_stage:Stage)
		{
			//TODO: implement function
			super();
			Global.stage = _stage;
			objectList = new Array();
			Global.stage.addEventListener(Event.ENTER_FRAME, render);
		}
		
		protected function render(event:Event):void
		{
			// TODO Auto-generated method stub
			for each(var obj:GameObjectBase in objectList) obj.Do();
		}
		
		/**
		 * 向游戏世界中增加新的游戏对象
		 * @param        obj
		 */
		public function addObject(obj:GameObjectBase):void
		{
			if (objectList.indexOf(obj) != -1) return; // 不重复添加
			objectList.push(obj);
			addChild(obj);
		}
		
		/**
		 * 从游戏世界中删除游戏对象
		 * @param        obj
		 */
		public function removeObject(obj:GameObjectBase):void
		{
			var id:int = objectList.indexOf(obj);
			if (id == -1) return;
			objectList.splice(id,1);
			removeChild(obj);
			obj.Die();
		}
	}
}