package com.sulake.habbo.ui.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_796:String = "RWSDPM_SAVE_PRESET";
       
      
      private var var_2331:int;
      
      private var var_2332:int;
      
      private var _color:uint;
      
      private var var_1170:int;
      
      private var var_2330:Boolean;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_796);
         this.var_2331 = param1;
         this.var_2332 = param2;
         this._color = param3;
         this.var_1170 = param4;
         this.var_2330 = param5;
      }
      
      public function get presetNumber() : int
      {
         return this.var_2331;
      }
      
      public function get effectTypeId() : int
      {
         return this.var_2332;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get brightness() : int
      {
         return this.var_1170;
      }
      
      public function get apply() : Boolean
      {
         return this.var_2330;
      }
   }
}
