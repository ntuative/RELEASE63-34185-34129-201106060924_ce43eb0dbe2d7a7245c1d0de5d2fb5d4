package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   
   public class WindowEvent
   {
      
      public static const const_1799:String = "WE_DESTROY";
      
      public static const const_312:String = "WE_DESTROYED";
      
      public static const const_1937:String = "WE_OPEN";
      
      public static const const_1874:String = "WE_OPENED";
      
      public static const const_1824:String = "WE_CLOSE";
      
      public static const const_1830:String = "WE_CLOSED";
      
      public static const const_1724:String = "WE_FOCUS";
      
      public static const const_329:String = "WE_FOCUSED";
      
      public static const const_1797:String = "WE_UNFOCUS";
      
      public static const const_1848:String = "WE_UNFOCUSED";
      
      public static const const_1822:String = "WE_ACTIVATE";
      
      public static const const_615:String = "WE_ACTIVATED";
      
      public static const const_1775:String = "WE_DEACTIVATE";
      
      public static const const_571:String = "WE_DEACTIVATED";
      
      public static const const_335:String = "WE_SELECT";
      
      public static const const_50:String = "WE_SELECTED";
      
      public static const const_555:String = "WE_UNSELECT";
      
      public static const const_496:String = "WE_UNSELECTED";
      
      public static const const_1681:String = "WE_LOCK";
      
      public static const const_1847:String = "WE_LOCKED";
      
      public static const const_1738:String = "WE_UNLOCK";
      
      public static const const_1694:String = "WE_UNLOCKED";
      
      public static const const_891:String = "WE_ENABLE";
      
      public static const const_246:String = "WE_ENABLED";
      
      public static const const_851:String = "WE_DISABLE";
      
      public static const const_264:String = "WE_DISABLED";
      
      public static const WINDOW_EVENT_RELOCATE:String = "WE_RELOCATE";
      
      public static const const_440:String = "WE_RELOCATED";
      
      public static const const_1177:String = "WE_RESIZE";
      
      public static const const_41:String = "WE_RESIZED";
      
      public static const const_1779:String = "WE_MINIMIZE";
      
      public static const const_1746:String = "WE_MINIMIZED";
      
      public static const const_1679:String = "WE_MAXIMIZE";
      
      public static const const_1846:String = "WE_MAXIMIZED";
      
      public static const const_1777:String = "WE_RESTORE";
      
      public static const const_1837:String = "WE_RESTORED";
      
      public static const const_344:String = "WE_CHILD_ADDED";
      
      public static const const_385:String = "WE_CHILD_REMOVED";
      
      public static const const_220:String = "WE_CHILD_RELOCATED";
      
      public static const const_124:String = "WE_CHILD_RESIZED";
      
      public static const const_366:String = "WE_CHILD_ACTIVATED";
      
      public static const const_512:String = "WE_PARENT_ADDED";
      
      public static const const_1924:String = "WE_PARENT_REMOVED";
      
      public static const const_1701:String = "WE_PARENT_RELOCATED";
      
      public static const const_915:String = "WE_PARENT_RESIZED";
      
      public static const const_1272:String = "WE_PARENT_ACTIVATED";
      
      public static const const_178:String = "WE_OK";
      
      public static const const_494:String = "WE_CANCEL";
      
      public static const const_109:String = "WE_CHANGE";
      
      public static const const_637:String = "WE_SCROLL";
      
      public static const const_108:String = "";
      
      private static const POOL:Array = [];
       
      
      protected var _type:String;
      
      protected var _window:IWindow;
      
      protected var var_715:IWindow;
      
      protected var var_1108:Boolean;
      
      protected var var_488:Boolean;
      
      protected var var_494:Boolean;
      
      protected var var_714:Array;
      
      public function WindowEvent()
      {
         super();
      }
      
      public static function allocate(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false) : WindowEvent
      {
         var _loc5_:WindowEvent = POOL.length > 0 ? POOL.pop() : new WindowEvent();
         _loc5_._type = param1;
         _loc5_._window = param2;
         _loc5_.var_715 = param3;
         _loc5_.var_488 = param4;
         _loc5_.var_494 = false;
         _loc5_.var_714 = POOL;
         return _loc5_;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get target() : IWindow
      {
         return this._window;
      }
      
      public function get window() : IWindow
      {
         return this._window;
      }
      
      public function get related() : IWindow
      {
         return this.var_715;
      }
      
      public function get cancelable() : Boolean
      {
         return this.var_488;
      }
      
      public function recycle() : void
      {
         if(this.var_494)
         {
            throw new Error("Event already recycled!");
         }
         this.var_715 = null;
         this._window = null;
         this.var_494 = true;
         this.var_1108 = false;
         this.var_714.push(this);
      }
      
      public function clone() : WindowEvent
      {
         return allocate(this._type,this.window,this.related,this.cancelable);
      }
      
      public function preventDefault() : void
      {
         this.preventWindowOperation();
      }
      
      public function isDefaultPrevented() : Boolean
      {
         return this.var_1108;
      }
      
      public function preventWindowOperation() : void
      {
         if(this.cancelable)
         {
            this.var_1108 = true;
            return;
         }
         throw new Error("Attempted to prevent window operation that is not cancelable!");
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return this.var_1108;
      }
      
      public function stopPropagation() : void
      {
         this.var_1108 = true;
      }
      
      public function stopImmediatePropagation() : void
      {
         this.var_1108 = true;
      }
      
      public function toString() : String
      {
         return "WindowEvent { type: " + this._type + " cancelable: " + this.var_488 + " window: " + this._window + " }";
      }
   }
}
