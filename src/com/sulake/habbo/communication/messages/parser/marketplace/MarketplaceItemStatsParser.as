package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_2288:int;
      
      private var var_2457:int;
      
      private var var_2455:int;
      
      private var _dayOffsets:Array;
      
      private var var_1833:Array;
      
      private var var_1832:Array;
      
      private var var_2458:int;
      
      private var var_2456:int;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get averagePrice() : int
      {
         return this.var_2288;
      }
      
      public function get offerCount() : int
      {
         return this.var_2457;
      }
      
      public function get historyLength() : int
      {
         return this.var_2455;
      }
      
      public function get dayOffsets() : Array
      {
         return this._dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return this.var_1833;
      }
      
      public function get soldAmounts() : Array
      {
         return this.var_1832;
      }
      
      public function get furniTypeId() : int
      {
         return this.var_2458;
      }
      
      public function get furniCategoryId() : int
      {
         return this.var_2456;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2288 = param1.readInteger();
         this.var_2457 = param1.readInteger();
         this.var_2455 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this._dayOffsets = [];
         this.var_1833 = [];
         this.var_1832 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this._dayOffsets.push(param1.readInteger());
            this.var_1833.push(param1.readInteger());
            this.var_1832.push(param1.readInteger());
            _loc3_++;
         }
         this.var_2456 = param1.readInteger();
         this.var_2458 = param1.readInteger();
         return true;
      }
   }
}
