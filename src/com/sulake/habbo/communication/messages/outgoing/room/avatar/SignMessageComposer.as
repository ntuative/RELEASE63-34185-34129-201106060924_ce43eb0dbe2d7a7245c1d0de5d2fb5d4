package com.sulake.habbo.communication.messages.outgoing.room.avatar
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class SignMessageComposer implements IMessageComposer
   {
       
      
      private var var_2717:int;
      
      public function SignMessageComposer(param1:int)
      {
         super();
         this.var_2717 = param1;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2717];
      }
      
      public function dispose() : void
      {
      }
   }
}
