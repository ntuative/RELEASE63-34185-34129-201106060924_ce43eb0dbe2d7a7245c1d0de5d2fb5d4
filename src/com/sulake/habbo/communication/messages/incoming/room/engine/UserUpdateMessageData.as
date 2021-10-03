package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_166:Number = 0;
      
      private var var_167:Number = 0;
      
      private var var_2491:Number = 0;
      
      private var var_2489:Number = 0;
      
      private var var_2493:Number = 0;
      
      private var var_2492:Number = 0;
      
      private var var_478:int = 0;
      
      private var var_2488:int = 0;
      
      private var var_344:Array;
      
      private var var_2490:Boolean = false;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_344 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_166 = param3;
         this.var_167 = param4;
         this.var_2491 = param5;
         this.var_478 = param6;
         this.var_2488 = param7;
         this.var_2489 = param8;
         this.var_2493 = param9;
         this.var_2492 = param10;
         this.var_2490 = param11;
         this.var_344 = param12;
      }
      
      public function get id() : int
      {
         return this._id;
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
      
      public function get localZ() : Number
      {
         return this.var_2491;
      }
      
      public function get targetX() : Number
      {
         return this.var_2489;
      }
      
      public function get targetY() : Number
      {
         return this.var_2493;
      }
      
      public function get targetZ() : Number
      {
         return this.var_2492;
      }
      
      public function get dir() : int
      {
         return this.var_478;
      }
      
      public function get dirHead() : int
      {
         return this.var_2488;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_2490;
      }
      
      public function get actions() : Array
      {
         return this.var_344.slice();
      }
   }
}
