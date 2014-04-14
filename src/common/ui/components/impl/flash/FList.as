/**
 * User: Ray Yee
 * Date: 2014/4/7
 * All rights reserved.
 */
package common.ui.components.impl.flash
{
    import common.ui.components.api.IDisplayObject;
    import common.ui.components.impl.base.List;

    import flash.display.MovieClip;

    public class FList extends List implements ISkinnable, IDisplayObject
    {
        private var _skin:MovieClip;

        public function FList()
        {
            super();
        }

        public function initialized():void
        {
        }

        public function get visible():Boolean
        {
            return _skin.visible;
        }

        public function set visible( value:Boolean ):void
        {
            _skin.visible = value;
        }

        public function setSkin( value:MovieClip ):void
        {
            _skin = value;
        }

        public function get skin():MovieClip
        {
            return _skin;
        }
    }
}
