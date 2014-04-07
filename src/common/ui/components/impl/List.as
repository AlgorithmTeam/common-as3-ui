/**
 * User: Ray Yee
 * Date: 2014/4/6
 * All rights reserved.
 */
package common.ui.components.impl
{
    import flash.events.EventDispatcher;

    import common.ui.components.api.IList;
    import common.ui.components.api.IListItem;
    import common.ui.events.ListEvent;

    [Event(name="click", type="ui.events.ListEvent")]
    [Event(name="over", type="ui.events.ListEvent")]
    [Event(name="out", type="ui.events.ListEvent")]
    public class List extends EventDispatcher implements IList
    {
        private var itemMap:Vector.<IListItem>;

        public function List()
        {
            itemMap = new <IListItem>[];
        }

        public function addItem( item:IListItem ):void
        {
            itemMap.push( item );
            item.setIndex( itemMap.length - 1 );
            item.setSelectable();
            addItemEvents( item );
        }

        public function removeItem( item:IListItem ):void
        {
            var index:int = itemMap.indexOf( item );
            if ( index != -1 )
            {
                removeItemEvents( item );
                itemMap.splice( index, 1 );
            }
        }

        private function addItemEvents( item:IListItem ):void
        {
            item.addEventListener( ListEvent.ITEM_CLICK, onItemEvent );
            item.addEventListener( ListEvent.ITEM_OVER, onItemEvent );
            item.addEventListener( ListEvent.ITEM_OUT, onItemEvent );
        }

        private function removeItemEvents( item:IListItem ):void
        {
            item.removeEventListener( ListEvent.ITEM_CLICK, onItemEvent );
            item.removeEventListener( ListEvent.ITEM_OVER, onItemEvent );
            item.removeEventListener( ListEvent.ITEM_OUT, onItemEvent );
        }

        private function onItemEvent( e:ListEvent ):void
        {
            dispatchEvent( new ListEvent( e.type, e.processingListItem ) );
        }

        public function getItem( index:int ):IListItem
        {
            return itemMap[index];
        }

        public function get length():int
        {
            return itemMap.length;
        }

        public function clear():void
        {
            for each ( var item:IListItem in itemMap )
            {
                removeItemEvents( item );
            }
            itemMap = new <IListItem>[];
        }
    }
}
