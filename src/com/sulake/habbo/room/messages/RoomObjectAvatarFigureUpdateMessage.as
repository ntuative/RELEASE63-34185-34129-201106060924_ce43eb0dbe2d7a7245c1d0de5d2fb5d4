package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_611:String;
      
      private var var_2295:String;
      
      private var var_931:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = null, param3:String = null)
      {
         super();
         this.var_611 = param1;
         this.var_931 = param2;
         this.var_2295 = param3;
      }
      
      public function get figure() : String
      {
         return this.var_611;
      }
      
      public function get race() : String
      {
         return this.var_2295;
      }
      
      public function get gender() : String
      {
         return this.var_931;
      }
   }
}
