package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_904:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_1240:String = "inventory_effects";
      
      public static const const_1258:String = "inventory_badges";
      
      public static const const_1707:String = "inventory_clothes";
      
      public static const const_1949:String = "inventory_furniture";
       
      
      private var var_2942:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_904);
         this.var_2942 = param1;
      }
      
      public function get inventoryType() : String
      {
         return this.var_2942;
      }
   }
}
