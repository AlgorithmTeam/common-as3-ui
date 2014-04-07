/**
 * User: Ray Yee
 * Date: 2014/4/6
 * All rights reserved.
 */
package common.ui.utility.tween
{
    public interface ITween
    {
        function to(target:*, duration:Number, options:Object):ITweenListener;
    }
}
