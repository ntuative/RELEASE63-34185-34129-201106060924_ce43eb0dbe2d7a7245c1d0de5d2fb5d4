package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1300:String;
      
      private var var_1497:Array;
      
      private var var_1359:Array;
      
      private var var_1844:int;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get question() : String
      {
         return this.var_1300;
      }
      
      public function get choices() : Array
      {
         return this.var_1497.slice();
      }
      
      public function get votes() : Array
      {
         return this.var_1359.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1844;
      }
      
      public function flush() : Boolean
      {
         this.var_1300 = "";
         this.var_1497 = [];
         this.var_1359 = [];
         this.var_1844 = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1300 = param1.readString();
         this.var_1497 = [];
         this.var_1359 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1497.push(param1.readString());
            this.var_1359.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1844 = param1.readInteger();
         return true;
      }
   }
}