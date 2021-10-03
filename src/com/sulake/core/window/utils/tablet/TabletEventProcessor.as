package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_3046:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         if(param2.length == 0)
         {
            return;
         }
         var_89 = param1.desktop;
         var_68 = param1.var_1372 as WindowController;
         var_179 = param1.var_1373 as WindowController;
         var_168 = param1.renderer;
         var_900 = param1.var_1371;
         param2.begin();
         param2.end();
         param1.desktop = var_89;
         param1.var_1372 = var_68;
         param1.var_1373 = var_179;
         param1.renderer = var_168;
         param1.var_1371 = var_900;
      }
   }
}
