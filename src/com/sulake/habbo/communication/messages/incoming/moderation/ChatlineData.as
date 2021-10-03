package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_2658:int;
      
      private var var_2655:int;
      
      private var var_2657:int;
      
      private var var_2656:String;
      
      private var var_1962:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2658 = param1.readInteger();
         this.var_2655 = param1.readInteger();
         this.var_2657 = param1.readInteger();
         this.var_2656 = param1.readString();
         this.var_1962 = param1.readString();
      }
      
      public function get hour() : int
      {
         return this.var_2658;
      }
      
      public function get minute() : int
      {
         return this.var_2655;
      }
      
      public function get chatterId() : int
      {
         return this.var_2657;
      }
      
      public function get chatterName() : String
      {
         return this.var_2656;
      }
      
      public function get msg() : String
      {
         return this.var_1962;
      }
   }
}
