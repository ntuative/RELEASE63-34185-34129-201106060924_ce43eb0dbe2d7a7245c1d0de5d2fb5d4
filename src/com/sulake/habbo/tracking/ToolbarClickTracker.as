package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1402:IHabboTracking;
      
      private var var_1744:Boolean = false;
      
      private var var_2861:int = 0;
      
      private var var_2087:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1402 = param1;
      }
      
      public function dispose() : void
      {
         this.var_1402 = null;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1744 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2861 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1744)
         {
            return;
         }
         ++this.var_2087;
         if(this.var_2087 <= this.var_2861)
         {
            this.var_1402.trackGoogle("toolbar",param1);
         }
      }
   }
}
