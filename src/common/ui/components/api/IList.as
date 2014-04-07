/**
 * User: Ray Yee
 * Date: 2014/4/7
 * All rights reserved.
 */
package common.ui.components.api
{
    import flash.events.IEventDispatcher;

    public interface IList extends IEventDispatcher
    {
        function addItem( item:IListItem ):void;

        function removeItem( item:IListItem ):void;

        function getItem( index:int ):IListItem;

        function get length():int;

        function clear():void;
    }
}
