/**
 * User: Ray Yee
 * Date: 2014/4/6
 * All rights reserved.
 */
package common.ui.utility.tween
{
    import aze.motion.eaze;

    public class SimpleTween implements ITween, ITweenListener
    {
        private var changeMap:Array = [];
        private var completeMap:Array = [];

        public function SimpleTween()
        {
        }

        public function to( target:*, duration:Number, options:Object ):ITweenListener
        {
            eaze( target ).to( duration, options ).onUpdate( onChange ).onComplete( onComplete );
            return this;
        }

        private function onChange():void
        {
            for each ( var o:Function in changeMap )
            {
                o.call( null );
            }
        }

        private function onComplete():void
        {
            for each ( var o:Function in arguments )
            {
                o.call( null );
            }
        }

        public function change( value:Function ):ITweenListener
        {
            changeMap.push( value );
            return this;
        }

        public function complete( value:Function ):ITweenListener
        {
            completeMap.push( value );
            return this;
        }
    }
}
