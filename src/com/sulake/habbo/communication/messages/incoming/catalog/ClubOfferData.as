package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1290:int;
      
      private var var_1681:String;
      
      private var var_1715:int;
      
      private var _upgrade:Boolean;
      
      private var var_2304:Boolean;
      
      private var var_2301:int;
      
      private var var_2302:int;
      
      private var var_2300:int;
      
      private var var_2306:int;
      
      private var var_2305:int;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1290 = param1.readInteger();
         this.var_1681 = param1.readString();
         this.var_1715 = param1.readInteger();
         this._upgrade = param1.readBoolean();
         this.var_2304 = param1.readBoolean();
         this.var_2301 = param1.readInteger();
         this.var_2302 = param1.readInteger();
         this.var_2300 = param1.readInteger();
         this.var_2306 = param1.readInteger();
         this.var_2305 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1290;
      }
      
      public function get productCode() : String
      {
         return this.var_1681;
      }
      
      public function get price() : int
      {
         return this.var_1715;
      }
      
      public function get upgrade() : Boolean
      {
         return this._upgrade;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2304;
      }
      
      public function get periods() : int
      {
         return this.var_2301;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2302;
      }
      
      public function get year() : int
      {
         return this.var_2300;
      }
      
      public function get month() : int
      {
         return this.var_2306;
      }
      
      public function get day() : int
      {
         return this.var_2305;
      }
   }
}
