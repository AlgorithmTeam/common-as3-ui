/**
 * User: Ray Yee
 * Date: 2014/4/6
 * All rights reserved.
 */
package common.ui.utility.tween
{
    import aze.motion.eaze;

    import flash.utils.Dictionary;

    public class EazeTweenAdapter implements ITween
    {

        private var _tweenMap:Dictionary = new Dictionary();

        public function EazeTweenAdapter()
        {
        }

        public function to( target:*, duration:Number, options:Object ):TweenListener
        {
            var tweenListener:TweenListener = new TweenListener();
            _tweenMap[target] = tweenListener;
            eaze( target ).to( duration, options ).onUpdate( onChange, tweenListener ).onComplete( onComplete, tweenListener );
            return tweenListener;
        }

        private function onChange( tl:TweenListener ):void
        {
            for each ( var o:Function in tl.changeMap )
            {
                o.call( null );
            }
        }

        private function onComplete( tl:TweenListener ):void
        {
            for each ( var o:Function in tl.completeMap )
            {
                o.call( null );
            }
        }
    }
}
