/**
 * User: Ray Yee
 * Date: 2014/4/14
 * All rights reserved.
 */
package common.ui.components.impl.flash
{
    import common.ui.components.api.IDisplayObject;

    import flash.display.MovieClip;
    import flash.events.EventDispatcher;
    import flash.events.MouseEvent;
    import flash.utils.Dictionary;

    public class RadioButton extends EventDispatcher implements IDisplayObject, ISkinnable
    {
        private static const UNSELECTED:int = 1;
        private static const SELECTED:int = 2;

        private var _skin:MovieClip;
        private var _groupName:String;
        private static var _groupMap:Dictionary = new Dictionary( false );

        public function RadioButton()
        {
            addToGroup( "default" );
        }

        public function addToGroup( value:String ):void
        {
            if ( _groupName != value )
            {
                _groupName = value;
                _groupMap[value] ||= [];
                _groupMap[value].push( this );
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

        public function initialized():void
        {
            //use week reference, auto release.
            _skin.addEventListener( MouseEvent.CLICK, onClickButton, false, 0, true );
        }

        private function onClickButton( e:MouseEvent ):void
        {
            var group:Array = _groupMap[_groupName];
            if ( group != null )
            {
                if ( _skin.currentFrame == UNSELECTED )
                {
                    for each ( var radioButton:RadioButton in group )
                    {
                        if ( radioButton != this )
                        {
                            radioButton.setState( UNSELECTED );
                        }
                    }
                    setState( SELECTED );
                }
            }
        }

        private function setState( value:int ):void
        {
            _skin.gotoAndStop( value );
        }

        public function setSkin( value:MovieClip ):void
        {
            _skin = value;
        }
    }
}
