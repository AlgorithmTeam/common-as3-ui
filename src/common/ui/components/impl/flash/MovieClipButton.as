/**
 * User: Ray Yee
 * Date: 2014/4/13
 * All rights reserved.
 */
package common.ui.components.impl.flash
{
    import common.ui.events.ButtonEvent;

    import flash.display.MovieClip;
    import flash.events.EventDispatcher;
    import flash.events.MouseEvent;

    [Event(name="click", type="common.ui.events.ButtonEvent")]
    public class MovieClipButton extends EventDispatcher implements ISkinnable
    {
        private static const UP:int = 1;
        private static const OVER:int = 2;
        private static const DOWN:int = 3;
        private static const CLICK:int = 4;

        private var _skin:MovieClip;

        public function MovieClipButton()
        {
        }

        public function initialized():void
        {
            //use week reference, auto release.
            _skin.addEventListener( MouseEvent.CLICK, onClickButton, false, 0, true );
            _skin.addEventListener( MouseEvent.ROLL_OVER, onMouseOverButton, false, 0, true );
            _skin.addEventListener( MouseEvent.ROLL_OUT, onMouseOutButton, false, 0, true );
        }

        public function setSkin( value:MovieClip ):void
        {
            _skin = value;
            initialized();
        }

        private function onMouseOutButton( e:MouseEvent ):void
        {
            _skin.gotoAndStop( UP );
        }

        private function onMouseOverButton( e:MouseEvent ):void
        {
            _skin.gotoAndStop( OVER );
        }

        private function onClickButton( e:MouseEvent ):void
        {
            if ( CLICK >= _skin.totalFrames )
            {
                _skin.gotoAndStop( CLICK );
            }
            else if ( DOWN >= _skin.totalFrames )
            {
                _skin.gotoAndStop( DOWN );
            }
            dispatchEvent( new ButtonEvent( ButtonEvent.CLICK ) );
        }
    }
}
