package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_795:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_700:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_795);
         this.var_700 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_700;
      }
   }
}
