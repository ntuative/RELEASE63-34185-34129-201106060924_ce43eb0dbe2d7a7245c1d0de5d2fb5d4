package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetViralFurniMessage extends RoomWidgetMessage
   {
      
      public static const const_772:String = "RWVFM_VIRAL_FOUND";
      
      public static const const_177:String = "RWVFM_OPEN_PRESENT";
       
      
      private var var_222:int;
      
      public function RoomWidgetViralFurniMessage(param1:String)
      {
         super(param1);
      }
      
      public function get objectId() : int
      {
         return this.var_222;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_222 = param1;
      }
   }
}
