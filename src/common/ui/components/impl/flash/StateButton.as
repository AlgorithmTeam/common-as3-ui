/**
 * User: Ray Yee
 * Date: 2014/4/13
 * All rights reserved.
 */
package common.ui.components.impl.flash
{
    import common.ui.components.api.IDisplayObject;
    import common.ui.events.ButtonEvent;
    import common.ui.utility.SkinUtility;

    import flash.display.MovieClip;
    import flash.events.EventDispatcher;
    import flash.events.IEventDispatcher;
    import flash.events.MouseEvent;

    [Event(name="click", type="common.ui.events.ButtonEvent")]
    public class StateButton extends EventDispatcher implements ISkinnable, IDisplayObject
    {
        private var _currentState:int = 1;
        private var _skin:MovieClip;

        public function StateButton( target:IEventDispatcher = null )
        {
            super( target );
        }

        private function onClickToChangeState( e:MouseEvent ):void
        {
            _currentState++;
            if ( _currentState > _skin.totalFrames )
            {
                _currentState = 1;
            }
            _skin.gotoAndStop( _currentState );
            dispatchEvent( new ButtonEvent( ButtonEvent.CLICK, _currentState ) );
        }

        public function initialized():void
        {
            _skin.gotoAndStop( _currentState );

            //use week reference, auto release.
            _skin.addEventListener( MouseEvent.CLICK, onClickToChangeState, false, 0, true );
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
            SkinUtility.getAddedToStageLifecycle( _skin, initialized );
        }

        public function get skin():MovieClip
        {
            return _skin;
        }

        public function get currentState():int
        {
            return _currentState;
        }

        public function setState( value:int ):void
        {
            _currentState = value;
            _skin.gotoAndStop(_currentState);
        }
    }
}
