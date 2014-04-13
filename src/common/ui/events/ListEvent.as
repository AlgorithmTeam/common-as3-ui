/**
 * User: Ray Yee
 * Date: 2014/4/6
 * All rights reserved.
 */
package common.ui.events
{
    import common.ui.components.api.IListItem;

    import flash.events.Event;

    public class ListEvent extends Event
    {
        public static const ITEM_CLICK:String = "click";
        public static const ITEM_OVER:String = "over";
        public static const ITEM_OUT:String = "out";

        public var processingListItem:IListItem;

        public function ListEvent( type:String, item:IListItem, bubbles:Boolean = false, cancelable:Boolean = false )
        {
            super( type, bubbles, cancelable );
            processingListItem = item;
        }
    }
}
