package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChangeMottoMessage extends RoomWidgetMessage
   {
      
      public static const const_840:String = "RWVM_CHANGE_MOTTO_MESSAGE";
       
      
      private var var_2075:String;
      
      public function RoomWidgetChangeMottoMessage(param1:String)
      {
         super(const_840);
         this.var_2075 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_2075;
      }
   }
}
