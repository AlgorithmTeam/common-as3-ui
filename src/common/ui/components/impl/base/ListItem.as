/**
 * User: Ray Yee
 * Date: 2014/4/6
 * All rights reserved.
 */
package common.ui.components.impl.base
{
    import common.ui.components.api.IListItem;

    import flash.events.EventDispatcher;

    [Event(name="click", type="common.ui.events.ListEvent")]
    [Event(name="over", type="common.ui.events.ListEvent")]
    [Event(name="out", type="common.ui.events.ListEvent")]
    public class ListItem extends EventDispatcher implements IListItem
    {
        protected var _selectable:Boolean;
        protected var _triggerType:int;
        private var _index:int;
        private var _data:*;

        public function ListItem()
        {
        }

        public function setUnSelectable():void
        {
            if ( _selectable )
            {
                _selectable = false;
                removeEvents();
            }
        }

        public function setSelectable():void
        {
            if ( !_selectable )
            {
                _selectable = true;
                addEvents();
            }
        }

        protected function removeEvents():void
        {

        }

        protected function addEvents():void
        {

        }

        public function get index():int
        {
            return _index;
        }

        /**
         * @private
         * @param value
         */
        internal function setIndex( value:int ):void
        {
            _index = value;
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
