package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.purse.ActivityPointTypeEnum;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_1290:int;
      
      private var var_1681:String;
      
      private var var_1715:int;
      
      private var _upgrade:Boolean;
      
      private var var_2304:Boolean;
      
      private var var_2301:int;
      
      private var var_2302:int;
      
      private var var_370:ICatalogPage;
      
      private var var_2300:int;
      
      private var var_2306:int;
      
      private var var_2305:int;
      
      private var var_1585:String;
      
      private var var_2303:Boolean = false;
      
      private var _disposed:Boolean = false;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this.var_1290 = param1;
         this.var_1681 = param2;
         this.var_1715 = param3;
         this._upgrade = param4;
         this.var_2304 = param5;
         this.var_2301 = param6;
         this.var_2302 = param7;
         this.var_2300 = param8;
         this.var_2306 = param9;
         this.var_2305 = param10;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_370 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get extraParameter() : String
      {
         return this.var_1585;
      }
      
      public function set extraParameter(param1:String) : void
      {
         this.var_1585 = param1;
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
      
      public function get priceInActivityPoints() : int
      {
         return 0;
      }
      
      public function get activityPointType() : int
      {
         return ActivityPointTypeEnum.PIXEL;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1715;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_370;
      }
      
      public function get priceType() : String
      {
         return Offer.const_734;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get localizationId() : String
      {
         return this.var_1681;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_370 = param1;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2303;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2303 = param1;
      }
   }
}
