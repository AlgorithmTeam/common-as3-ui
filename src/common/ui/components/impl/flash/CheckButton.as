/**
 * User: Ray Yee
 * Date: 2014/4/7
 * All rights reserved.
 */
package common.ui.components.impl.flash
{
    import flash.display.MovieClip;
    import flash.events.EventDispatcher;
    import flash.events.MouseEvent;

    import common.ui.effects.api.ICheckButtonEffect;
    import common.ui.events.ButtonEvent;

    import flash.utils.getTimer;

    [Event(name="click", type="common.ui.events.ButtonEvent")]
    public class CheckButton extends EventDispatcher
    {
        private var currentState:int;
        private var stateOne:MovieClip;
        private var stateTwo:MovieClip;
        private var effect:ICheckButtonEffect;
        private var previousClickTime:Number = 0.0;

        public function CheckButton( stateOneParam:MovieClip, stateTwoParam:MovieClip, effectParam:ICheckButtonEffect = null )
        {
            this.effect = effectParam;
            this.stateOne = stateOneParam;
            this.stateTwo = stateTwoParam;
            currentState = 1;
            stateOne.visible = true;
            stateTwo.visible = false;
            addEvents();
        }

        private function addEvents():void
        {
            stateOne.addEventListener( MouseEvent.CLICK, onClickStateButton );
            stateTwo.addEventListener( MouseEvent.CLICK, onClickStateButton );
        }

        private function onClickStateButton( e:MouseEvent = null ):void
        {
            var clickedTime:Number = getTimer();
            if (clickedTime - previousClickTime > 500)
            {
                if ( e.currentTarget == stateOne ) setState( 2 );
                else if ( e.currentTarget == stateTwo ) setState( 1 );
                dispatchEvent( new ButtonEvent( ButtonEvent.CLICK, currentState ) );
                previousClickTime = clickedTime;
            }
        }

        public function setState( value:int ):void
        {
            currentState = value;

            if ( effect != null ) effect.whenSetState( stateOne, stateTwo, currentState );
            else
            {
                if ( currentState == 1 )
                {
                    stateOne.visible = true;
                    stateTwo.visible = false;
                }
                else if ( currentState == 2 )
                {
                    stateOne.visible = false;
                    stateTwo.visible = true;
                }
            }
        }

        public function getCheckedState():int
        {
            return currentState;
        }
    }
}
