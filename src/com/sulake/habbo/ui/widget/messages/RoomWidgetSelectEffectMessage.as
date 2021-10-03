package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetSelectEffectMessage extends RoomWidgetMessage
   {
      
      public static const const_784:String = "RWCM_MESSAGE_SELECT_EFFECT";
      
      public static const const_741:String = "RWCM_MESSAGE_UNSELECT_EFFECT";
      
      public static const const_902:String = "RWCM_MESSAGE_UNSELECT_ALL_EFFECTS";
       
      
      private var var_808:int;
      
      public function RoomWidgetSelectEffectMessage(param1:String, param2:int = -1)
      {
         super(param1);
         this.var_808 = param2;
      }
      
      public function get effectType() : int
      {
         return this.var_808;
      }
   }
}
