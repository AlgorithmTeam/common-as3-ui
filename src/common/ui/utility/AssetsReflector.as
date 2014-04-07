/**
 * User: Ray Yee
 * Date: 2014/4/1
 * All rights reserved.
 */
package common.ui.utility
{
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.MovieClip;
    import flash.utils.describeType;
    import flash.utils.getDefinitionByName;
    import flash.utils.getQualifiedClassName;

    public class AssetsReflector
    {
        public function AssetsReflector()
        {
        }

        /**
         * 创建美术资源
         * 并添加到View中
         * 并且映射关系
         * @param viewInstance
         * @param artCls
         */
        public static function createArtToView( viewInstance:DisplayObjectContainer, artCls:Class ):void
        {
            var _assets:MovieClip = new artCls as MovieClip;
            viewInstance.addChild( _assets );
            mapArtTo( _assets, viewInstance );
        }

        /**
         * 映射一个美术资源到某对象
         * @param art
         * @param mapped
         */
        public static function mapArtTo( art:DisplayObjectContainer, mapped:Object ):void
        {
            var mappedDescribe:XML = describeType( mapped );
            var child:DisplayObject, childClassName:String;
            var skinProcessor:*;
            for each( var node:XML in mappedDescribe..variable.metadata.(@name == "Map") )
            {
                child = searchChild( art, node.parent().@name );
                if ( child != null )
                {
                    childClassName = getQualifiedClassName( child );
                    //如果要映射成的类型是显示对象资源的类型  那就直接映射
                    if ( childClassName == node.parent().@type )
                        mapped[node.parent().@name] = child;
                    //如果metadata有skin字段   且该显示对象的类型和skin的值是一样的  那实例化待注入的变量并将skin通过构造函数传入
                    else
                    {
                        skinProcessor = new (getDefinitionByName( node.parent().@type ) as Class)();
                        if ( skinProcessor.hasOwnProperty( "setSkin" ) ) skinProcessor.setSkin( art );
                        mapped[node.parent().@name] = skinProcessor;
                    }
                    //Default process
                    if ( child is MovieClip )
                    {
                        (child as MovieClip).stop();
                    }
                }
            }
            if ( mapped.hasOwnProperty( "setSkin" ) ) mapped.setSkin( art );
        }

        /**
         * 遍历显示对象结构
         * 找出对应的显示对象
         * @param p
         * @param name
         * @return
         */
        private static function searchChild( p:DisplayObjectContainer, name:String ):DisplayObject
        {
            var i:int = 0, len:int = p.numChildren, child:DisplayObject;
            for ( ; i < len; i += 1 )
            {
                child = p.getChildAt( i );
                if ( child.name == name )
                {
                    return child;
                }
                if ( child is DisplayObjectContainer )
                {
                    child = searchChild( child as DisplayObjectContainer, name );
                    if ( child ) return child;
                }
            }
            return null;
        }
    }
}
