package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class LatencyPingReportMessageComposer implements IMessageComposer
   {
       
      
      private var var_2598:int;
      
      private var var_2599:int;
      
      private var var_2600:int;
      
      public function LatencyPingReportMessageComposer(param1:int, param2:int, param3:int)
      {
         super();
         this.var_2598 = param1;
         this.var_2599 = param2;
         this.var_2600 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2598,this.var_2599,this.var_2600];
      }
      
      public function dispose() : void
      {
      }
   }
}
