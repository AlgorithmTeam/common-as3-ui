/**
 * User: Ray Yee
 * Date: 2014/4/6
 * All rights reserved.
 */
package common.ui.utility.tween
{
    public class TweenApi
    {
        private static var tween:ITween;

        public function TweenApi()
        {
        }

        public static function registerTween( value:ITween = null ):void
        {
            if ( value != null )
            {
                tween = value;
            }
            else
            {
                tween = createSimpleTween();
            }
        }

        public static function getTween():ITween
        {
            return tween;
        }

        private static function createSimpleTween():ITween
        {
            return new EazeTweenAdapter();
        }

    }
}
