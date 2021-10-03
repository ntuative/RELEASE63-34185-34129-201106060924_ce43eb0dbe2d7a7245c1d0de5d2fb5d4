package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_2652:Number = 0.0;
      
      private var var_2650:Number = 0.0;
      
      private var var_2649:Number = 0.0;
      
      private var var_2651:Number = 0.0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         this.var_2652 = param1;
         this.var_2650 = param2;
         this.var_2649 = param3;
         this.var_2651 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return this.var_2652;
      }
      
      public function get rightSideLoc() : Number
      {
         return this.var_2650;
      }
      
      public function get leftSideLength() : Number
      {
         return this.var_2649;
      }
      
      public function get rightSideLength() : Number
      {
         return this.var_2651;
      }
   }
}
