/**
 * User: Ray Yee
 * Date: 2014/4/7
 * All rights reserved.
 */
package common.ui.components.impl
{
    import flash.display.MovieClip;

    public class FList extends List
    {
        private var viewAssets:MovieClip;

        public function FList()
        {
            super();
        }

        public function setSkin( value:MovieClip ):void
        {
            viewAssets = value;
        }

        public function get view():MovieClip
        {
            return viewAssets;
        }
    }
}
