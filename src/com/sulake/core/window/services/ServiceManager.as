package com.sulake.core.window.services
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices, IDisposable
   {
       
      
      private var var_3014:uint;
      
      private var var_155:DisplayObject;
      
      private var _disposed:Boolean = false;
      
      private var var_280:IWindowContext;
      
      private var var_1266:IMouseDraggingService;
      
      private var var_1264:IMouseScalingService;
      
      private var var_1265:IMouseListenerService;
      
      private var var_1268:IFocusManagerService;
      
      private var var_1263:IToolTipAgentService;
      
      private var var_1267:IGestureAgentService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_3014 = 0;
         this.var_155 = param2;
         this.var_280 = param1;
         this.var_1266 = new WindowMouseDragger(param2);
         this.var_1264 = new WindowMouseScaler(param2);
         this.var_1265 = new WindowMouseListener(param2);
         this.var_1268 = new FocusManager(param2);
         this.var_1263 = new WindowToolTipAgent(param2);
         this.var_1267 = new GestureAgentService();
      }
      
      public function dispose() : void
      {
         if(this.var_1266 != null)
         {
            this.var_1266.dispose();
            this.var_1266 = null;
         }
         if(this.var_1264 != null)
         {
            this.var_1264.dispose();
            this.var_1264 = null;
         }
         if(this.var_1265 != null)
         {
            this.var_1265.dispose();
            this.var_1265 = null;
         }
         if(this.var_1268 != null)
         {
            this.var_1268.dispose();
            this.var_1268 = null;
         }
         if(this.var_1263 != null)
         {
            this.var_1263.dispose();
            this.var_1263 = null;
         }
         if(this.var_1267 != null)
         {
            this.var_1267.dispose();
            this.var_1267 = null;
         }
         this.var_155 = null;
         this.var_280 = null;
         this._disposed = true;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_1266;
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_1264;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_1265;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_1268;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_1263;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_1267;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
   }
}
