package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1734:int = 0;
      
      private var var_1733:int = 0;
      
      private var var_1910:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughCredits() : int
      {
         return this.var_1734;
      }
      
      public function get notEnoughActivityPoints() : int
      {
         return this.var_1733;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1910;
      }
      
      public function flush() : Boolean
      {
         this.var_1734 = 0;
         this.var_1733 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1734 = param1.readInteger();
         this.var_1733 = param1.readInteger();
         this.var_1910 = param1.readInteger();
         return true;
      }
   }
}
