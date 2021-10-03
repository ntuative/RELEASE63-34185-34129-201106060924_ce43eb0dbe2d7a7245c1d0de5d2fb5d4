package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceBuyOfferResultParser implements IMessageParser
   {
       
      
      private var _result:int;
      
      private var var_2722:int = -1;
      
      private var var_2720:int = -1;
      
      private var var_2721:int = -1;
      
      public function MarketplaceBuyOfferResultParser()
      {
         super();
      }
      
      public function get result() : int
      {
         return this._result;
      }
      
      public function get offerId() : int
      {
         return this.var_2722;
      }
      
      public function get newPrice() : int
      {
         return this.var_2720;
      }
      
      public function get requestedOfferId() : int
      {
         return this.var_2721;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._result = param1.readInteger();
         this.var_2722 = param1.readInteger();
         this.var_2720 = param1.readInteger();
         this.var_2721 = param1.readInteger();
         return true;
      }
   }
}
