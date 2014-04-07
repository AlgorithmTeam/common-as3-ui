/**
 * User: Ray Yee
 * Date: 2014/4/2
 * All rights reserved.
 */
package common.ui.components.impl
{
    import flash.display.Sprite;
    import flash.events.MouseEvent;

    /**
     * 滑动条
     * 由一个轨道区域(track)和一个控制把手(grip)组成
     */
    public class Slider
    {
        private var options:Object = {minValue: 0, maxValue: 100, valueText: null, onUpdate: null, onChange: null};
        private var track:Sprite;
        private var grip:Sprite;

        public function Slider( t:Sprite, g:Sprite, o:Object )
        {
            //Params
            track = t;
            grip = g;
            for ( var prop:String in o )
            {
                options[prop] = o[prop];
            }

            //Initialization
            grip.x = 0;
            updateToText( 0 );
            addTrackEvent();
        }

        private function removeTrackEvent():void
        {
            track.removeEventListener( MouseEvent.MOUSE_DOWN, sliderClick );
        }

        private function addTrackEvent():void
        {
            track.addEventListener( MouseEvent.MOUSE_DOWN, sliderClick );
        }

        private function addStageEvents():void
        {
            track.stage.addEventListener( MouseEvent.MOUSE_UP, sliderMouseUp );
            track.stage.addEventListener( MouseEvent.MOUSE_MOVE, sliderMouseMove );
        }

        private function removeStageEvents():void
        {
            track.stage.removeEventListener( MouseEvent.MOUSE_UP, sliderMouseUp );
            track.stage.removeEventListener( MouseEvent.MOUSE_MOVE, sliderMouseMove );
        }

        private function sliderClick( e:MouseEvent ):void
        {
            updateGripPos();
            removeTrackEvent();
            addStageEvents();
        }

        private function updateGripPos():void
        {
            grip.x = Math.round( track.mouseX - grip.width / 2 );
            if ( grip.x < 0 ) grip.x = 0;
            if ( grip.x > track.width - grip.width ) grip.x = track.width - grip.width;
            var sliderValue:Number = rangeValue( grip.x / (track.width - grip.width) * 100, options.minValue, options.maxValue );
            if ( options.onChange != null ) options.onChange( sliderValue );
            updateToText( sliderValue );
        }

        private function updateToText( value:Number ):void
        {
            if ( options.valueText != null ) options.valueText.text = (value >> 0) + "";
        }

        private function sliderMouseUp( e:MouseEvent ):void
        {
            removeStageEvents();
            addTrackEvent();
            if ( options.onUpdate != null ) options.onUpdate( rangeValue( grip.x / (track.width - grip.width) * 100, options.minValue, options.maxValue ) );
        }

        private function sliderMouseMove( e:MouseEvent ):void
        {
            updateGripPos();
        }

        private function rangeValue( per:Number, min:Number, max:Number ):Number
        {
            return ((( max - min ) / 100 ) * per ) + min;
        }
    }
}
