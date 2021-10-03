package com.sulake.habbo.communication.messages.parser.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestsMessageParser implements IMessageParser
   {
       
      
      private var var_1279:Array;
      
      private var var_2675:Boolean;
      
      public function QuestsMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var _loc1_:* = null;
         if(this.var_1279)
         {
            for each(_loc1_ in this.var_1279)
            {
               _loc1_.dispose();
            }
         }
         this.var_1279 = [];
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_1279.push(new QuestMessageData(param1));
            _loc3_++;
         }
         this.var_2675 = param1.readBoolean();
         return true;
      }
      
      public function get quests() : Array
      {
         return this.var_1279;
      }
      
      public function get openWindow() : Boolean
      {
         return this.var_2675;
      }
   }
}
