/**
 * User: Ray Yee
 * Date: 2014/4/7
 * All rights reserved.
 */
package common.ui.events
{
    import flash.events.Event;

    public class ButtonEvent extends Event
    {
        public static const CLICK:String = "click";

        public var param:*;
        public function ButtonEvent( type:String, data:* = null, bubbles:Boolean = false, cancelable:Boolean = false )
        {
            this.param = data;
            super( type, bubbles, cancelable );
        }
    }
}
