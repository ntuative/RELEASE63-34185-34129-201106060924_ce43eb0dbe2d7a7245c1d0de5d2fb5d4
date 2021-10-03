package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_1290:int;
      
      private var var_1909:String;
      
      private var var_1250:int;
      
      private var var_1248:int;
      
      private var var_1910:int;
      
      private var var_2452:int;
      
      private var var_1360:Array;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1290 = param1.readInteger();
         this.var_1909 = param1.readString();
         this.var_1250 = param1.readInteger();
         this.var_1248 = param1.readInteger();
         this.var_1910 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_1360 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1360.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
         this.var_2452 = param1.readInteger();
      }
      
      public function get offerId() : int
      {
         return this.var_1290;
      }
      
      public function get localizationId() : String
      {
         return this.var_1909;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1250;
      }
      
      public function get priceInActivityPoints() : int
      {
         return this.var_1248;
      }
      
      public function get products() : Array
      {
         return this.var_1360;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1910;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2452;
      }
   }
}
