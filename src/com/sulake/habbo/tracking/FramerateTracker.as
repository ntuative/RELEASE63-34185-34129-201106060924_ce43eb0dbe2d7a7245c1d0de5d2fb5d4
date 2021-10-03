package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class FramerateTracker
   {
       
      
      private var var_1946:int;
      
      private var var_2698:int;
      
      private var var_774:int;
      
      private var var_547:Number;
      
      private var var_2699:Boolean;
      
      private var var_2697:int;
      
      private var var_1954:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function get frameRate() : int
      {
         return Math.round(1000 / this.var_547);
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2698 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2697 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2699 = true;
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking, param3:int) : void
      {
         var _loc4_:Number = NaN;
         ++this.var_774;
         if(this.var_774 == 1)
         {
            this.var_547 = param1;
            this.var_1946 = param3;
         }
         else
         {
            _loc4_ = Number(this.var_774);
            this.var_547 = this.var_547 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2699 && param3 - this.var_1946 >= this.var_2698)
         {
            this.var_774 = 0;
            if(this.var_1954 < this.var_2697)
            {
               param2.trackGoogle("performance","averageFramerate",this.frameRate);
               ++this.var_1954;
               this.var_1946 = param3;
            }
         }
      }
      
      public function dispose() : void
      {
      }
   }
}
