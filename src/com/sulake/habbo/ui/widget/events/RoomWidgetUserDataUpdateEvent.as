package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetUserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_120:String = "rwudue_user_data_updated";
       
      
      public function RoomWidgetUserDataUpdateEvent(param1:Boolean = false, param2:Boolean = false)
      {
         super(const_120,param1,param2);
      }
   }
}
