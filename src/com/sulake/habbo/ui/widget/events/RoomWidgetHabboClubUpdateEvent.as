package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_294:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2812:int = 0;
      
      private var var_2813:int = 0;
      
      private var var_2811:int = 0;
      
      private var var_2814:Boolean = false;
      
      private var var_2452:int;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_294,param6,param7);
         this.var_2812 = param1;
         this.var_2813 = param2;
         this.var_2811 = param3;
         this.var_2814 = param4;
         this.var_2452 = param5;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2812;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2813;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2811;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2814;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2452;
      }
   }
}
