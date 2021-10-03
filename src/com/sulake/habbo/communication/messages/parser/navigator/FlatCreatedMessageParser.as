package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCreatedMessageParser implements IMessageParser
   {
       
      
      private var var_383:int;
      
      private var var_1904:String;
      
      public function FlatCreatedMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_383 = param1.readInteger();
         this.var_1904 = param1.readString();
         Logger.log("FLAT CREATED: " + this.var_383 + ", " + this.var_1904);
         return true;
      }
      
      public function get flatId() : int
      {
         return this.var_383;
      }
      
      public function get flatName() : String
      {
         return this.var_1904;
      }
   }
}
