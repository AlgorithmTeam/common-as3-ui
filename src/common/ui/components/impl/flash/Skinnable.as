/**
 * User: Ray Yee
 * Date: 2014/4/13
 * All rights reserved.
 */
package common.ui.components.impl.flash
{
    import common.ui.components.api.IDisplayObject;
    import common.ui.utility.SkinUtility;

    import flash.display.MovieClip;

    /**
     * 换肤功能
     */
    public class Skinnable implements ISkinnable, IDisplayObject
    {
        protected var _skin:MovieClip;

        public function Skinnable()
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

        public function initialized():void
        {
        }

        public function setSkin( value:MovieClip ):void
        {
            _skin = value;
            SkinUtility.getAddedToStageLifecycle( _skin, initialized );
        }
    }
}
