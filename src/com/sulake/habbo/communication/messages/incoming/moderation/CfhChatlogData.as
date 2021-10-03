package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1958:int;
      
      private var var_2700:int;
      
      private var var_1598:int;
      
      private var var_2370:int;
      
      private var var_130:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1958 = param1.readInteger();
         this.var_2700 = param1.readInteger();
         this.var_1598 = param1.readInteger();
         this.var_2370 = param1.readInteger();
         this.var_130 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + this.var_1958);
      }
      
      public function get callId() : int
      {
         return this.var_1958;
      }
      
      public function get callerUserId() : int
      {
         return this.var_2700;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1598;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2370;
      }
      
      public function get room() : RoomChatlogData
      {
         return this.var_130;
      }
   }
}
