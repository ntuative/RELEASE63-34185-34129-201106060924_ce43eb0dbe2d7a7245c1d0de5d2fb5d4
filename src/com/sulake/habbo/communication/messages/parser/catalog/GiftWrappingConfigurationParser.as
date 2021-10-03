package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class GiftWrappingConfigurationParser implements IMessageParser
   {
       
      
      private var var_2466:Boolean;
      
      private var var_2465:int;
      
      private var var_1817:Array;
      
      private var var_840:Array;
      
      private var var_838:Array;
      
      public function GiftWrappingConfigurationParser()
      {
         super();
      }
      
      public function get isWrappingEnabled() : Boolean
      {
         return this.var_2466;
      }
      
      public function get wrappingPrice() : int
      {
         return this.var_2465;
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
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = 0;
         this.var_1817 = [];
         this.var_840 = [];
         this.var_838 = [];
         this.var_2466 = param1.readBoolean();
         this.var_2465 = param1.readInteger();
         var _loc3_:int = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_1817.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_840.push(param1.readInteger());
            _loc2_++;
         }
         _loc3_ = param1.readInteger();
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            this.var_838.push(param1.readInteger());
            _loc2_++;
         }
         return true;
      }
   }
}
