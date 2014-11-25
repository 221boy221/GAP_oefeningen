package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Berend Weij   (Boy & Justin)
	 */
	public class Main extends Sprite 
	{
		
		private var _paraglider : Paraglider;
		private var _waypoints : Array = [];
		private var _waypoint : Point;
		private var index : int = 0;
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			
			_paraglider = new Paraglider();
			
			addChild(_paraglider);
			
			stage.addEventListener(MouseEvent.CLICK, setTarget);
			addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function setTarget(e:MouseEvent):void 
		{
			spawnWaypoint(e);
			for (var i:uint = 0; i < _waypoints.length; i++)
			{
				_paraglider.setTarget( new Vector2D(_waypoints[index].x, _waypoints[index].y) );
				
			}
			if (_paraglider._velocity.length > 1)
			{
				index++;
				trace(index);
			}
			
		}
		
		private function spawnWaypoint(e:MouseEvent):void 
		{
			_waypoint = new Point(e.stageX, e.stageY);
			_waypoints.push(_waypoint);
		}
		
		private function update(e : Event) : void
		{
			_paraglider.update();
				//trace(_paraglider._velocity.length);
		}
		
	}
	
}