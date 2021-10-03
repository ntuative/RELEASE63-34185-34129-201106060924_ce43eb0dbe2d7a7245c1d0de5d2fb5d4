package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboAchievementBonusMessageParser implements IMessageParser
   {
       
      
      private var var_1546:int;
      
      private var var_2076:String;
      
      public function HabboAchievementBonusMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1546 = param1.readInteger();
         this.var_2076 = param1.readString();
         return true;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1546;
      }
      
      public function get realName() : String
      {
         return this.var_2076;
      }
   }
}
