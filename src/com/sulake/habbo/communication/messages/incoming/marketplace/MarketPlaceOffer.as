package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1290:int;
      
      private var _furniId:int;
      
      private var var_2287:int;
      
      private var var_2200:String;
      
      private var var_1715:int;
      
      private var var_415:int;
      
      private var var_2285:int = -1;
      
      private var var_2288:int;
      
      private var var_1716:int;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this.var_1290 = param1;
         this._furniId = param2;
         this.var_2287 = param3;
         this.var_2200 = param4;
         this.var_1715 = param5;
         this.var_415 = param6;
         this.var_2285 = param7;
         this.var_2288 = param8;
         this.var_1716 = param9;
      }
      
      public function get offerId() : int
      {
         return this.var_1290;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_2287;
      }
      
      public function get stuffData() : String
      {
         return this.var_2200;
      }
      
      public function get price() : int
      {
         return this.var_1715;
      }
      
      public function get status() : int
      {
         return this.var_415;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2285;
      }
      
      public function get averagePrice() : int
      {
         return this.var_2288;
      }
      
      public function get offerCount() : int
      {
         return this.var_1716;
      }
   }
}
