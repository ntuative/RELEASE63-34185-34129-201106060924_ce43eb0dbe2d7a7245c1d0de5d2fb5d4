package com.sulake.habbo.room.events
{
   public class RoomEngineObjectPlacedEvent extends RoomEngineObjectEvent
   {
       
      
      private var var_2012:String = "";
      
      private var _x:Number = 0;
      
      private var var_166:Number = 0;
      
      private var var_167:Number = 0;
      
      private var _direction:int = 0;
      
      private var var_2726:Boolean = false;
      
      private var var_2725:Boolean = false;
      
      private var var_2724:Boolean = false;
      
      private var var_2608:String = null;
      
      public function RoomEngineObjectPlacedEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:String, param7:Number, param8:Number, param9:Number, param10:int, param11:Boolean, param12:Boolean, param13:Boolean, param14:String, param15:Boolean = false, param16:Boolean = false)
      {
         super(param1,param2,param3,param4,param5,param15,param16);
         this.var_2012 = param6;
         this._x = param7;
         this.var_166 = param8;
         this.var_167 = param9;
         this._direction = param10;
         this.var_2726 = param11;
         this.var_2725 = param12;
         this.var_2724 = param13;
         this.var_2608 = param14;
      }
      
      public function get wallLocation() : String
      {
         return this.var_2012;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_166;
      }
      
      public function get z() : Number
      {
         return this.var_167;
      }
      
      public function get direction() : int
      {
         return this._direction;
      }
      
      public function get placedInRoom() : Boolean
      {
         return this.var_2726;
      }
      
      public function get placedOnFloor() : Boolean
      {
         return this.var_2725;
      }
      
      public function get placedOnWall() : Boolean
      {
         return this.var_2724;
      }
      
      public function get instanceData() : String
      {
         return this.var_2608;
      }
   }
}
