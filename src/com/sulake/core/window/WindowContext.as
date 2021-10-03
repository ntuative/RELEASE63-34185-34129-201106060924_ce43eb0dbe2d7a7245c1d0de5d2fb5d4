package com.sulake.core.window
{
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.localization.ILocalizable;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.components.DesktopController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.components.SubstituteParentController;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.graphics.IGraphicContextHost;
   import com.sulake.core.window.graphics.IWindowRenderer;
   import com.sulake.core.window.services.IInternalWindowServices;
   import com.sulake.core.window.services.ServiceManager;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventProcessor;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.IWindowParser;
   import com.sulake.core.window.utils.MouseEventProcessor;
   import com.sulake.core.window.utils.MouseEventQueue;
   import com.sulake.core.window.utils.WindowParser;
   import com.sulake.core.window.utils.tablet.TabletEventProcessor;
   import com.sulake.core.window.utils.tablet.TabletEventQueue;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class WindowContext implements IWindowContext, IDisposable, IUpdateReceiver
   {
      
      public static const const_625:uint = 0;
      
      public static const const_1671:uint = 1;
      
      public static const const_2127:int = 0;
      
      public static const const_2092:int = 1;
      
      public static const const_2105:int = 2;
      
      public static const const_2032:int = 3;
      
      public static const const_1944:int = 4;
      
      public static const const_430:int = 5;
      
      public static var var_412:IEventQueue;
      
      private static var var_607:IEventProcessor;
      
      private static var var_1741:uint = const_625;
      
      private static var stage:Stage;
      
      private static var var_168:IWindowRenderer;
       
      
      private var var_2354:EventProcessorState;
      
      private var var_2353:IWindowContextStateListener;
      
      protected var _localization:ICoreLocalizationManager;
      
      protected var var_134:DisplayObjectContainer;
      
      protected var var_3028:Boolean = true;
      
      protected var var_1382:Error;
      
      protected var var_2189:int = -1;
      
      protected var var_1381:IInternalWindowServices;
      
      protected var var_1658:IWindowParser;
      
      protected var var_2972:IWindowFactory;
      
      protected var var_89:IDesktopWindow;
      
      protected var var_1659:SubstituteParentController;
      
      private var _disposed:Boolean = false;
      
      private var var_584:Boolean = false;
      
      private var var_2355:Boolean = false;
      
      private var _name:String;
      
      public function WindowContext(param1:String, param2:IWindowRenderer, param3:IWindowFactory, param4:ICoreLocalizationManager, param5:DisplayObjectContainer, param6:Rectangle, param7:IWindowContextStateListener)
      {
         super();
         this._name = param1;
         var_168 = param2;
         this._localization = param4;
         this.var_134 = param5;
         this.var_1381 = new ServiceManager(this,param5);
         this.var_2972 = param3;
         this.var_1658 = new WindowParser(this);
         this.var_2353 = param7;
         if(!stage)
         {
            if(this.var_134 is Stage)
            {
               stage = this.var_134 as Stage;
            }
            else if(this.var_134.stage)
            {
               stage = this.var_134.stage;
            }
         }
         Classes.init();
         if(param6 == null)
         {
            param6 = new Rectangle(0,0,800,600);
         }
         this.var_89 = new DesktopController("_CONTEXT_DESKTOP_" + this._name,this,param6);
         this.var_89.limits.maxWidth = param6.width;
         this.var_89.limits.maxHeight = param6.height;
         this.var_134.addChild(this.var_89.getDisplayObject());
         this.var_134.doubleClickEnabled = true;
         this.var_134.addEventListener(Event.RESIZE,this.stageResizedHandler);
         this.var_2354 = new EventProcessorState(var_168,this.var_89,this.var_89,null,this.var_2353);
         inputMode = const_625;
         this.var_1659 = new SubstituteParentController(this);
      }
      
      public static function get inputMode() : uint
      {
         return var_1741;
      }
      
      public static function set inputMode(param1:uint) : void
      {
         var value:uint = param1;
         if(var_412)
         {
            if(var_412 is IDisposable)
            {
               IDisposable(var_412).dispose();
            }
         }
         if(var_607)
         {
            if(var_607 is IDisposable)
            {
               IDisposable(var_607).dispose();
            }
         }
         switch(value)
         {
            case const_625:
               var_412 = new MouseEventQueue(stage);
               var_607 = new MouseEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            case const_1671:
               var_412 = new TabletEventQueue(stage);
               var_607 = new TabletEventProcessor();
               try
               {
               }
               catch(e:Error)
               {
               }
               break;
            default:
               inputMode = const_625;
               throw new Error("Unknown input mode " + value);
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_134.removeEventListener(Event.RESIZE,this.stageResizedHandler);
            this.var_134.removeChild(IGraphicContextHost(this.var_89).getGraphicContext(true) as DisplayObject);
            this.var_89.destroy();
            this.var_89 = null;
            this.var_1659.destroy();
            this.var_1659 = null;
            if(this.var_1381 is IDisposable)
            {
               IDisposable(this.var_1381).dispose();
            }
            this.var_1381 = null;
            this.var_1658.dispose();
            this.var_1658 = null;
            var_168 = null;
         }
      }
      
      public function getLastError() : Error
      {
         return this.var_1382;
      }
      
      public function getLastErrorCode() : int
      {
         return this.var_2189;
      }
      
      public function handleError(param1:int, param2:Error) : void
      {
         this.var_1382 = param2;
         this.var_2189 = param1;
         if(this.var_3028)
         {
            throw param2;
         }
      }
      
      public function flushError() : void
      {
         this.var_1382 = null;
         this.var_2189 = -1;
      }
      
      public function getWindowServices() : IInternalWindowServices
      {
         return this.var_1381;
      }
      
      public function getWindowParser() : IWindowParser
      {
         return this.var_1658;
      }
      
      public function getWindowFactory() : IWindowFactory
      {
         return this.var_2972;
      }
      
      public function getDesktopWindow() : IDesktopWindow
      {
         return this.var_89;
      }
      
      public function findWindowByName(param1:String) : IWindow
      {
         return this.var_89.findChildByName(param1);
      }
      
      public function registerLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.registerListener(param1,param2 as ILocalizable);
      }
      
      public function removeLocalizationListener(param1:String, param2:IWindow) : void
      {
         this._localization.removeListener(param1,param2 as ILocalizable);
      }
      
      public function create(param1:String, param2:String, param3:uint, param4:uint, param5:uint, param6:Rectangle, param7:Function, param8:IWindow, param9:uint, param10:Array = null, param11:Array = null) : IWindow
      {
         var _loc12_:* = null;
         var _loc13_:Class = Classes.getWindowClassByType(param3);
         if(_loc13_ == null)
         {
            this.handleError(WindowContext.const_1944,new Error("Failed to solve implementation for window \"" + param1 + "\"!"));
            return null;
         }
         if(param8 == null)
         {
            if(param5 & 0)
            {
               param8 = this.var_1659;
            }
         }
         _loc12_ = new _loc13_(param1,param3,param4,param5,this,param6,param8 != null ? param8 : this.var_89,param7,param10,param11,param9);
         if(param2 && param2.length)
         {
            _loc12_.caption = param2;
         }
         return _loc12_;
      }
      
      public function destroy(param1:IWindow) : Boolean
      {
         if(param1 == this.var_89)
         {
            this.var_89 = null;
         }
         if(param1.state != WindowState.const_598)
         {
            param1.destroy();
         }
         return true;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         if(!this.disposed)
         {
            var_168.addToRenderQueue(WindowController(param1),param2,param3);
         }
      }
      
      public function update(param1:uint) : void
      {
         this.var_584 = true;
         if(this.var_1382)
         {
            throw this.var_1382;
         }
         var_607.process(this.var_2354,var_412);
         this.var_584 = false;
      }
      
      public function render(param1:uint) : void
      {
         this.var_2355 = true;
         var_168.update(param1);
         this.var_2355 = false;
      }
      
      private function stageResizedHandler(param1:Event) : void
      {
         if(this.var_89 != null && !this.var_89.disposed)
         {
            if(this.var_134 is Stage)
            {
               this.var_89.limits.maxWidth = Stage(this.var_134).stageWidth;
               this.var_89.limits.maxHeight = Stage(this.var_134).stageHeight;
               this.var_89.width = Stage(this.var_134).stageWidth;
               this.var_89.height = Stage(this.var_134).stageHeight;
            }
            else
            {
               this.var_89.limits.maxWidth = this.var_134.width;
               this.var_89.limits.maxHeight = this.var_134.height;
               this.var_89.width = this.var_134.width;
               this.var_89.height = this.var_134.height;
            }
         }
      }
   }
}
