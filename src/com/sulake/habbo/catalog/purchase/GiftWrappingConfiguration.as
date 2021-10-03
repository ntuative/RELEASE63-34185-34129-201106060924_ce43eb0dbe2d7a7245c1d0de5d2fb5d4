package com.sulake.habbo.catalog.purchase
{
   import com.sulake.habbo.communication.messages.incoming.catalog.GiftWrappingConfigurationEvent;
   import com.sulake.habbo.communication.messages.parser.catalog.GiftWrappingConfigurationParser;
   
   public class GiftWrappingConfiguration
   {
       
      
      private var var_1446:Boolean = false;
      
      private var var_1715:int;
      
      private var var_1817:Array;
      
      private var var_840:Array;
      
      private var var_838:Array;
      
      public function GiftWrappingConfiguration(param1:GiftWrappingConfigurationEvent)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         var _loc2_:GiftWrappingConfigurationParser = param1.getParser();
         if(_loc2_ == null)
         {
            return;
         }
         this.var_1446 = _loc2_.isWrappingEnabled;
         this.var_1715 = _loc2_.wrappingPrice;
         this.var_1817 = _loc2_.stuffTypes;
         this.var_840 = _loc2_.boxTypes;
         this.var_838 = _loc2_.ribbonTypes;
      }
      
      public function get isEnabled() : Boolean
      {
         return this.var_1446;
      }
      
      public function get price() : int
      {
         return this.var_1715;
      }
      
      public function get stuffTypes() : Array
      {
         return this.var_1817;
      }
      
      public function get boxTypes() : Array
      {
         return this.var_840;
      }
      
      public function get ribbonTypes() : Array
      {
         return this.var_838;
      }
   }
}
