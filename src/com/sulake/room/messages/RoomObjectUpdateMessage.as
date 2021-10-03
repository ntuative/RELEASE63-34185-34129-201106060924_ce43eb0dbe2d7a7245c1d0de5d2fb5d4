package com.sulake.room.messages
{
   import com.sulake.room.utils.IVector3d;
   
   public class RoomObjectUpdateMessage
   {
       
      
      protected var var_101:IVector3d;
      
      protected var var_478:IVector3d;
      
      public function RoomObjectUpdateMessage(param1:IVector3d, param2:IVector3d)
      {
         super();
         this.var_101 = param1;
         this.var_478 = param2;
      }
      
      public function get loc() : IVector3d
      {
         return this.var_101;
      }
      
      public function get dir() : IVector3d
      {
         return this.var_478;
      }
   }
}
