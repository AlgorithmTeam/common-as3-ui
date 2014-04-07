/**
 * User: Ray Yee
 * Date: 2014/4/7
 * All rights reserved.
 */
package common.ui.effects.api
{
    import flash.display.MovieClip;

    public interface ICheckButtonEffect
    {
        function whenSetState(stateOne:MovieClip, stateTwo:MovieClip, state:int):void;
    }
}
