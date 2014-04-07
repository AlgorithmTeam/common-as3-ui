/**
 * User: Ray Yee
 * Date: 2014/4/7
 * All rights reserved.
 */
package common.ui.utility
{
    import common.ui.components.api.IListItem;
    import common.ui.components.impl.FList;
    import common.ui.components.impl.ListItem;

    import flash.display.MovieClip;

    public class ListUtility
    {
        public function ListUtility()
        {
        }

        /**
         * 给Flash显示对象做皮肤的列表 构建Item
         * @param list
         * @param itemClass
         */
        public static function buildItems( list:FList, itemClass:Class = null ):void
        {
            var viewAssets:MovieClip = list.view;
            itemClass ||= ListItem;
            var item:IListItem;
            var itemAsset:MovieClip;
            for ( var i:int = 0; ; i += 1 )
            {
                itemAsset = viewAssets.getChildByName( "item" + i ) as MovieClip;
                if ( itemAsset )
                {
                    item = new itemClass();
                    AssetsReflector.mapArtTo( itemAsset, item );
                    list.addItem( item );
                }
                else
                {
                    break;
                }
            }
        }
    }
}
