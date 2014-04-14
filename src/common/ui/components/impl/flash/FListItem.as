/**
 * User: Ray Yee
 * Date: 2014/4/12
 * All rights reserved.
 */
package common.ui.components.impl.flash
{

    import common.ui.components.api.IDisplayObject;
    import common.ui.components.impl.base.ListItem;
    import common.ui.events.ListEvent;

    import flash.display.MovieClip;
    import flash.events.MouseEvent;

    public class FListItem extends ListItem implements ISkinnable, IDisplayObject
    {
        private var _skin:MovieClip;

        public function FListItem()
        {
            super();
        }

        override protected function removeEvents():void
        {
            super.removeEvents();
            _skin.removeEventListener( MouseEvent.CLICK, onClickItem );
            _skin.removeEventListener( MouseEvent.MOUSE_OVER, onOverItem );
            _skin.removeEventListener( MouseEvent.MOUSE_OUT, onOutItem );
        }

        override protected function addEvents():void
        {
            super.addEvents();
            _skin.addEventListener( MouseEvent.CLICK, onClickItem );
            _skin.addEventListener( MouseEvent.MOUSE_OVER, onOverItem );
            _skin.addEventListener( MouseEvent.MOUSE_OUT, onOutItem );
        }

        protected function onOutItem( e:MouseEvent = null ):void
        {
            dispatchEvent( new ListEvent( ListEvent.ITEM_OUT, this ) );
        }

        protected function onOverItem( e:MouseEvent = null ):void
        {
            dispatchEvent( new ListEvent( ListEvent.ITEM_OVER, this ) );
        }

        protected function onClickItem( e:MouseEvent = null ):void
        {
            dispatchEvent( new ListEvent( ListEvent.ITEM_CLICK, this ) );
        }

        public function initialized():void
        {
            if (_selectable)
            {
                addEvents();
            }
        }

        public function get visible():Boolean
        {
            return _skin.visible;
        }

        public function set visible( value:Boolean ):void
        {
            _skin.visible = value;
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
            initialized();
        }
    }
}
