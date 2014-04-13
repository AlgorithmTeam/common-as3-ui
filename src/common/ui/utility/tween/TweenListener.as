/**
 * User: Ray Yee
 * Date: 2014/4/12
 * All rights reserved.
 */
package common.ui.utility.tween
{
    public class TweenListener
    {
        internal var changeMap:Array = [];
        internal var completeMap:Array = [];

        public function TweenListener()
        {
        }

        public function change( value:Function ):TweenListener
        {
            changeMap.push( value );
            return this;
        }

        public function complete( value:Function ):TweenListener
        {
            completeMap.push( value );
            return this;
        }
    }
}
