/**
 * User: Ray Yee
 * Date: 2014/4/19
 * All rights reserved.
 */
package common.ui.utility
{
    import flash.display.DisplayObject;
    import flash.events.Event;

    public class SkinUtility
    {
        /**
         * 获取对象被成功加到舞台后的生命周期
         * @param value
         * @param callBack
         */
        public static function getAddedToStageLifecycle( value:DisplayObject, callBack:Function ):void
        {
            if ( value.stage ) callBack();
            else
            {
                value.addEventListener( Event.ADDED_TO_STAGE, function ( e:Event ):void
                {
                    value.removeEventListener( Event.ADDED_TO_STAGE, arguments.callee );
                    callBack();
                } );
            }
        }
    }
}
