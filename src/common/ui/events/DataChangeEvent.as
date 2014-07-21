package common.ui.events
{
	import flash.events.Event;
	
	/**
	 * if a <code>List</code> object's data changed,dispatch this.
	 * @author Stanley
	 * 
	 */	
	public class DataChangeEvent extends Event
	{
		public static const DATA_CHANGE:String = "dataChange";
		
		public static const ADD_ITEM:String = "addItem";
		public static const REMOVE_ITEM:String = "removeItem";
		
		public var startIndex:int = -1;
		public var endIndex:int = -1;
		public var items:Array;
		public var changeType:String = ADD_ITEM;
		
		public function DataChangeEvent(type:String = DATA_CHANGE, bubbles:Boolean=false, cancelable:Boolean=false)
		{
			super(type, bubbles, cancelable);
			items = [];
		}
		
		override public function clone():Event
		{
			return new DataChangeEvent(type,bubbles,cancelable);
		}
		
		override public function toString():String
		{
			return formatToString("DataChangeEvent","type", "bubbles", "cancelable", "eventPhase", 
				"startIndex","endIndex","items");
		}
	}
}