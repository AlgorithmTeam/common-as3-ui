/**
 * User: Ray Yee
 * Date: 2014/4/13
 * All rights reserved.
 */
package common.ui.components.impl.flash
{
    import flash.display.MovieClip;

    public interface ISkinnable
    {
        /**
         * Life Cycle,
         * After set skin.
         */
        function initialized():void;

        function setSkin( value:MovieClip ):void;
    }
}
