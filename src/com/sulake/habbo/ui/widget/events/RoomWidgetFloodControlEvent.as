package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetFloodControlEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_935:String = "RWFCE_FLOOD_CONTROL";
       
      
      private var var_1842:int = 0;
      
      public function RoomWidgetFloodControlEvent(param1:int)
      {
         super(const_935,false,false);
         this.var_1842 = param1;
      }
      
      public function get seconds() : int
      {
         return this.var_1842;
      }
   }
}
