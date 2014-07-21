/**
 * User: Ray Yee
 * Date: 2014/4/19
 * All rights reserved.
 */
package common.ui.utility
{
    import flash.display.DisplayObject;
    import flash.display.DisplayObjectContainer;
    import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.display.Stage;
    import flash.events.Event;

    /**
     * 窗口模态化的工厂
     */
    public class ModalFactory
    {
        private static var depends:*;
        private static var modal:Sprite;
        private static var currentStage:Stage;

        /**
         * Engine初始化时调用
         * @param s
         */
        public static function initialize( s:Stage ):void
        {
            currentStage = s;
            s.addEventListener( Event.RESIZE, onStageResize );
            function onStageResize( e:Event ):void
            {
                modal.width = s.stageWidth;
                modal.height = s.stageHeight;
            }
        }

        /**
         * 释放模态
         * @param value
         */
        public static function releaseModal( value:DisplayObject ):void
        {
            if ( depends == value )
            {
                modal.visible = false;
            }
        }

        /**
         * 给指定的一个窗口对象模态化
         * @param value
         * @return
         */
        public static function getModal( value:* ):Sprite
        {
            var shape:Sprite;
            if ( modal != null )
            {
                shape = modal;
                shape.visible = true;
            }
            else
            {
                shape = new Sprite();
                modal = shape;
                var g:Graphics = shape.graphics;
                g.beginFill( 0x000000, .3 );
                g.drawRect( 0, 0, 100, 100 );
                g.endFill();
                shape.width = currentStage.stageWidth;
                shape.height = currentStage.stageHeight;
            }
            depends = value;
            var container:DisplayObjectContainer = value.parent;
            var index:int = container.getChildIndex( value );
            container.addChildAt( shape, index - 1 );
            return shape;
        }
    }
}
