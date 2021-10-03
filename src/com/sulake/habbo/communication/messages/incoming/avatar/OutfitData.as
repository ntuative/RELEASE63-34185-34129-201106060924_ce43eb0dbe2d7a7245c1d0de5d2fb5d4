package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_1752:int;
      
      private var var_2272:String;
      
      private var var_931:String;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1752 = param1.readInteger();
         this.var_2272 = param1.readString();
         this.var_931 = param1.readString();
      }
      
      public function get slotId() : int
      {
         return this.var_1752;
      }
      
      public function get figureString() : String
      {
         return this.var_2272;
      }
      
      public function get gender() : String
      {
         return this.var_931;
      }
   }
}
