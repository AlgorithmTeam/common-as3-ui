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
    import flash.system.System;
    import flash.utils.describeType;
    import flash.utils.getDefinitionByName;
    import flash.utils.getQualifiedClassName;

    public class AssetsReflector
    {

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
            var child:DisplayObject;
            var childClassName:String;
            var skin:*;
            var skinName:String;
            var skinDefinitionName:String;
            var skinDefinition:Class;
            for each( var node:XML in mappedDescribe..variable.metadata.(@name == "Map") )
            {
                skinName = node.parent().@name;
                child = searchChild( art, skinName );
                if ( child != null )
                {
                    skinDefinitionName = node.parent().@type;
                    childClassName = getQualifiedClassName( child );
                    if ( childClassName == skinDefinitionName )
                    {
                        //如果要映射成的类型是显示对象资源的类型  那就直接映射
                        mapped[skinName] = child;
                    }
                    else
                    {
                        skinDefinition = getDefinitionByName( skinDefinitionName ) as Class;
                        if ( child is skinDefinition )
                        {
                            //如果要映射成的类型是显示对象资源的类型  那就直接映射
                            mapped[skinName] = child;
                        }
                        else
                        {
                            //如果metadata有skin字段   且该显示对象的类型和skin的值是一样的  那实例化等待注入的变量并将skin传入
                            skin = new skinDefinition();
                            if ( skin.hasOwnProperty( "setSkin" ) ) skin.setSkin( child );
                            mapped[skinName] = skin;
                        }
                    }
                    //Default process
                    if ( child is MovieClip )
                    {
                        (child as MovieClip).gotoAndStop( 1 );
                    }
                }
            }
            if ( mapped.hasOwnProperty( "setSkin" ) ) mapped.setSkin( art );

            System.disposeXML( mappedDescribe );
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
