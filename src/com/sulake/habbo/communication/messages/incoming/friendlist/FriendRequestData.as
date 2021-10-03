package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendRequestData
   {
       
      
      private var var_1327:int;
      
      private var var_2358:String;
      
      private var var_2359:int;
      
      public function FriendRequestData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1327 = param1.readInteger();
         this.var_2358 = param1.readString();
         this.var_2359 = int(param1.readString());
      }
      
      public function get requestId() : int
      {
         return this.var_1327;
      }
      
      public function get requesterName() : String
      {
         return this.var_2358;
      }
      
      public function get method_5() : int
      {
         return this.var_2359;
      }
   }
}
