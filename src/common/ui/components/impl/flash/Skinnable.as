/**
 * User: Ray Yee
 * Date: 2014/4/13
 * All rights reserved.
 */
package common.ui.components.impl.flash
{
    import flash.display.MovieClip;
    import flash.events.Event;

    /**
     * 换肤功能
     */
    public class Skinnable implements ISkinnable
    {
        protected var _skin:MovieClip;

        public function Skinnable()
        {
        }

        public function initialized():void
        {
        }

        public function setSkin( value:MovieClip ):void
        {
            _skin = value;
            if ( _skin.stage )
            {
                initialized();
            }
            else
            {
                _skin.addEventListener( Event.ADDED_TO_STAGE, onSkinAddedToStage );
            }
        }

        private function onSkinAddedToStage( e:Event ):void
        {
            _skin.removeEventListener( Event.ADDED_TO_STAGE, onSkinAddedToStage );
            initialized();
        }
    }
}
