package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetGetBadgeImageMessage extends RoomWidgetMessage
   {
      
      public static const const_818:String = "RWGOI_MESSAGE_GET_BADGE_IMAGE";
       
      
      private var var_315:String = "";
      
      public function RoomWidgetGetBadgeImageMessage(param1:String)
      {
         super(const_818);
         this.var_315 = param1;
      }
      
      public function get badgeId() : String
      {
         return this.var_315;
      }
   }
}
