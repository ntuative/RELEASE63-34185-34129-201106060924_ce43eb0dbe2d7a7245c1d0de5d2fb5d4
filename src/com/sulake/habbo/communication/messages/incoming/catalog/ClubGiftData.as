package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubGiftData
   {
       
      
      private var var_1290:int;
      
      private var var_2573:Boolean;
      
      private var var_2387:Boolean;
      
      private var var_2574:int;
      
      public function ClubGiftData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1290 = param1.readInteger();
         this.var_2573 = param1.readBoolean();
         this.var_2574 = param1.readInteger();
         this.var_2387 = param1.readBoolean();
      }
      
      public function get offerId() : int
      {
         return this.var_1290;
      }
      
      public function get isVip() : Boolean
      {
         return this.var_2573;
      }
      
      public function get isSelectable() : Boolean
      {
         return this.var_2387;
      }
      
      public function get daysRequired() : int
      {
         return this.var_2574;
      }
   }
}
