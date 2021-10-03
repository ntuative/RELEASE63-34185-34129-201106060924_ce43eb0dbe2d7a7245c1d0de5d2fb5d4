package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData implements IMarketPlaceOfferData
   {
      
      public static const const_112:int = 1;
      
      public static const const_75:int = 2;
       
      
      private var var_1290:int;
      
      private var _furniId:int;
      
      private var var_2287:int;
      
      private var var_2200:String;
      
      private var var_1715:int;
      
      private var var_2288:int;
      
      private var var_2286:int;
      
      private var var_415:int;
      
      private var var_2285:int = -1;
      
      private var var_1716:int;
      
      private var var_46:BitmapData;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this.var_1290 = param1;
         this._furniId = param2;
         this.var_2287 = param3;
         this.var_2200 = param4;
         this.var_1715 = param5;
         this.var_415 = param6;
         this.var_2288 = param7;
         this.var_1716 = param8;
      }
      
      public function dispose() : void
      {
         if(this.var_46)
         {
            this.var_46.dispose();
            this.var_46 = null;
         }
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
      
      public function get averagePrice() : int
      {
         return this.var_2288;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_46 != null)
         {
            this.var_46.dispose();
         }
         this.var_46 = param1;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_2286 = param1;
      }
      
      public function get imageCallback() : int
      {
         return this.var_2286;
      }
      
      public function get status() : int
      {
         return this.var_415;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_2285;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_2285 = param1;
      }
      
      public function set price(param1:int) : void
      {
         this.var_1715 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this.var_1290 = param1;
      }
      
      public function get offerCount() : int
      {
         return this.var_1716;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1716 = param1;
      }
   }
}
