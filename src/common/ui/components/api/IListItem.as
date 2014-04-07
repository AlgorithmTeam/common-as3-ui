/**
 * User: Ray Yee
 * Date: 2014/4/7
 * All rights reserved.
 */
package common.ui.components.api
{
    import flash.events.IEventDispatcher;

    public interface IListItem extends IEventDispatcher
    {
        /**
         * @private
         * @param value
         */
        function setIndex( value:int ):void;

        function get index():int;

        function setSelectable():void;

        function get data():*;

        function set data( value:* ):void;
    }
}
