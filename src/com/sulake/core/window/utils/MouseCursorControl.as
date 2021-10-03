package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.MouseCursorType;
   import flash.display.DisplayObject;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.ui.Mouse;
   import flash.ui.MouseCursor;
   import flash.utils.Dictionary;
   
   public class MouseCursorControl
   {
      
      private static var _type:uint = MouseCursorType.const_32;
      
      private static var var_138:Stage;
      
      private static var var_305:Boolean = true;
      
      private static var _disposed:Boolean = false;
      
      private static var var_755:Boolean = true;
      
      private static var var_119:DisplayObject;
      
      private static var var_1447:Dictionary = new Dictionary();
       
      
      public function MouseCursorControl(param1:DisplayObject)
      {
         super();
         var_138 = param1.stage;
      }
      
      public static function dispose() : void
      {
         if(!_disposed)
         {
            if(var_119)
            {
               var_138.removeChild(var_119);
               var_138.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
               var_138.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
               var_138.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
               var_138.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
            }
            _disposed = true;
         }
      }
      
      public static function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public static function get type() : uint
      {
         return _type;
      }
      
      public static function set type(param1:uint) : void
      {
         if(_type != param1)
         {
            _type = param1;
            var_755 = true;
         }
      }
      
      public static function get visible() : Boolean
      {
         return var_305;
      }
      
      public static function set visible(param1:Boolean) : void
      {
         var_305 = param1;
         if(var_305)
         {
            if(var_119)
            {
               var_119.visible = true;
            }
            else
            {
               Mouse.show();
            }
         }
         else if(var_119)
         {
            var_119.visible = false;
         }
         else
         {
            Mouse.hide();
         }
      }
      
      public static function change() : void
      {
         var _loc1_:* = null;
         if(var_755)
         {
            _loc1_ = var_1447[_type];
            if(_loc1_)
            {
               if(var_119)
               {
                  var_138.removeChild(var_119);
               }
               else
               {
                  var_138.addEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_138.addEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_138.addEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_138.addEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  Mouse.hide();
               }
               var_119 = _loc1_;
               var_138.addChild(var_119);
            }
            else
            {
               if(var_119)
               {
                  var_138.removeChild(var_119);
                  var_138.removeEventListener(Event.MOUSE_LEAVE,onStageMouseLeave);
                  var_138.removeEventListener(MouseEvent.MOUSE_MOVE,onStageMouseMove);
                  var_138.removeEventListener(MouseEvent.MOUSE_OVER,onStageMouseMove);
                  var_138.removeEventListener(MouseEvent.MOUSE_OUT,onStageMouseMove);
                  var_119 = null;
                  Mouse.show();
               }
               switch(_type)
               {
                  case MouseCursorType.const_32:
                  case MouseCursorType.ARROW:
                     Mouse.cursor = MouseCursor.ARROW;
                     break;
                  case MouseCursorType.const_354:
                     Mouse.cursor = MouseCursor.BUTTON;
                     break;
                  case MouseCursorType.const_993:
                  case MouseCursorType.const_254:
                  case MouseCursorType.const_1962:
                  case MouseCursorType.const_1756:
                     Mouse.cursor = MouseCursor.HAND;
                     break;
                  case MouseCursorType.NONE:
                     Mouse.cursor = MouseCursor.ARROW;
                     Mouse.hide();
               }
            }
            var_755 = false;
         }
      }
      
      public static function defineCustomCursorType(param1:uint, param2:DisplayObject) : void
      {
         var_1447[param1] = param2;
      }
      
      private static function onStageMouseMove(param1:MouseEvent) : void
      {
         if(var_119)
         {
            var_119.x = param1.stageX - 2;
            var_119.y = param1.stageY;
            if(_type == MouseCursorType.const_32)
            {
               var_305 = false;
               Mouse.show();
            }
            else
            {
               var_305 = true;
               Mouse.hide();
            }
         }
      }
      
      private static function onStageMouseLeave(param1:Event) : void
      {
         if(var_119 && _type != MouseCursorType.const_32)
         {
            Mouse.hide();
            var_305 = false;
         }
      }
   }
}
