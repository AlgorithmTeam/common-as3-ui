package common.ui.data
{
    import common.ui.events.DataChangeEvent;

    import flash.events.Event;
	import flash.events.EventDispatcher;
	
	/**
	 * a data privoder for a list,which makes list show contents.
	 * @author Stanley
	 * 
	 */	
	public class DataProvider extends EventDispatcher
	{
		//=============================================================================
		// variables
		//=============================================================================
		
		public static const REMOVE_ALL_EVENT:String = "removeAllEvent";
		
		private var _length:uint;
		
		public function get length():uint
		{
			return items.length;
		}
		
		public var items:Array ;
		
		//============================================================================
		//constructor
		//============================================================================
		
		/**
		 *  
		 * @param value An <code>Array</code> or <code>XML</code> object.
		 * 
		 */		
		public function DataProvider(value:Object = null)
		{
			items = [];
			if(value is Array)
			{
				items = value as Array;
			}
			else if(value is XMLList)
			{
				for each(var xml:XML in value)
				{
					items.push(xml);
				}
			}
		}
		
		//============================================================================
		// public methods
		//============================================================================
		/**
		 * insert a item into dataProvider,default position is the last. 
		 * @param item
		 * 
		 */		
		public function addItem(item:Object):void
		{
			items.push(item);
			var evt:DataChangeEvent = new DataChangeEvent();
			evt.items = [item];
			evt.startIndex = items.length - 1;
			evt.changeType = DataChangeEvent.ADD_ITEM;
			dispatchEvent(evt);
		}
		
		/**
		 * insert a item at position of specified with index.
		 * @param item object used to insert.
		 * @param index position of insert,start with 0.
		 * 
		 */		
		public function addItemAt(item:Object,index:uint):void
		{
			if(index >= 0 && index <= items.length)
			{
				items.splice(index, 0 , item);
				var evt:DataChangeEvent = new DataChangeEvent();
				evt.items = [item];
				evt.startIndex = index;
				evt.changeType = DataChangeEvent.ADD_ITEM;
				dispatchEvent(evt);
			}
		}
		
		public function addItems(items:Object):void
		{
			
		}
		
		public function addItemsAt(items:Object,index:uint):void
		{
			
		}
		
		/**
		 * get object at the position INDEX.
		 * @param index start with 0 
		 * @return 
		 * 
		 */		
		public function getItemAt(index:uint):Object
		{
			if(items[index] != null)
				return items[index];
			else
				return null;
		}
		
		/**
		 * get the current position index of an specified object 
		 * @param item
		 * @return if item does not exsit,return -1.
		 * 
		 */		
		public function getItemIndex(item:Object):int
		{
			return items.indexOf(item);
		}
		
		public function getItemIndexWithNode(nodeName:String,NodeValue:String):int
		{
			for(var i:int=0;i<items.length;i++)
			{
				if(items[i][nodeName] && items[i][nodeName] == NodeValue)
				{
					return i;
				}
			}
			
			return -1;
		}
		
		
		/**
		 * remove all the items in dataProvider. 
		 * 
		 */		
		public function removeAll():void
		{
			items = [];
			dispatchEvent(new Event(REMOVE_ALL_EVENT));
		}
		
		public function removeItem(item:Object):Object
		{
			var result:Object;
			var index:int = items.indexOf(item);
			if(index != -1)
			{
				var evt:DataChangeEvent = new DataChangeEvent();
				evt.items = [item];
				evt.startIndex = index;
				evt.changeType = DataChangeEvent.REMOVE_ITEM;
				result = items.splice(index,1);
				
				dispatchEvent(evt);
			}
			return result;
		}
		
		public function removeItemAt(index:uint):Object
		{
			var result:Object;
			if(index >= 0 && index < items.length)
			{
				var evt:DataChangeEvent = new DataChangeEvent();
				evt.items = [items[index]];
				evt.startIndex = index;
				evt.changeType = DataChangeEvent.REMOVE_ITEM;
				
				result = items.splice(index,1);
				dispatchEvent(evt);
			}
			return result;
		}
		
		public function replaceItem(newItem:Object,oldItem:Object):Object
		{
			//return old one
			return {};
		}
		
		public function updateItem(index:int, item:Object=null):void
		{
			if (index >= 0 && index < items.length)
			{
				if(item!=null)
					items[index] = item;
				var evt:DataChangeEvent = new DataChangeEvent();
				evt.items = [item];
				evt.startIndex = index;
				evt.changeType = DataChangeEvent.DATA_CHANGE;
				
				dispatchEvent(evt);
			}
		}
		
		public function refresh(item:Object):void
		{
			
			var index:int = items.indexOf(item);
			if(index != -1)
			{
				
				
				var evt:DataChangeEvent = new DataChangeEvent();
				evt.items = [item];
				evt.startIndex = index;
				evt.changeType = DataChangeEvent.DATA_CHANGE;
				
				dispatchEvent(evt);
			}
			
		}
		
		
		
		
		public function sort(p:*):*
		{
			return items.sort(p);
		}
		
		public function sortOn(names:*, options:*=0):*
		{
			return items.sortOn(names,options);
		}
		
		
		
	}
}