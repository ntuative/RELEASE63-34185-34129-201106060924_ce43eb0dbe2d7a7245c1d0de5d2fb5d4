package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PresentOpenMessageComposer implements IMessageComposer
   {
       
      
      private var var_222:int;
      
      public function PresentOpenMessageComposer(param1:int)
      {
         super();
         this.var_222 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_222];
      }
   }
}
