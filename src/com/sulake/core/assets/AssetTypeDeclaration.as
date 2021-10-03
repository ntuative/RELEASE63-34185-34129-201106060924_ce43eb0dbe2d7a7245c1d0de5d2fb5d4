package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2739:String;
      
      private var var_2741:Class;
      
      private var var_2740:Class;
      
      private var var_1987:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2739 = param1;
         this.var_2741 = param2;
         this.var_2740 = param3;
         if(rest == null)
         {
            this.var_1987 = new Array();
         }
         else
         {
            this.var_1987 = rest;
         }
      }
      
      public function get mimeType() : String
      {
         return this.var_2739;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2741;
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2740;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1987;
      }
   }
}
