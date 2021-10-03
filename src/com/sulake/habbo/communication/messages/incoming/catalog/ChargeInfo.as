package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChargeInfo
   {
       
      
      private var var_2546:int;
      
      private var var_2547:int;
      
      private var var_1250:int;
      
      private var var_1248:int;
      
      private var var_1910:int;
      
      private var var_2548:int;
      
      public function ChargeInfo(param1:IMessageDataWrapper)
      {
         super();
         this.var_2546 = param1.readInteger();
         this.var_2547 = param1.readInteger();
         this.var_1250 = param1.readInteger();
         this.var_1248 = param1.readInteger();
         this.var_1910 = param1.readInteger();
         this.var_2548 = param1.readInteger();
      }
      
      public function get stuffId() : int
      {
         return this.var_2546;
      }
      
      public function get charges() : int
      {
         return this.var_2547;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1250;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1248;
      }
      
      public function get chargePatchSize() : int
      {
         return this.var_2548;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1910;
      }
   }
}
