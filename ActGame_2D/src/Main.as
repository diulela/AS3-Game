package
{
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	
	import Core.Character.Monster;
	import Core.Character.WizPlayer;
	import Core.Controller.KeyController;
	import Core.Controller.MonsterController;
	import Core.Object.ActionObject;
	import Core.Scene.GameScene;
	
	public class Main extends Sprite
	{
		
	
		public function Main()
		{
			
			 var loader:Loader = new Loader();
			 var loaderContext:LoaderContext= new LoaderContext();
			 loader.load(new URLRequest("Asset/swcs/UI.swf"),loaderContext);
			 loader.contentLoaderInfo.addEventListener(Event.COMPLETE,onComplete);
			 
		}
		
	
		
		protected function onComplete(event:Event):void
		{
			
			
			var sence:GameScene = new GameScene(this.stage);
			addChild(sence);
			
			var ctrl:KeyController= new KeyController();
			var actObj:ActionObject = new WizPlayer(ctrl);
			actObj.x =200;
			actObj.y=300;
			actObj.speed=3;
			
			for(var i:int=1;i<=3;i++){
				var ctrl2:MonsterController= new MonsterController();
				var actObj2:ActionObject = new Monster(ctrl2,new EL_BOSS());
				actObj2.x =500-100*i;
				actObj2.y=300-0*i;
				actObj2.speed=10;
				actObj2.scaleX=-1;
			
				sence.addObject(actObj2);
				
			}
			
			
			sence.addObject(actObj);
			
		}
	}
}