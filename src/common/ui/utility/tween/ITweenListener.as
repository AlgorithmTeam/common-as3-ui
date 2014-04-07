/**
 * User: Ray Yee
 * Date: 2014/4/6
 * All rights reserved.
 */
package common.ui.utility.tween
{
    public interface ITweenListener
    {
        function change( value:Function ):ITweenListener;

        function complete( value:Function ):ITweenListener
    }
}
