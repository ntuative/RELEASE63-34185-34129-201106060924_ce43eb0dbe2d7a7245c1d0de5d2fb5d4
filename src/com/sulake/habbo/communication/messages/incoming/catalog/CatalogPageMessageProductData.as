package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_64:String = "i";
      
      public static const const_72:String = "s";
      
      public static const const_181:String = "e";
       
      
      private var var_1404:String;
      
      private var var_2791:int;
      
      private var var_1127:String;
      
      private var var_1403:int;
      
      private var var_1678:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1404 = param1.readString();
         this.var_2791 = param1.readInteger();
         this.var_1127 = param1.readString();
         this.var_1403 = param1.readInteger();
         this.var_1678 = param1.readInteger();
      }
      
      public function get productType() : String
      {
         return this.var_1404;
      }
      
      public function get furniClassId() : int
      {
         return this.var_2791;
      }
      
      public function get extraParam() : String
      {
         return this.var_1127;
      }
      
      public function get productCount() : int
      {
         return this.var_1403;
      }
      
      public function get expiration() : int
      {
         return this.var_1678;
      }
   }
}
