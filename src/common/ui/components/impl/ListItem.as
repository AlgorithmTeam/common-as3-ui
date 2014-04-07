/**
 * User: Ray Yee
 * Date: 2014/4/6
 * All rights reserved.
 */
package common.ui.components.impl
{
    import flash.display.MovieClip;
    import flash.events.EventDispatcher;
    import flash.events.MouseEvent;

    import common.ui.components.api.IListItem;

    import common.ui.events.ListEvent;

    [Event(name="click", type="ui.events.ListEvent")]
    [Event(name="over", type="ui.events.ListEvent")]
    [Event(name="out", type="ui.events.ListEvent")]
    public class ListItem extends EventDispatcher implements IListItem
    {
        protected var _triggerType:int;
        private var _index:int;
        private var _skin:MovieClip;
        private var _data:*;

        public function ListItem()
        {
        }

        public function setSelectable():void
        {
            addEvents();
        }

        private function removeEvents():void
        {
            _skin.removeEventListener( MouseEvent.CLICK, onClickItem );
            _skin.removeEventListener( MouseEvent.MOUSE_OVER, onOverItem );
            _skin.removeEventListener( MouseEvent.MOUSE_OUT, onOutItem );
        }

        private function addEvents():void
        {
            _skin.addEventListener( MouseEvent.CLICK, onClickItem );
            _skin.addEventListener( MouseEvent.MOUSE_OVER, onOverItem );
            _skin.addEventListener( MouseEvent.MOUSE_OUT, onOutItem );
        }

        private function onOutItem( e:MouseEvent = null ):void
        {
            dispatchEvent( new ListEvent( ListEvent.ITEM_OUT, this ) );
        }

        private function onOverItem( e:MouseEvent = null ):void
        {
            dispatchEvent( new ListEvent( ListEvent.ITEM_OVER, this ) );
        }

        private function onClickItem( e:MouseEvent = null ):void
        {
            dispatchEvent( new ListEvent( ListEvent.ITEM_CLICK, this ) );
        }

        public function get index():int
        {
            return _index;
        }

        /**
         * @private
         * @param value
         */
        public function setIndex( value:int ):void
        {
            _index = value;
        }

        public function get skin():MovieClip
        {
            return _skin;
        }

        /**
         * @private
         * @param value
         */
        public function setSkin( value:MovieClip ):void
        {
            _skin = value;
        }

        public function get data():*
        {
            return _data;
        }

        public function set data( value:* ):void
        {
            _data = value;
        }

        public function get triggerType():int
        {
            return _triggerType;
        }

    }
}
