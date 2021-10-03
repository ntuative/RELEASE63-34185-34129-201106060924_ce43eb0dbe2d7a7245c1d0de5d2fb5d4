package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1898:String = "pricing_model_unknown";
      
      public static const const_416:String = "pricing_model_single";
      
      public static const const_452:String = "pricing_model_multi";
      
      public static const const_635:String = "pricing_model_bundle";
      
      public static const const_1935:String = "price_type_none";
      
      public static const const_734:String = "price_type_credits";
      
      public static const const_1356:String = "price_type_activitypoints";
      
      public static const const_1198:String = "price_type_credits_and_activitypoints";
       
      
      private var var_814:String;
      
      private var var_1249:String;
      
      private var var_1290:int;
      
      private var var_1909:String;
      
      private var var_1250:int;
      
      private var var_1248:int;
      
      private var var_1910:int;
      
      private var var_370:ICatalogPage;
      
      private var var_663:IProductContainer;
      
      private var _disposed:Boolean = false;
      
      private var var_2452:int = 0;
      
      private var var_2631:int;
      
      public function Offer(param1:int, param2:String, param3:int, param4:int, param5:int, param6:int, param7:Array, param8:ICatalogPage)
      {
         super();
         this.var_1290 = param1;
         this.var_1909 = param2;
         this.var_1250 = param3;
         this.var_1248 = param4;
         this.var_1910 = param5;
         this.var_370 = param8;
         this.var_2452 = param6;
         this.analyzePricingModel(param7);
         this.analyzePriceType();
         this.createProductContainer(param7);
      }
      
      public function get clubLevel() : int
      {
         return this.var_2452;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_370;
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
      
      public function get activityPointType() : int
      {
         return this.var_1910;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_663;
      }
      
      public function get pricingModel() : String
      {
         return this.var_814;
      }
      
      public function get priceType() : String
      {
         return this.var_1249;
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_2631;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_2631 = param1;
      }
      
      public function dispose() : void
      {
         if(this.disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_1290 = 0;
         this.var_1909 = "";
         this.var_1250 = 0;
         this.var_1248 = 0;
         this.var_1910 = 0;
         this.var_370 = null;
         if(this.var_663 != null)
         {
            this.var_663.dispose();
            this.var_663 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_814)
         {
            case const_416:
               this.var_663 = new SingleProductContainer(this,param1);
               break;
            case const_452:
               this.var_663 = new MultiProductContainer(this,param1);
               break;
            case const_635:
               this.var_663 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_814);
         }
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_814 = const_416;
            }
            else
            {
               this.var_814 = const_452;
            }
         }
         else if(param1.length > 1)
         {
            this.var_814 = const_635;
         }
         else
         {
            this.var_814 = const_1898;
         }
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_1250 > 0 && this.var_1248 > 0)
         {
            this.var_1249 = const_1198;
         }
         else if(this.var_1250 > 0)
         {
            this.var_1249 = const_734;
         }
         else if(this.var_1248 > 0)
         {
            this.var_1249 = const_1356;
         }
         else
         {
            this.var_1249 = const_1935;
         }
      }
      
      public function clone() : Offer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc1_:Array = new Array();
         var _loc2_:IProductData = this.var_370.viewer.catalog.getProductData(this.localizationId);
         for each(_loc3_ in this.var_663.products)
         {
            _loc4_ = this.var_370.viewer.catalog.getFurnitureData(_loc3_.productClassId,_loc3_.productType);
            _loc5_ = new Product(_loc3_.productType,_loc3_.productClassId,_loc3_.extraParam,_loc3_.productCount,_loc3_.expiration,_loc2_,_loc4_);
            _loc1_.push(_loc5_);
         }
         return new Offer(this.offerId,this.localizationId,this.priceInCredits,this.priceInActivityPoints,this.activityPointType,this.clubLevel,_loc1_,this.page);
      }
   }
}
