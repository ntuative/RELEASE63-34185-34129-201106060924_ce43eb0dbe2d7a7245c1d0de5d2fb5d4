package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RequestSpamWallPostItMessageParser implements IMessageParser
   {
       
      
      private var var_1942:int;
      
      private var var_477:String;
      
      public function RequestSpamWallPostItMessageParser()
      {
         super();
      }
      
      public function get itemId() : int
      {
         return this.var_1942;
      }
      
      public function get location() : String
      {
         return this.var_477;
      }
      
      public function flush() : Boolean
      {
         this.var_1942 = -1;
         this.var_477 = "";
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1942 = param1.readInteger();
         this.var_477 = param1.readString();
         return true;
      }
   }
}
