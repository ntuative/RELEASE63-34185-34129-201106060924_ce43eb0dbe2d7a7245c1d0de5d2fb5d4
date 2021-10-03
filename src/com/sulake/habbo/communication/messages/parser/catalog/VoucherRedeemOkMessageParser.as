package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoucherRedeemOkMessageParser implements IMessageParser
   {
       
      
      private var var_1049:String = "";
      
      private var var_1287:String = "";
      
      public function VoucherRedeemOkMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1287 = "";
         this.var_1049 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1287 = param1.readString();
         this.var_1049 = param1.readString();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_1049;
      }
      
      public function get productDescription() : String
      {
         return this.var_1287;
      }
   }
}
