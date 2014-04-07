/**
 * User: Ray Yee
 * Date: 2014/4/7
 * All rights reserved.
 */
package common.ui.effects.impl
{
    import flash.display.MovieClip;

    import common.ui.effects.api.ICheckButtonEffect;
    import common.ui.utility.tween.TweenApi;

    public class ScaleCheckButtonEffect implements ICheckButtonEffect
    {
        public function ScaleCheckButtonEffect()
        {
        }

        public function whenSetState( stateOne:MovieClip, stateTwo:MovieClip, state:int ):void
        {
            if ( state == 1 )
            {
                TweenApi.getTween().to( stateTwo, .2, {scale: .5, visible: false} );
                TweenApi.getTween().to( stateOne, .3, {scale: 1, visible: true} );
            }
            else if ( state == 2 )
            {
                TweenApi.getTween().to( stateOne, .2, {scale: .5, visible: false} );
                TweenApi.getTween().to( stateTwo, .3, {scale: 1, visible: true} );
            }
        }
    }
}
